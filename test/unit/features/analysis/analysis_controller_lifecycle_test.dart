import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/analysis/application/analysis_controller.dart';
import 'package:framegrab/features/analysis/data/analysis_repository.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/analysis_fakes.dart';
import '../../../support/deferred_analysis_repository.dart';

void main() {
  for (final fails in [false, true]) {
    for (final operation in ['poll', 'cancel', 'delete', 'refresh']) {
      test(
        'ignores old $operation ${fails ? 'failure' : 'success'} after rebuild',
        () async {
          final oldRepository = DeferredAnalysisRepository();
          final container = analysisRaceContainer(oldRepository);
          await startAnalysisPoll(container, oldRepository);
          final controller = container.read(analysisRaceProvider.notifier);
          Future<void>? pending;
          switch (operation) {
            case 'cancel':
              oldRepository.cancelResponse = Completer<AnalysisResponse>();
              pending = controller.cancel();
            case 'delete':
              oldRepository.deleteResponse = Completer<void>();
              pending = controller.delete();
            case 'refresh':
              oldRepository.latestResponse = Completer<AnalysisResponse?>();
              pending = controller.refresh();
          }

          final replacement = FakeAnalysisRepository(
            latest: analysisJobFixture(),
          );
          container.updateOverrides([
            analysisRepositoryProvider.overrideWithValue(replacement),
            analysisPollingIntervalProvider.overrideWithValue(Duration.zero),
          ]);
          await container.read(analysisRaceProvider.future);
          final expected = container.read(analysisRaceProvider).requireValue;

          final oldResponse = switch (operation) {
            'cancel' => oldRepository.cancelResponse!,
            'refresh' => oldRepository.latestResponse!,
            _ => oldRepository.pollResponse,
          };
          if (operation == 'delete') {
            if (fails) {
              oldRepository.deleteResponse!.completeError(
                StateError('old delete'),
              );
            } else {
              oldRepository.deleteResponse!.complete();
            }
          } else if (fails) {
            oldResponse.completeError(StateError('old request failed'));
          } else {
            oldResponse.complete(
              analysisJobFixture(status: AnalysisStatus.running),
            );
          }
          await pending;
          await settleAnalysisResponse();

          expect(
            container.read(analysisRaceProvider).requireValue,
            same(expected),
          );
          expect(replacement.fetchCalls, 0);
          expect(replacement.skillInputKinds, isEmpty);
        },
      );
    }
  }

  test('a superseded build cannot restart polling after rebuild', () async {
    final oldRepository = DeferredAnalysisRepository()
      ..latestResponse = Completer<AnalysisResponse?>();
    final container = analysisRaceContainer(oldRepository);
    final oldFuture = container.read(analysisRaceProvider.future);
    final replacement = FakeAnalysisRepository(latest: analysisJobFixture());

    container.updateOverrides([
      analysisRepositoryProvider.overrideWithValue(replacement),
      analysisPollingIntervalProvider.overrideWithValue(Duration.zero),
    ]);
    await container.read(analysisRaceProvider.future);
    oldRepository.latestResponse!.complete(
      analysisJobFixture(status: AnalysisStatus.running),
    );
    await oldFuture;
    await settleAnalysisResponse();

    expect(replacement.fetchCalls, 0);
  });

  test('waits for the rebuilt repository before accepting actions', () async {
    final repository = DeferredAnalysisRepository();
    final container = analysisRaceContainer(repository);
    await startAnalysisPoll(container, repository);
    final replacement = DeferredAnalysisRepository()
      ..latestResponse = Completer<AnalysisResponse?>();
    container.updateOverrides([
      analysisRepositoryProvider.overrideWithValue(replacement),
      analysisPollingIntervalProvider.overrideWithValue(Duration.zero),
    ]);
    expect(container.read(analysisRaceProvider).isLoading, isTrue);

    await container.read(analysisRaceProvider.notifier).cancel();
    replacement.latestResponse!.complete(analysisJobFixture());
    await container.read(analysisRaceProvider.future);

    expect(replacement.delegate.cancelCalls, 0);
    expect(container.read(analysisRaceProvider).requireValue.job, isNotNull);
  });

  for (final fails in [false, true]) {
    for (final operation in ['poll', 'cancel', 'build']) {
      test('ignores old $operation after disposal: $fails', () async {
        final repository = DeferredAnalysisRepository();
        if (operation == 'build') {
          repository.latestResponse = Completer<AnalysisResponse?>();
        }
        final container = analysisRaceContainer(repository);
        Future<void>? pending;
        if (operation != 'build') {
          await startAnalysisPoll(container, repository);
          if (operation == 'cancel') {
            repository.cancelResponse = Completer<AnalysisResponse>();
            pending = container.read(analysisRaceProvider.notifier).cancel();
          }
        }
        container.dispose();
        final response = switch (operation) {
          'build' => repository.latestResponse!,
          'cancel' => repository.cancelResponse!,
          _ => repository.pollResponse,
        };

        if (fails) {
          response.completeError(StateError('disposed request'));
        } else {
          response.complete(analysisJobFixture(status: AnalysisStatus.running));
        }
        await pending;
        await settleAnalysisResponse();

        expect(repository.fetchCalls, operation == 'build' ? 0 : 1);
      });
    }
  }
}
