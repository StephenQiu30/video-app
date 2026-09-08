import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/data/refresh_credential_store.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../support/auth_fakes.dart';

void main() {
  for (final lateFailure in [false, true]) {
    test(
      'late refresh ${lateFailure ? 'failure' : 'success'} preserves a new login',
      () async {
        final gateway = _DeferredGateway();
        final store = MemoryCredentialStore();
        final container = _container(gateway, store);
        addTearDown(container.dispose);
        final controller = container.read(authSessionProvider.notifier);
        await controller.restore();
        await controller.login(
          email: 'first@example.com',
          password: 'test-password',
        );
        final refresh = controller.refreshSession();
        await gateway.started.future;
        await controller.logout();
        await controller.login(
          email: 'second@example.com',
          password: 'test-password',
        );
        if (lateFailure) {
          gateway.pending.completeError(
            const AuthRequestFailure(AuthFailureKind.unauthenticated),
          );
        } else {
          gateway.pending.complete(testSession(suffix: 'old-refresh'));
        }
        expect(await refresh, isFalse);
        expect(controller.accessToken, 'access-second@example.com');
        expect(store.value, 'refresh-second@example.com');
        expect(
          container.read(authSessionProvider).phase,
          AuthSessionPhase.signedIn,
        );
        if (!lateFailure) {
          expect(gateway.revoked, contains('refresh-old-refresh'));
        }
      },
    );
  }

  test('logout remains signed out when a refresh finishes later', () async {
    final gateway = _DeferredGateway();
    final store = MemoryCredentialStore();
    final container = _container(gateway, store);
    addTearDown(container.dispose);
    final controller = container.read(authSessionProvider.notifier);
    await controller.restore();
    await controller.login(
      email: 'first@example.com',
      password: 'test-password',
    );
    final refresh = controller.refreshSession();
    await gateway.started.future;
    await controller.logout();
    gateway.pending.complete(testSession(suffix: 'late'));
    expect(await refresh, isFalse);
    expect(
      container.read(authSessionProvider).phase,
      AuthSessionPhase.signedOut,
    );
    expect(store.value, isNull);
    expect(controller.accessToken, isNull);
    expect(gateway.revoked, contains('refresh-late'));
  });

  test('logout clears a credential write that was already in flight', () async {
    final gateway = _DeferredGateway();
    final store = _DelayedStore();
    final container = _container(gateway, store);
    addTearDown(container.dispose);
    final controller = container.read(authSessionProvider.notifier);
    await controller.restore();
    await controller.login(
      email: 'first@example.com',
      password: 'test-password',
    );
    store.delayWrite = true;
    final refresh = controller.refreshSession();
    await gateway.started.future;
    gateway.pending.complete(testSession(suffix: 'late-write'));
    await store.writeStarted.future;
    final logout = controller.logout();
    await Future<void>.delayed(Duration.zero);
    store.releaseWrite.complete();
    await logout;
    expect(await refresh, isFalse);
    expect(store.value, isNull);
    expect(controller.accessToken, isNull);
    expect(
      container.read(authSessionProvider).phase,
      AuthSessionPhase.signedOut,
    );
  });

  test('restore cannot sign in after an explicit session expiry', () async {
    final gateway = _DeferredGateway();
    final store = MemoryCredentialStore('refresh-saved');
    final container = _container(gateway, store);
    addTearDown(container.dispose);
    final controller = container.read(authSessionProvider.notifier);
    final restore = controller.restore();
    await gateway.started.future;
    await controller.expireSession();
    gateway.pending.complete(testSession(suffix: 'restored'));
    await restore;
    expect(store.value, isNull);
    expect(
      container.read(authSessionProvider).phase,
      AuthSessionPhase.signedOut,
    );
    expect(gateway.revoked, contains('refresh-restored'));
  });

  test('concurrent refresh callers share one rotation', () async {
    final gateway = _DeferredGateway();
    final container = _container(gateway, MemoryCredentialStore());
    addTearDown(container.dispose);
    final controller = container.read(authSessionProvider.notifier);
    await controller.restore();
    await controller.login(
      email: 'first@example.com',
      password: 'test-password',
    );
    final first = controller.refreshSession();
    final second = controller.refreshSession();
    await gateway.started.future;
    gateway.pending.complete(testSession(suffix: 'rotated'));
    expect(await Future.wait([first, second]), [true, true]);
    expect(gateway.refreshCalls, 1);
  });
}

ProviderContainer _container(
  NativeAuthGateway gateway,
  RefreshCredentialStore store,
) => ProviderContainer(
  overrides: [
    nativeAuthGatewayProvider.overrideWithValue(gateway),
    refreshCredentialStoreProvider.overrideWithValue(store),
  ],
);

final class _DeferredGateway implements NativeAuthGateway {
  final started = Completer<void>();
  final pending = Completer<NativeSessionResponse>();
  final revoked = <String>[];
  int refreshCalls = 0;

  @override
  Future<NativeSessionResponse> refresh(String credential) {
    refreshCalls++;
    if (!started.isCompleted) started.complete();
    return pending.future;
  }

  @override
  Future<void> logout(String credential) async => revoked.add(credential);
  @override
  Future<NativeSessionResponse> login({
    required String email,
    required String password,
  }) async => testSession(suffix: email);
  @override
  Future<RegistrationCodeResponse> sendRegistrationCode(String email) async =>
      RegistrationCodeResponse(
        (b) => b
          ..emailSent = true
          ..retryAfterSeconds = 60
          ..expiresInSeconds = 600,
      );

  @override
  Future<NativeSessionResponse> register({
    required String verificationCode,
    required String username,
    required String email,
    required String password,
  }) async => testSession(suffix: email);
}

final class _DelayedStore implements RefreshCredentialStore {
  String? value;
  bool delayWrite = false;
  final writeStarted = Completer<void>();
  final releaseWrite = Completer<void>();

  @override
  Future<String?> read() async => value;
  @override
  Future<void> clear() async => value = null;
  @override
  Future<void> write(String credential) async {
    if (delayWrite) {
      writeStarted.complete();
      await releaseWrite.future;
    }
    value = credential;
  }
}
