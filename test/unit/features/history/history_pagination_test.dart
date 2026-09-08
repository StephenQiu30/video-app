import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/history/application/download_history_provider.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:video_server_api/video_server_api.dart';
import '../../../support/data_fakes.dart';

final class RecordingHistory implements DownloadHistoryRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
  final queries = <({int page, String? search, DownloadStatus? status})>[];
  @override
  Future<DownloadHistoryResponse> fetchPage({
    int page = 1,
    String? search,
    DownloadStatus? status,
  }) {
    queries.add((page: page, search: search, status: status));
    return FakeDownloadHistoryRepository().fetchPage();
  }
}

void main() {
  test(
    'page changes fetch the requested page; filtering resets to page one',
    () async {
      final repository = RecordingHistory();
      final container = ProviderContainer(
        overrides: [
          downloadHistoryRepositoryProvider.overrideWithValue(repository),
        ],
      );
      addTearDown(container.dispose);
      final subscription = container.listen(downloadHistoryProvider, (_, _) {});
      addTearDown(subscription.close);
      await container.read(downloadHistoryProvider.future);
      container.read(downloadListQueryProvider.notifier).page(2);
      await container.read(downloadHistoryProvider.future);
      container
          .read(downloadListQueryProvider.notifier)
          .filter(search: 'lesson', status: DownloadStatus.retryWait.name);
      await container.read(downloadHistoryProvider.future);
      expect(repository.queries.map((q) => q.page), [1, 2, 1]);
      expect(repository.queries.last.search, 'lesson');
      expect(repository.queries.last.status, DownloadStatus.retryWait);
    },
  );
}
