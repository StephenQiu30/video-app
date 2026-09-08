import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/analysis/application/analysis_controller.dart';
import 'package:framegrab/features/analysis/application/analysis_target.dart';
import 'package:framegrab/features/analysis/data/analysis_repository.dart';
import 'package:video_server_api/video_server_api.dart';

import 'analysis_fakes.dart';

final class DeferredAnalysisRepository implements AnalysisRepository {
  final delegate = FakeAnalysisRepository(
    latest: analysisJobFixture(status: AnalysisStatus.running),
  );
  final pollStarted = Completer<void>();
  final pollResponse = Completer<AnalysisResponse>();
  final laterPollResponse = Completer<AnalysisResponse>();
  Completer<AnalysisResponse?>? latestResponse;
  Completer<AnalysisResponse>? cancelResponse;
  Completer<void>? deleteResponse;
  int fetchCalls = 0;

  @override
  Future<AnalysisResponse> fetch(String analysisId) {
    fetchCalls += 1;
    if (fetchCalls == 1) {
      pollStarted.complete();
      return pollResponse.future;
    }
    return laterPollResponse.future;
  }

  @override
  Future<AnalysisResponse?> fetchLatest({
    required AnalysisInputKind inputKind,
    required String sourceId,
  }) =>
      latestResponse?.future ??
      delegate.fetchLatest(inputKind: inputKind, sourceId: sourceId);

  @override
  Future<List<AnalysisSkillResponse>> fetchSkills(
    AnalysisInputKind inputKind,
  ) => delegate.fetchSkills(inputKind);

  @override
  Future<AnalysisResponse> cancel(String analysisId) =>
      cancelResponse?.future ?? delegate.cancel(analysisId);

  @override
  Future<void> delete(String analysisId) =>
      deleteResponse?.future ?? delegate.delete(analysisId);

  @override
  Future<AnalysisResponse> retry({
    required String analysisId,
    required String idempotencyKey,
  }) => delegate.retry(analysisId: analysisId, idempotencyKey: idempotencyKey);

  @override
  Future<AnalysisResponse> create({
    required String customPrompt,
    required AnalysisInputKind inputKind,
    required String idempotencyKey,
    required String outputLanguage,
    required String skillId,
    required String sourceId,
  }) => delegate.create(
    customPrompt: customPrompt,
    inputKind: inputKind,
    idempotencyKey: idempotencyKey,
    outputLanguage: outputLanguage,
    skillId: skillId,
    sourceId: sourceId,
  );
}

const analysisRaceTarget = AnalysisTarget.video('download-1');
final analysisRaceProvider = analysisControllerProvider(analysisRaceTarget);

ProviderContainer analysisRaceContainer(AnalysisRepository repository) {
  final container = ProviderContainer(
    overrides: [
      analysisRepositoryProvider.overrideWithValue(repository),
      analysisPollingIntervalProvider.overrideWithValue(Duration.zero),
    ],
  );
  addTearDown(container.dispose);
  final subscription = container.listen(analysisRaceProvider, (_, _) {});
  addTearDown(subscription.close);
  return container;
}

Future<void> startAnalysisPoll(
  ProviderContainer container,
  DeferredAnalysisRepository repository,
) async {
  await container.read(analysisRaceProvider.future);
  await repository.pollStarted.future.timeout(const Duration(seconds: 1));
}

Future<void> settleAnalysisResponse() => Future<void>.delayed(Duration.zero);
