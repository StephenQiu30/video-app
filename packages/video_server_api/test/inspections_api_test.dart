import 'package:test/test.dart';
import 'package:video_server_api/video_server_api.dart';

/// tests for InspectionsApi
void main() {
  final instance = VideoServerApi().getInspectionsApi();

  group(InspectionsApi, () {
    // 读取持久化媒体封面
    //
    // 读取当前用户拥有且存储在私有对象存储中的媒体封面。
    //
    //Future getInspectionThumbnail(String inspectionId) async
    test('test getInspectionThumbnail', () async {
      // TODO
    });
  });
}
