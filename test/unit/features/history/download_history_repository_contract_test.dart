import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:video_server_api/video_server_api.dart';

void main() {
  test('unwraps the current API envelope into download history data', () async {
    final dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          expect(options.path, '/api/downloads/history');
          handler.resolve(
            Response<Map<String, Object?>>(
              requestOptions: options,
              statusCode: 200,
              data: {
                'code': 'ok',
                'message': 'ok',
                'data': {
                  'items': <Object?>[],
                  'page': 1,
                  'page_size': 20,
                  'total': 75,
                  'summary': {
                    'total': 75,
                    'succeeded': 74,
                    'active': 0,
                    'failed': 1,
                  },
                },
              },
            ),
          );
        },
      ),
    );
    final request = AuthenticatedRequest(
      client: VideoServerApi(dio: dio),
      accessToken: () => 'test-access-token',
      sessionGeneration: () => 0,
      refreshSession: () async => false,
      expireSession: () async {},
    );
    final repository = GeneratedDownloadHistoryRepository(request);

    final history = await repository.fetchPage();

    expect(history.total, 75);
    expect(history.summary.succeeded, 74);
    expect(history.items, isEmpty);
  });
}
