import 'package:test/test.dart';
import 'package:video_server_api/video_server_api.dart';

/// tests for AnalysesApi
void main() {
  final instance = VideoServerApi().getAnalysesApi();

  group(AnalysesApi, () {
    // 取消视频分析任务
    //
    // 请求取消尚未结束的视频分析任务。
    //
    //Future<AnalysisResponse> cancelAnalysis(String analysisId) async
    test('test cancelAnalysis', () async {
      // TODO
    });

    // 创建视频分析任务
    //
    // 基于已完成的下载制品创建异步 AI 分析任务。
    //
    //Future<AnalysisResponse> createAnalysis(String downloadId, String idempotencyKey, AnalysisRequest analysisRequest) async
    test('test createAnalysis', () async {
      // TODO
    });

    // 删除视频分析与报告
    //
    // 隐藏分析任务并异步清理其私有报告对象。
    //
    //Future deleteAnalysis(String analysisId) async
    test('test deleteAnalysis', () async {
      // TODO
    });

    // 查询视频分析任务
    //
    // 查询分析进度及经过证据校验的结果。
    //
    //Future<AnalysisResponse> getAnalysis(String analysisId) async
    test('test getAnalysis', () async {
      // TODO
    });

    // 读取下载任务最近的视频分析
    //
    // 恢复当前用户在该下载任务上最近创建的分析与报告。
    //
    //Future<AnalysisResponse> getLatestDownloadAnalysis(String downloadId) async
    test('test getLatestDownloadAnalysis', () async {
      // TODO
    });

    // 列出输入兼容的分析 Skill
    //
    // 按输入类型返回可选 Skill 及用户可编辑的默认提示词。
    //
    //Future<BuiltList<AnalysisSkillResponse>> listAnalysisSkills(AnalysisInputKind inputKind) async
    test('test listAnalysisSkills', () async {
      // TODO
    });

    // 重试原视频分析任务
    //
    // 为同一分析任务创建下一执行代次，不改变任务资源 ID。  Retry 是上一运行的无参数重放；带请求体的请求按校验错误拒绝。
    //
    //Future<AnalysisResponse> retryAnalysis(String analysisId, String idempotencyKey) async
    test('test retryAnalysis', () async {
      // TODO
    });
  });
}
