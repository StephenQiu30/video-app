import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  Timer? _pollTimer;
  late Duration _pollingInterval;
  late AnalysisRepository _repository;

  @override
  Future<AnalysisState> build() async {
    _repository = ref.watch(analysisRepositoryProvider);
    _pollingInterval = ref.watch(analysisPollingIntervalProvider);
    ref.onDispose(() => _pollTimer?.cancel());
    final job = await _repository.fetchLatest(
      inputKind: target.inputKind,
      sourceId: target.id,
    );
    if (job != null) {
      _schedulePoll(job);
      return AnalysisState(job: job);
    }
    return AnalysisState(
      skills: await _repository.fetchSkills(target.inputKind),
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
    if (job == null || !_isActive(job.status)) return;
    await _mutate(AnalysisAction.cancel, () => _repository.cancel(job.id));
  }

  Future<void> retry() async {
    final job = state.value?.job;
    if (job == null ||
        (job.status != AnalysisStatus.failed &&
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
    final current = state.value;
    final job = current?.job;
    if (current == null || job == null || current.busy) return;
    _setAction(current, AnalysisAction.delete);
    try {
      await _repository.delete(job.id);
      final skills = await _repository.fetchSkills(target.inputKind);
      if (!ref.mounted) return;
      _pollTimer?.cancel();
      _keys.clearAll();
      state = AsyncData(AnalysisState(skills: skills));
    } catch (error) {
      _setFailure(current, error);
      _schedulePoll(job);
    }
  }

  Future<void> refresh() async {
    final current = state.value;
    if (current == null || current.busy) return;
    _setAction(current, AnalysisAction.refresh);
    try {
      final job = await _repository.fetchLatest(
        inputKind: target.inputKind,
        sourceId: target.id,
      );
      final skills = job == null && current.skills.isEmpty
          ? await _repository.fetchSkills(target.inputKind)
          : current.skills;
      if (!ref.mounted) return;
      final next = AnalysisState(job: job, skills: skills);
      state = AsyncData(next);
      _schedulePoll(job);
    } catch (error) {
      _setFailure(current, error);
      _schedulePoll(current.job);
    }
  }

  Future<void> _mutate(
    AnalysisAction action,
    Future<AnalysisResponse> Function() operation, {
    void Function()? onSuccess,
  }) async {
    final current = state.value;
    if (current == null || current.busy) return;
    _setAction(current, action);
    try {
      final job = await operation();
      if (!ref.mounted) return;
      onSuccess?.call();
      state = AsyncData(
        current.copyWith(
          action: AnalysisAction.idle,
          clearActionError: true,
          job: job,
        ),
      );
      _schedulePoll(job);
    } catch (error) {
      _setFailure(current, error);
      _schedulePoll(current.job);
    }
  }

  void _schedulePoll(AnalysisResponse? job) {
    _pollTimer?.cancel();
    if (job == null || !_isActive(job.status)) return;
    _pollTimer = Timer(_pollingInterval, _poll);
  }

  Future<void> _poll() async {
    final current = state.value;
    final job = current?.job;
    if (!ref.mounted || current == null || job == null) return;
    try {
      final next = await _repository.fetch(job.id);
      if (!ref.mounted) return;
      state = AsyncData(current.copyWith(job: next, clearActionError: true));
      _schedulePoll(next);
    } catch (error) {
      _setFailure(current, error);
    }
  }

  void _setAction(AnalysisState current, AnalysisAction action) {
    _pollTimer?.cancel();
    state = AsyncData(current.copyWith(action: action, clearActionError: true));
  }

  void _setFailure(AnalysisState current, Object error) {
    if (!ref.mounted) return;
    state = AsyncData(
      current.copyWith(action: AnalysisAction.idle, actionError: error),
    );
  }
}

bool _isActive(AnalysisStatus status) =>
    status == AnalysisStatus.queued ||
    status == AnalysisStatus.running ||
    status == AnalysisStatus.retryWait;
