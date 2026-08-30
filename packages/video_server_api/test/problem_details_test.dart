import 'package:test/test.dart';
import 'package:video_server_api/video_server_api.dart';

// tests for ProblemDetails
void main() {
  final instance = ProblemDetailsBuilder();
  // TODO add properties to the builder and call build()

  group(ProblemDetails, () {
    // 稳定的服务错误类型 URI。
    // String type
    test('to test the property `type`', () async {
      // TODO
    });

    // 面向调用方的简短错误标题。
    // String title
    test('to test the property `title`', () async {
      // TODO
    });

    // HTTP 状态码。
    // int status
    test('to test the property `status`', () async {
      // TODO
    });

    // 不包含敏感信息的错误说明。
    // String detail
    test('to test the property `detail`', () async {
      // TODO
    });

    // 供客户端分支处理的稳定错误码。
    // String code
    test('to test the property `code`', () async {
      // TODO
    });

    // 产生错误的请求路径。
    // String instance
    test('to test the property `instance`', () async {
      // TODO
    });
  });
}
