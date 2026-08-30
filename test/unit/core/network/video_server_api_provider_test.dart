import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/config/app_config.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';

void main() {
  test('uses the server request budget instead of generator defaults', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final client = container.read(videoServerApiProvider);

    expect(AppConfig.serverBaseUrl, 'http://127.0.0.1:8111');
    expect(client.dio.options.connectTimeout, AppConfig.apiConnectTimeout);
    expect(client.dio.options.receiveTimeout, AppConfig.apiReceiveTimeout);
    expect(client.dio.options.baseUrl, AppConfig.serverBaseUrl);
  });
}
