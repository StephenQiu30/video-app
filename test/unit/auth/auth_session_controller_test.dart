import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/data/refresh_credential_store.dart';
import 'package:video_server_api/video_server_api.dart';

void main() {
  test('restore without a credential finishes signed out', () async {
    final store = _MemoryCredentialStore();
    final gateway = _FakeAuthGateway();
    final container = _container(gateway, store);
    addTearDown(container.dispose);

    await container.read(authSessionProvider.notifier).restore();

    expect(
      container.read(authSessionProvider).phase,
      AuthSessionPhase.signedOut,
    );
    expect(gateway.refreshCalls, 0);
  });

  test('login keeps access in memory and refresh in secure storage', () async {
    final store = _MemoryCredentialStore();
    final gateway = _FakeAuthGateway(loginGrant: _grant('login'));
    final container = _container(gateway, store);
    addTearDown(container.dispose);
    await container.read(authSessionProvider.notifier).restore();

    final success = await container
        .read(authSessionProvider.notifier)
        .login(email: 'member@example.com', password: 'strong-pass-123');

    final state = container.read(authSessionProvider);
    expect(success, isTrue);
    expect(state.phase, AuthSessionPhase.signedIn);
    expect(state.user?.username, 'member');
    expect(store.value, 'refresh-login');
    expect(
      container.read(authSessionProvider.notifier).accessToken,
      'access-login',
    );
  });

  test('restore rotates and replaces the stored credential', () async {
    final store = _MemoryCredentialStore('refresh-old');
    final gateway = _FakeAuthGateway(refreshGrant: _grant('restored'));
    final container = _container(gateway, store);
    addTearDown(container.dispose);

    await container.read(authSessionProvider.notifier).restore();

    expect(
      container.read(authSessionProvider).phase,
      AuthSessionPhase.signedIn,
    );
    expect(store.value, 'refresh-restored');
    expect(gateway.lastRefresh, 'refresh-old');
  });

  test('failed restore clears the invalid local credential', () async {
    final store = _MemoryCredentialStore('refresh-invalid');
    final gateway = _FakeAuthGateway(refreshFailure: true);
    final container = _container(gateway, store);
    addTearDown(container.dispose);

    await container.read(authSessionProvider.notifier).restore();

    expect(
      container.read(authSessionProvider).phase,
      AuthSessionPhase.signedOut,
    );
    expect(store.value, isNull);
  });

  test(
    'logout clears local state even when revocation is unavailable',
    () async {
      final store = _MemoryCredentialStore('refresh-live');
      final gateway = _FakeAuthGateway(
        refreshGrant: _grant('restored'),
        logoutFailure: true,
      );
      final container = _container(gateway, store);
      addTearDown(container.dispose);
      await container.read(authSessionProvider.notifier).restore();

      await container.read(authSessionProvider.notifier).logout();

      expect(
        container.read(authSessionProvider).phase,
        AuthSessionPhase.signedOut,
      );
      expect(store.value, isNull);
      expect(container.read(authSessionProvider.notifier).accessToken, isNull);
    },
  );
}

ProviderContainer _container(
  NativeAuthGateway gateway,
  RefreshCredentialStore store,
) {
  return ProviderContainer(
    overrides: [
      nativeAuthGatewayProvider.overrideWithValue(gateway),
      refreshCredentialStoreProvider.overrideWithValue(store),
    ],
  );
}

NativeSessionResponse _grant(String suffix) {
  final now = DateTime.utc(2026, 8, 30);
  final user = UserResponse(
    (builder) => builder
      ..id = '00000000-0000-0000-0000-000000000001'
      ..username = 'member'
      ..email = 'member@example.com'
      ..role = UserRole.user
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

final class _MemoryCredentialStore implements RefreshCredentialStore {
  _MemoryCredentialStore([this.value]);

  String? value;

  @override
  Future<void> clear() async => value = null;

  @override
  Future<String?> read() async => value;

  @override
  Future<void> write(String credential) async => value = credential;
}

final class _FakeAuthGateway implements NativeAuthGateway {
  _FakeAuthGateway({
    this.loginGrant,
    this.refreshGrant,
    this.refreshFailure = false,
    this.logoutFailure = false,
  });

  final NativeSessionResponse? loginGrant;
  final NativeSessionResponse? refreshGrant;
  final bool refreshFailure;
  final bool logoutFailure;
  int refreshCalls = 0;
  String? lastRefresh;

  @override
  Future<NativeSessionResponse> login({
    required String email,
    required String password,
  }) async => loginGrant ?? _grant('login');

  @override
  Future<void> logout(String refreshCredential) async {
    if (logoutFailure) {
      throw const AuthRequestFailure(AuthFailureKind.unavailable);
    }
  }

  @override
  Future<NativeSessionResponse> refresh(String refreshCredential) async {
    refreshCalls += 1;
    lastRefresh = refreshCredential;
    if (refreshFailure) {
      throw const AuthRequestFailure(AuthFailureKind.unauthenticated);
    }
    return refreshGrant ?? _grant('refresh');
  }

  @override
  Future<NativeSessionResponse> register({
    required String username,
    required String email,
    required String password,
  }) async => _grant('register');
}
