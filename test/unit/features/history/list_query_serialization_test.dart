import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:video_server_api/video_server_api.dart';
import '../../../support/data_fakes.dart';

void main() {
  test(
    'unset filters are omitted; selected false and enums are serialized',
    () async {
      final client = VideoServerApi();
      final sent = <Map<String, dynamic>>[];
      client.dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            sent.add(Map.of(options.queryParameters));
            final data = options.path.contains('/history')
                ? client.serializers.serializeWith(
                    DownloadHistoryResponse.serializer,
                    emptyDownloadHistory(),
                  )
                : {'items': <Object>[], 'page': 1, 'page_size': 20, 'total': 0};
            handler.resolve(
              Response(requestOptions: options, statusCode: 200, data: data),
            );
          },
        ),
      );
      final request = AuthenticatedRequest(
        client: client,
        accessToken: () => 'synthetic-access',
        sessionGeneration: () => 0,
        expireSession: () async {},
        refreshSession: () async => false,
      );
      await GeneratedDownloadHistoryRepository(request).fetchPage(page: 2);
      expect(sent.last, {'page': 2, 'page_size': 20});
      await GeneratedDownloadHistoryRepository(
        request,
      ).fetchPage(status: DownloadStatus.retryWait, search: 'lesson');
      expect(sent.last['status'], 'retry_wait');
      expect(sent.last['search'], 'lesson');
      await GeneratedAdminRepository(request).fetchUsers();
      expect(sent.last, {'page': 1, 'page_size': 20});
      await GeneratedAdminRepository(
        request,
      ).fetchUsers(active: false, role: UserRole.user);
      expect(sent.last['is_active'], false);
      expect(sent.last['role'], 'user');
    },
  );
}
