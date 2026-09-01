import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/history/application/download_detail_provider.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/intake_fakes.dart';

void main() {
  test('polls active download until the first terminal state', () async {
    final repository = _SequencedDownloadHistoryRepository([
      _job(DownloadStatus.queued, progress: 0),
      _job(DownloadStatus.running, progress: 42),
      _job(DownloadStatus.succeeded, progress: 100),
    ]);
    final container = ProviderContainer(
      overrides: [
        downloadHistoryRepositoryProvider.overrideWithValue(repository),
        downloadDetailPollingIntervalProvider.overrideWithValue(Duration.zero),
      ],
    );
    addTearDown(container.dispose);
    final statuses = <DownloadStatus>[];
    final terminal = Completer<void>();
    final subscription = container.listen(downloadDetailProvider('job-1'), (
      _,
      next,
    ) {
      final value = next.value;
      if (value == null) return;
      statuses.add(value.status);
      if (value.status == DownloadStatus.succeeded && !terminal.isCompleted) {
        terminal.complete();
      }
    });
    addTearDown(subscription.close);

    await terminal.future.timeout(const Duration(seconds: 1));
    await Future<void>.delayed(Duration.zero);

    expect(statuses, [
      DownloadStatus.queued,
      DownloadStatus.running,
      DownloadStatus.succeeded,
    ]);
    expect(repository.detailCalls, 3);
  });
}

DownloadResponse _job(DownloadStatus status, {required int progress}) =>
    intakeDownloadFixture().rebuild(
      (builder) => builder
        ..status = status
        ..progress = progress
        ..fileAvailable = status == DownloadStatus.succeeded,
    );

final class _SequencedDownloadHistoryRepository
    implements DownloadHistoryRepository {
  _SequencedDownloadHistoryRepository(this.responses);

  final List<DownloadResponse> responses;
  int detailCalls = 0;

  @override
  Future<DownloadResponse> fetchDetail(String jobId) async {
    final index = detailCalls.clamp(0, responses.length - 1);
    detailCalls += 1;
    return responses[index];
  }

  @override
  Future<void> delete(String jobId) => throw UnimplementedError();

  @override
  Future<DownloadResponse> cancel(String jobId) => throw UnimplementedError();

  @override
  Future<DownloadHistoryResponse> fetchFirstPage() =>
      throw UnimplementedError();

  @override
  Future<DownloadResponse> retry(String jobId) => throw UnimplementedError();
}
