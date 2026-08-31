import 'package:test/test.dart';
import 'package:video_server_api/video_server_api.dart';

/// tests for MediaImportsApi
void main() {
  final instance = VideoServerApi().getMediaImportsApi();

  group(MediaImportsApi, () {
    // 完成视频上传并触发验证
    //
    //Future<MediaImportResponse> completeMediaImport(String resourceId, CompleteMediaImportRequest completeMediaImportRequest) async
    test('test completeMediaImport', () async {
      // TODO
    });

    // 创建本地视频导入
    //
    // 创建只接受 MP4 的浏览器上传资源，不接收任意存储参数。
    //
    //Future<MediaImportResponse> createMediaImport(String idempotencyKey, MediaImportRequest mediaImportRequest) async
    test('test createMediaImport', () async {
      // TODO
    });

    // 创建或刷新视频上传会话
    //
    //Future<MediaUploadSessionResponse> createMediaUploadSession(String resourceId) async
    test('test createMediaUploadSession', () async {
      // TODO
    });
  });
}
