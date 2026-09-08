import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/analysis/application/analysis_state.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/analysis_fakes.dart';
import '../../../support/deferred_analysis_repository.dart';

void main() {
  for (final action in ['cancel', 'delete', 'retry', 'refresh']) {
    for (final fails in [false, true]) {
      test(
        'ignores late poll ${fails ? 'failure' : 'success'} after $action',
        () async {
          final repository = DeferredAnalysisRepository();
          final container = analysisRaceContainer(repository);
          await startAnalysisPoll(container, repository);
          final controller = container.read(analysisRaceProvider.notifier);

          switch (action) {
            case 'cancel':
              await controller.cancel();
            case 'delete':
              await controller.delete();
            case 'retry':
              await controller.cancel();
              await controller.retry();
            case 'refresh':
              repository.delegate.latest = analysisJobFixture();
              await controller.refresh();
          }
          final expected = container.read(analysisRaceProvider).requireValue;
          if (fails) {
            repository.pollResponse.completeError(
              StateError('old poll failed'),
            );
          } else {
            repository.pollResponse.complete(
              analysisJobFixture(status: AnalysisStatus.running),
            );
          }
          await settleAnalysisResponse();

          expect(
            container.read(analysisRaceProvider).requireValue,
            same(expected),
          );
          expect(repository.fetchCalls, action == 'retry' ? 2 : 1);
        },
      );
    }
  }

  for (final fails in [false, true]) {
    test('keeps a pending cancellation busy after late poll $fails', () async {
      final repository = DeferredAnalysisRepository()
        ..cancelResponse = Completer<AnalysisResponse>();
      final container = analysisRaceContainer(repository);
      await startAnalysisPoll(container, repository);
      final cancellation = container
          .read(analysisRaceProvider.notifier)
          .cancel();

      if (fails) {
        repository.pollResponse.completeError(StateError('old poll failed'));
      } else {
        repository.pollResponse.complete(analysisJobFixture());
      }
      await settleAnalysisResponse();
      final during = container.read(analysisRaceProvider).requireValue;
      repository.cancelResponse!.complete(
        analysisJobFixture(status: AnalysisStatus.cancelled),
      );
      await cancellation;

      expect(during.action, AnalysisAction.cancel);
      expect(during.actionError, isNull);
      expect(repository.fetchCalls, 1);
    });
  }

  test('keeps the current action error when an earlier poll fails', () async {
    final actionError = StateError('cancel failed');
    final repository = DeferredAnalysisRepository();
    final container = analysisRaceContainer(repository);
    await startAnalysisPoll(container, repository);
    repository.delegate.error = actionError;
    await container.read(analysisRaceProvider.notifier).cancel();
    repository.pollResponse.completeError(StateError('old poll failed'));
    await settleAnalysisResponse();

    expect(
      container.read(analysisRaceProvider).requireValue.actionError,
      same(actionError),
    );
  });

  for (final staleRun in [false, true]) {
    for (final refresh in [false, true]) {
      test('rejects older ${staleRun ? 'run' : 'version'} from '
          '${refresh ? 'refresh' : 'poll'} and keeps polling', () async {
        final current = analysisJobFixture(
          status: AnalysisStatus.running,
          runNo: 2,
        ).rebuild((builder) => builder.version = 5);
        final stale = analysisJobFixture(
          status: AnalysisStatus.succeeded,
          runNo: staleRun ? 1 : 2,
        ).rebuild((builder) => builder.version = staleRun ? 99 : 4);
        final repository = DeferredAnalysisRepository()
          ..delegate.latest = current;
        final container = analysisRaceContainer(repository);
        await startAnalysisPoll(container, repository);

        if (refresh) {
          repository.delegate.latest = stale;
          await container.read(analysisRaceProvider.notifier).refresh();
        } else {
          repository.pollResponse.complete(stale);
        }
        await settleAnalysisResponse();
        expect(container.read(analysisRaceProvider).requireValue.job, current);
        await settleAnalysisResponse();
        expect(repository.fetchCalls, 2);

        repository.laterPollResponse.complete(
          current.rebuild(
            (builder) => builder
              ..status = AnalysisStatus.succeeded
              ..version = 6,
          ),
        );
        await settleAnalysisResponse();
        expect(
          container.read(analysisRaceProvider).requireValue.job?.status,
          AnalysisStatus.succeeded,
        );
      });
    }
  }

  test('refresh accepts a different analysis with a lower version', () async {
    final repository = DeferredAnalysisRepository();
    final container = analysisRaceContainer(repository);
    await startAnalysisPoll(container, repository);
    final replacement = analysisJobFixture().rebuild(
      (builder) => builder
        ..id = '00000000-0000-0000-0000-000000000499'
        ..version = 0,
    );
    repository.delegate.latest = replacement;

    await container.read(analysisRaceProvider.notifier).refresh();

    expect(container.read(analysisRaceProvider).requireValue.job, replacement);
  });
}
