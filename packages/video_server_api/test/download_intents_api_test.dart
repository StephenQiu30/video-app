import 'package:test/test.dart';
import 'package:video_server_api/video_server_api.dart';

/// tests for DownloadIntentsApi
void main() {
  final instance = VideoServerApi().getDownloadIntentsApi();

  group(DownloadIntentsApi, () {
    // 取消当前用户的解析意图
    //
    //Future<ApiResponseIntentResponse> cancelDownloadIntent(String intentId) async
    test('test cancelDownloadIntent', () async {
      // TODO
    });

    // 提交持久解析意图
    //
    //Future<ApiResponseIntentResponse> createDownloadIntent(String idempotencyKey, IntentRequest intentRequest) async
    test('test createDownloadIntent', () async {
      // TODO
    });

    // 按幂等键找回当前用户已提交的解析意图
    //
    //Future<ApiResponseIntentResponse> findDownloadIntent(String idempotencyKey) async
    test('test findDownloadIntent', () async {
      // TODO
    });

    // 查询当前用户的解析意图
    //
    //Future<ApiResponseIntentResponse> getDownloadIntent(String intentId) async
    test('test getDownloadIntent', () async {
      // TODO
    });

    // 分页查询当前用户的解析记录
    //
    //Future<ApiResponseIntentHistoryResponse> listDownloadIntents({ String before, int limit }) async
    test('test listDownloadIntents', () async {
      // TODO
    });

    // 在原意图与剩余预算内更新过期解析结果
    //
    //Future<ApiResponseIntentResponse> refreshDownloadIntent(String intentId) async
    test('test refreshDownloadIntent', () async {
      // TODO
    });
  });
}
