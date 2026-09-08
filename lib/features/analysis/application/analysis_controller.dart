import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/analysis/application/analysis_job_snapshot.dart';
import 'package:framegrab/features/analysis/application/analysis_operation_keys.dart';
import 'package:framegrab/features/analysis/application/analysis_state.dart';
import 'package:framegrab/features/analysis/application/analysis_target.dart';
import 'package:framegrab/features/analysis/data/analysis_repository.dart';
import 'package:video_server_api/video_server_api.dart';

const analysisPollingInterval = Duration(seconds: 2);

final analysisPollingIntervalProvider = Provider<Duration>(
  (_) => analysisPollingInterval,
);

final analysisControllerProvider = AsyncNotifierProvider.autoDispose
    .family<AnalysisController, AnalysisState, AnalysisTarget>(
      AnalysisController.new,
    );

final class AnalysisController extends AsyncNotifier<AnalysisState> {
  AnalysisController(this.target);

  final AnalysisTarget target;
  final _keys = AnalysisOperationKeys();
  int _generation = 0;
  Timer? _pollTimer;
  late Duration _pollingInterval;
  late AnalysisRepository _repository;

  @override
  Future<AnalysisState> build() async {
    final generation = _invalidateRequests();
    final repository = _repository = ref.watch(analysisRepositoryProvider);
    _pollingInterval = ref.watch(analysisPollingIntervalProvider);
    ref.onDispose(_invalidateRequests);
    final job = await repository.fetchLatest(
      inputKind: target.inputKind,
      sourceId: target.id,
    );
    if (!_isCurrent(generation)) return const AnalysisState();
    if (job != null) {
      _schedulePoll(job);
      return AnalysisState(job: job);
    }
    return AnalysisState(
      skills: await repository.fetchSkills(target.inputKind),
    );
  }

  Future<void> start({
    required String customPrompt,
    required String outputLanguage,
    required String skillId,
  }) async {
    final payload =
        '${target.inputKind.name}\u0000${target.id}\u0000$skillId\u0000'
        '$outputLanguage\u0000$customPrompt';
    await _mutate(
      AnalysisAction.start,
      () => _repository.create(
        customPrompt: customPrompt,
        inputKind: target.inputKind,
        idempotencyKey: _keys.value('create', payload),
        outputLanguage: outputLanguage,
        skillId: skillId,
        sourceId: target.id,
      ),
    );
  }

  Future<void> cancel() async {
    final job = state.value?.job;
    if (job == null || !isActiveAnalysis(job)) return;
    await _mutate(AnalysisAction.cancel, () => _repository.cancel(job.id));
  }

  Future<void> retry() async {
    final job = state.value?.job;
    if (job == null ||
        (job.status != AnalysisStatus.succeeded &&
            job.status != AnalysisStatus.failed &&
            job.status != AnalysisStatus.cancelled)) {
      return;
    }
    await _mutate(
      AnalysisAction.retry,
      () => _repository.retry(
        analysisId: job.id,
        idempotencyKey: _keys.value('retry', job.id),
      ),
      onSuccess: () => _keys.clear('retry'),
    );
  }

  Future<void> delete() async {
    final job = state.value?.job;
    if (job == null) return;
    await _runAction(AnalysisAction.delete, (current, generation) async {
      final repository = _repository;
      await repository.delete(job.id);
      if (!_isCurrent(generation)) return current;
      return AnalysisState(
        skills: await repository.fetchSkills(target.inputKind),
      );
    }, onSuccess: _keys.clearAll);
  }

  Future<void> refresh() =>
      _runAction(AnalysisAction.refresh, (current, generation) async {
        final repository = _repository;
        final job = await repository.fetchLatest(
          inputKind: target.inputKind,
          sourceId: target.id,
        );
        if (!_isCurrent(generation)) return current;
        final skills = job == null && current.skills.isEmpty
            ? await repository.fetchSkills(target.inputKind)
            : current.skills;
        return AnalysisState(
          job: latestAnalysisJob(current.job, job),
          skills: skills,
        );
      });

  Future<void> _mutate(
    AnalysisAction action,
    Future<AnalysisResponse> Function() operation, {
    void Function()? onSuccess,
  }) => _runAction(
    action,
    (current, _) async => current.copyWith(
      job: latestAnalysisJob(current.job, await operation()),
    ),
    onSuccess: onSuccess,
  );

  Future<void> _runAction(
    AnalysisAction action,
    Future<AnalysisState> Function(AnalysisState, int) operation, {
    void Function()? onSuccess,
  }) async {
    final current = state.value;
    if (current == null || current.busy || state.isLoading) return;
    final generation = _invalidateRequests();
    state = AsyncData(current.copyWith(action: action, clearActionError: true));
    try {
      final next = await operation(current, generation);
      if (!_isCurrent(generation)) return;
      onSuccess?.call();
      state = AsyncData(
        next.copyWith(action: AnalysisAction.idle, clearActionError: true),
      );
      _schedulePoll(next.job);
    } catch (error) {
      if (!_isCurrent(generation)) return;
      _setFailure(current, error);
      _schedulePoll(current.job);
    }
  }

  void _schedulePoll(AnalysisResponse? job) {
    _pollTimer?.cancel();
    if (!isActiveAnalysis(job)) return;
    final generation = _generation;
    _pollTimer = Timer(_pollingInterval, () => _poll(generation));
  }

  Future<void> _poll(int generation) async {
    if (!_isCurrent(generation)) return;
    final current = state.value;
    final job = current?.job;
    if (current == null || current.busy || job == null) return;
    try {
      final response = await _repository.fetch(job.id);
      if (!_isCurrent(generation)) return;
      final next = latestAnalysisJob(job, response);
      state = AsyncData(current.copyWith(job: next, clearActionError: true));
      _schedulePoll(next);
    } catch (error) {
      if (!_isCurrent(generation)) return;
      _setFailure(current, error);
    }
  }

  int _invalidateRequests() {
    _pollTimer?.cancel();
    return ++_generation;
  }

  bool _isCurrent(int generation) => ref.mounted && generation == _generation;

  void _setFailure(AnalysisState current, Object error) {
    if (!ref.mounted) return;
    state = AsyncData(
      current.copyWith(action: AnalysisAction.idle, actionError: error),
    );
  }
}
