import 'package:test/test.dart';
import 'package:video_server_api/video_server_api.dart';

// tests for AnalysisRequest
void main() {
  final instance = AnalysisRequestBuilder();
  // TODO add properties to the builder and call build()

  group(AnalysisRequest, () {
    // 分析 Skill 的稳定标识，由分析 Skill 清单接口提供。
    // String skillId
    test('to test the property `skillId`', () async {
      // TODO
    });

    // 分析结果使用的 BCP 47 语言标签。
    // String outputLanguage
    test('to test the property `outputLanguage`', () async {
      // TODO
    });

    // 用户可编辑的分析要求，仅影响观察重点和表达，不能覆盖工具、安全边界或结果结构。
    // String customPrompt
    test('to test the property `customPrompt`', () async {
      // TODO
    });
  });
}
