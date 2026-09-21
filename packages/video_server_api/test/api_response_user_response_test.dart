import 'package:test/test.dart';
import 'package:video_server_api/video_server_api.dart';

// tests for ApiResponseUserResponse
void main() {
  final instance = ApiResponseUserResponseBuilder();
  // TODO add properties to the builder and call build()

  group(ApiResponseUserResponse, () {
    // 稳定的业务结果码。
    // ErrorCode code
    test('to test the property `code`', () async {
      // TODO
    });

    // 安全的结果说明。
    // String message
    test('to test the property `message`', () async {
      // TODO
    });

    // 成功时为业务数据，错误时为 null。
    // UserResponse data
    test('to test the property `data`', () async {
      // TODO
    });
  });
}
