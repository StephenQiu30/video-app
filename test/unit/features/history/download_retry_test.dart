import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/history/application/download_retry.dart';
import 'package:framegrab/features/history/presentation/download_presentation_labels.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/data_fakes.dart';

void main() {
  test(
    'lost response keeps the key; confirmed completion starts a new operation',
    () async {
      final keys = <String>[];
      var sequence = 0;
      final operation = DownloadRetry(
        execute: (key) async {
          keys.add(key);
          if (keys.length == 1) {
            throw const DataRequestFailure(DataRequestFailureKind.unavailable);
          }
          return downloadDetailFixture(jobId: key);
        },
        sessionGeneration: () => 0,
        newKey: () => 'operation-${++sequence}',
      );
      await expectLater(operation.run(), throwsA(isA<DataRequestFailure>()));
      expect((await operation.run()).id, 'operation-1');
      expect((await operation.run()).id, 'operation-2');
      expect(keys, ['operation-1', 'operation-1', 'operation-2']);
    },
  );

  test('concurrent clicks share one in-flight operation', () async {
    final pending = Completer<DownloadResponse>();
    var calls = 0;
    final operation = DownloadRetry(
      execute: (_) {
        calls++;
        return pending.future;
      },
      sessionGeneration: () => 0,
    );
    final first = operation.run();
    final second = operation.run();
    expect(identical(first, second), isTrue);
    pending.complete(downloadDetailFixture());
    await Future.wait([first, second]);
    expect(calls, 1);
  });

  test(
    'account change rejects old completion and does not reuse its key',
    () async {
      var generation = 0;
      var sequence = 0;
      final keys = <String>[];
      final old = Completer<DownloadResponse>();
      final operation = DownloadRetry(
        execute: (key) {
          keys.add(key);
          return keys.length == 1
              ? old.future
              : Future.value(downloadDetailFixture(jobId: key));
        },
        sessionGeneration: () => generation,
        newKey: () => 'operation-${++sequence}',
      );
      final first = operation.run();
      final rejected = expectLater(first, throwsA(isA<DataRequestFailure>()));
      generation++;
      expect((await operation.run()).id, 'operation-2');
      old.complete(downloadDetailFixture());
      await rejected;
      expect(keys, ['operation-1', 'operation-2']);
    },
  );

  for (final status in [
    DownloadStatus.failed,
    DownloadStatus.cancelled,
    DownloadStatus.succeeded,
  ]) {
    for (final source in DownloadSourceKind.values) {
      test('$source $status recovery respects source kind', () {
        expect(
          downloadRecovery(
            sourceKind: source,
            status: status,
            fileAvailable: false,
          ),
          source == DownloadSourceKind.remoteProvider
              ? DownloadRecovery.retry
              : DownloadRecovery.reimport,
        );
      });
    }
  }
  test('active and available resources have no recovery action', () {
    for (final status in [
      DownloadStatus.queued,
      DownloadStatus.running,
      DownloadStatus.retryWait,
      DownloadStatus.succeeded,
    ]) {
      expect(
        downloadRecovery(
          sourceKind: DownloadSourceKind.browserImport,
          status: status,
          fileAvailable: true,
        ),
        isNull,
      );
    }
  });
}
