import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/data/refresh_credential_store.dart';
import 'package:video_server_api/video_server_api.dart';

NativeSessionResponse testSession({
  UserRole role = UserRole.user,
  String suffix = 'test',
}) {
  final now = DateTime.utc(2026, 8, 30);
  final user = UserResponse(
    (builder) => builder
      ..id = '00000000-0000-0000-0000-000000000001'
      ..username = 'member'
      ..email = 'member@example.com'
      ..role = role
      ..createdAt = now
      ..updatedAt = now,
  );
  return NativeSessionResponse(
    (builder) => builder
      ..user.replace(user)
      ..accessToken = 'access-$suffix'
      ..refreshToken = 'refresh-$suffix'
      ..tokenType = NativeSessionResponseTokenTypeEnum.bearer
      ..accessExpiresAt = now.add(const Duration(minutes: 15))
      ..refreshExpiresAt = now.add(const Duration(days: 30)),
  );
}

final class MemoryCredentialStore implements RefreshCredentialStore {
  MemoryCredentialStore([this.value]);

  String? value;

  @override
  Future<void> clear() async => value = null;

  @override
  Future<String?> read() async => value;

  @override
  Future<void> write(String credential) async => value = credential;
}

final class FakeAuthGateway implements NativeAuthGateway {
  FakeAuthGateway({this.failure, this.session});

  final AuthFailureKind? failure;
  final NativeSessionResponse? session;
  int logoutCalls = 0;

  @override
  Future<NativeSessionResponse> login({
    required String email,
    required String password,
  }) async {
    _throwIfNeeded();
    return session ?? testSession(suffix: 'login');
  }

  @override
  Future<void> logout(String refreshCredential) async {
    logoutCalls += 1;
    _throwIfNeeded();
  }

  @override
  Future<NativeSessionResponse> refresh(String refreshCredential) async {
    _throwIfNeeded();
    return session ?? testSession(suffix: 'refresh');
  }

  @override
  Future<NativeSessionResponse> register({
    required String username,
    required String email,
    required String password,
  }) async {
    _throwIfNeeded();
    return session ?? testSession(suffix: 'register');
  }

  void _throwIfNeeded() {
    final kind = failure;
    if (kind != null) throw AuthRequestFailure(kind);
  }
}
