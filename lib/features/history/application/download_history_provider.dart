import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:video_server_api/video_server_api.dart';

final downloadHistoryProvider =
    FutureProvider.autoDispose<DownloadHistoryResponse>(
      (ref) => ref.watch(downloadHistoryRepositoryProvider).fetchFirstPage(),
      retry: (_, _) => null,
    );
