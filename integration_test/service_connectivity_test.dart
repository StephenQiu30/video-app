import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/config/app_config.dart';
import 'package:framegrab/core/network/dio_http_client.dart';
import 'package:integration_test/integration_test.dart';
import 'package:video_server_api/video_server_api.dart';

// Runs on the target device without signing in or touching secure storage.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late DioHttpClient client;
  setUp(() {
    client = DioHttpClient(
      baseUrl: AppConfig.serverBaseUrl,
      connectTimeout: AppConfig.apiConnectTimeout,
      receiveTimeout: const Duration(seconds: 15),
    );
  });
  tearDown(() => client.close());

  testWidgets('device reaches the configured API over verified TLS', (_) async {
    expect(Uri.parse(AppConfig.serverBaseUrl).scheme, 'https');
    final clock = Stopwatch()..start();
    try {
      final response = await client.dio.get<Object>('/health/ready');
      debugPrint(
        'readiness HTTP=${response.statusCode}; ms=${clock.elapsedMilliseconds}',
      );
      expect(response.statusCode, 200);
      expect(response.data, {'status': 'ok', 'service': 'api'});
    } on DioException catch (error) {
      fail(_transportFailure(error));
    }
  });

  testWidgets('native login reaches validation without account credentials', (
    _,
  ) async {
    final clock = Stopwatch()..start();
    try {
      await client.api.getAppAuthApi().loginNativeUser(
        emailPasswordRequest: EmailPasswordRequest(
          (builder) => builder
            ..email = ''
            ..password = '',
        ),
      );
      fail('Empty credentials must not create a session.');
    } on DioException catch (error) {
      debugPrint(
        'login validation HTTP=${error.response?.statusCode}; ms=${clock.elapsedMilliseconds}',
      );
      expect(error.response?.statusCode, 422, reason: _transportFailure(error));
    }
  });
}

String _transportFailure(DioException error) {
  // Never print request bodies, credentials, URLs, or response bodies.
  final cause = error.error;
  final osCode = cause is SocketException ? cause.osError?.errorCode : null;
  return 'transport=${error.type.name}; cause=${cause.runtimeType}; '
      'osCode=$osCode; httpStatus=${error.response?.statusCode}';
}
