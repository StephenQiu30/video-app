import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:video_server_api/video_server_api.dart';

final downloadDetailProvider = FutureProvider.autoDispose
    .family<DownloadResponse, String>(
      (ref, jobId) =>
          ref.watch(downloadHistoryRepositoryProvider).fetchDetail(jobId),
      retry: (_, _) => null,
    );
