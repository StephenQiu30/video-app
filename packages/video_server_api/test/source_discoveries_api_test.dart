import 'package:test/test.dart';
import 'package:video_server_api/video_server_api.dart';

/// tests for SourceDiscoveriesApi
void main() {
  final instance = VideoServerApi().getSourceDiscoveriesApi();

  group(SourceDiscoveriesApi, () {
    // 发现微信公众号文章中的视频
    //
    //Future<SourceDiscoveryResponse> createSourceDiscovery(String idempotencyKey, SourceDiscoveryRequest sourceDiscoveryRequest) async
    test('test createSourceDiscovery', () async {
      // TODO
    });

    // 查询文章视频发现结果
    //
    //Future<SourceDiscoveryResponse> getSourceDiscovery(String discoveryId) async
    test('test getSourceDiscovery', () async {
      // TODO
    });
  });
}
