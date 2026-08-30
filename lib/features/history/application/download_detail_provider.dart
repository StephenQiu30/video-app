import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:video_server_api/video_server_api.dart';

const downloadDetailPollingInterval = Duration(seconds: 2);

final downloadDetailPollingIntervalProvider = Provider<Duration>(
  (_) => downloadDetailPollingInterval,
);

final downloadDetailProvider = StreamProvider.autoDispose
    .family<DownloadResponse, String>((ref, jobId) async* {
      final repository = ref.watch(downloadHistoryRepositoryProvider);
      final pollingInterval = ref.watch(downloadDetailPollingIntervalProvider);
      var job = await repository.fetchDetail(jobId);
      yield job;

      while (_isActive(job.status)) {
        await Future<void>.delayed(pollingInterval);
        job = await repository.fetchDetail(jobId);
        yield job;
      }
    }, retry: (_, _) => null);

bool _isActive(DownloadStatus status) =>
    status == DownloadStatus.queued ||
    status == DownloadStatus.running ||
    status == DownloadStatus.retryWait;
