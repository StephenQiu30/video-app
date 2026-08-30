import 'package:test/test.dart';
import 'package:video_server_api/video_server_api.dart';

/// tests for ProvidersApi
void main() {
  final instance = VideoServerApi().getProvidersApi();

  group(ProvidersApi, () {
    // 查询平台能力状态
    //
    // 返回不含凭据、出口地址和 Canary 目标的能力快照。
    //
    //Future<ProviderListResponse> listProviders() async
    test('test listProviders', () async {
      // TODO
    });
  });
}
