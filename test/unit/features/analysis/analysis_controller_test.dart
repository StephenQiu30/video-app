import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/analysis/application/analysis_controller.dart';
import 'package:framegrab/features/analysis/data/analysis_repository.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/analysis_fakes.dart';

void main() {
  test(
    'loads the real skill catalog when no previous analysis exists',
    () async {
      final repository = FakeAnalysisRepository();
      final container = _container(repository);
      addTearDown(container.dispose);

      final state = await container.read(
        analysisControllerProvider('download-1').future,
      );

      expect(state.job, isNull);
      expect(state.skills.single.displayName, '导演拉片');
      expect(repository.latestCalls, 1);
    },
  );

  test('reuses the create idempotency key after a safe retry', () async {
    final repository = FakeAnalysisRepository(
      createError: StateError('offline'),
    );
    final container = _container(repository);
    addTearDown(container.dispose);
    await container.read(analysisControllerProvider('download-1').future);
    final controller = container.read(
      analysisControllerProvider('download-1').notifier,
    );

    await controller.start(
      customPrompt: '关注节奏',
      outputLanguage: 'zh-CN',
      skillId: 'director-breakdown',
    );
    repository.createError = null;
    await controller.start(
      customPrompt: '关注节奏',
      outputLanguage: 'zh-CN',
      skillId: 'director-breakdown',
    );

    expect(repository.createKeys, hasLength(2));
    expect(repository.createKeys.first, repository.createKeys.last);
    expect(
      container.read(analysisControllerProvider('download-1')).value?.job,
      isNotNull,
    );
  });

  test('polls an active analysis until its first terminal state', () async {
    final repository =
        FakeAnalysisRepository(
            latest: analysisJobFixture(status: AnalysisStatus.queued),
          )
          ..fetchResults.addAll([
            analysisJobFixture(status: AnalysisStatus.running),
            analysisJobFixture(status: AnalysisStatus.succeeded),
          ]);
    final container = _container(repository, pollingInterval: Duration.zero);
    addTearDown(container.dispose);
    final terminal = Completer<void>();
    final subscription = container.listen(
      analysisControllerProvider('download-1'),
      (_, next) {
        if (next.value?.job?.status == AnalysisStatus.succeeded &&
            !terminal.isCompleted) {
          terminal.complete();
        }
      },
    );
    addTearDown(subscription.close);

    await terminal.future.timeout(const Duration(seconds: 1));

    expect(repository.fetchCalls, 2);
    expect(
      container
          .read(analysisControllerProvider('download-1'))
          .value
          ?.job
          ?.status,
      AnalysisStatus.succeeded,
    );
  });

  test('cancels an active analysis and stops polling it', () async {
    final repository = FakeAnalysisRepository(
      latest: analysisJobFixture(status: AnalysisStatus.running),
    );
    final container = _container(repository);
    addTearDown(container.dispose);
    await container.read(analysisControllerProvider('download-1').future);

    await container
        .read(analysisControllerProvider('download-1').notifier)
        .cancel();

    expect(repository.cancelCalls, 1);
    expect(
      container
          .read(analysisControllerProvider('download-1'))
          .value
          ?.job
          ?.status,
      AnalysisStatus.cancelled,
    );
  });

  test(
    'deletes only the analysis and restores the skill configurator',
    () async {
      final repository = FakeAnalysisRepository(
        latest: analysisJobFixture(status: AnalysisStatus.succeeded),
      );
      final container = _container(repository);
      addTearDown(container.dispose);
      await container.read(analysisControllerProvider('download-1').future);

      await container
          .read(analysisControllerProvider('download-1').notifier)
          .delete();

      final state = container
          .read(analysisControllerProvider('download-1'))
          .value;
      expect(repository.deleteCalls, 1);
      expect(state?.job, isNull);
      expect(state?.skills.single.id, 'director-breakdown');
    },
  );
}

ProviderContainer _container(
  AnalysisRepository repository, {
  Duration pollingInterval = const Duration(days: 1),
}) => ProviderContainer(
  overrides: [
    analysisRepositoryProvider.overrideWithValue(repository),
    analysisPollingIntervalProvider.overrideWithValue(pollingInterval),
  ],
);
