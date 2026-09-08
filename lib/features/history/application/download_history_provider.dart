import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:video_server_api/video_server_api.dart';

final downloadHistoryProvider =
    FutureProvider.autoDispose<DownloadHistoryResponse>(
      (ref) => ref
          .watch(downloadHistoryRepositoryProvider)
          .fetchPage(
            page: ref.watch(downloadListQueryProvider).page,
            search: ref.watch(downloadListQueryProvider).search,
            status: ref.watch(downloadListQueryProvider).status == null
                ? null
                : DownloadStatus.valueOf(
                    ref.watch(downloadListQueryProvider).status!,
                  ),
          ),
      retry: (_, _) => null,
    );

final downloadListQueryProvider =
    NotifierProvider.autoDispose<ListQueryController, ListQuery>(
      ListQueryController.new,
    );
