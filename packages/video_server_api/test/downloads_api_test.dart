import 'package:test/test.dart';
import 'package:video_server_api/video_server_api.dart';

/// tests for DownloadsApi
void main() {
  final instance = VideoServerApi().getDownloadsApi();

  group(DownloadsApi, () {
    // 查询下载任务
    //
    // 查询当前登录用户拥有的下载任务。
    //
    //Future<DownloadResponse> getDownload(String jobId) async
    test('test getDownload', () async {
      // TODO
    });

    // 查询下载历史
    //
    // 查询当前登录用户的下载历史。
    //
    //Future<DownloadHistoryResponse> getDownloadHistory({ int page, int pageSize }) async
    test('test getDownloadHistory', () async {
      // TODO
    });
  });
}
