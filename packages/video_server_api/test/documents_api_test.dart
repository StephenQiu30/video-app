import 'package:test/test.dart';
import 'package:video_server_api/video_server_api.dart';

/// tests for DocumentsApi
void main() {
  final instance = VideoServerApi().getDocumentsApi();

  group(DocumentsApi, () {
    // 查询剧本文档列表
    //
    //Future<DocumentPageResponse> listDocuments({ int page, int pageSize }) async
    test('test listDocuments', () async {
      // TODO
    });
  });
}
