import 'package:test/test.dart';
import 'package:video_server_api/video_server_api.dart';

/// tests for UsersApi
void main() {
  final instance = VideoServerApi().getUsersApi();

  group(UsersApi, () {
    // 更新当前用户资料
    //
    //Future<UserResponse> updateCurrentUser(UpdateProfileRequest updateProfileRequest) async
    test('test updateCurrentUser', () async {
      // TODO
    });
  });
}
