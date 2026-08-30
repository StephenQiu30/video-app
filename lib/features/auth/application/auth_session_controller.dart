import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/data/refresh_credential_store.dart';
import 'package:video_server_api/video_server_api.dart';

final authSessionProvider =
    NotifierProvider<AuthSessionController, AuthSessionState>(
      AuthSessionController.new,
    );

enum AuthSessionPhase { restoring, signedOut, submitting, signedIn, signingOut }

final class AuthSessionState {
  const AuthSessionState({required this.phase, this.user, this.failure});

  const AuthSessionState.restoring() : this(phase: AuthSessionPhase.restoring);

  final AuthSessionPhase phase;
  final UserResponse? user;
  final AuthFailureKind? failure;

  bool get isSignedIn => phase == AuthSessionPhase.signedIn;
  bool get isBusy => switch (phase) {
    AuthSessionPhase.restoring ||
    AuthSessionPhase.submitting ||
    AuthSessionPhase.signingOut => true,
    _ => false,
  };
}

final class AuthSessionController extends Notifier<AuthSessionState> {
  String? _accessToken;
  bool _restored = false;
  Future<bool>? _refreshOperation;

  NativeAuthGateway get _gateway => ref.read(nativeAuthGatewayProvider);
  RefreshCredentialStore get _store => ref.read(refreshCredentialStoreProvider);

  String? get accessToken => _accessToken;

  @override
  AuthSessionState build() => const AuthSessionState.restoring();

  Future<void> restore() async {
    if (_restored) return;
    _restored = true;
    try {
      final credential = await _store.read();
      if (credential == null || credential.isEmpty) {
        state = const AuthSessionState(phase: AuthSessionPhase.signedOut);
        return;
      }
      final grant = await _gateway.refresh(credential);
      await _accept(grant);
    } on AuthRequestFailure catch (failure) {
      await _clear(failure: failure.kind);
    } catch (_) {
      await _clear(failure: AuthFailureKind.unavailable);
    }
  }

  Future<bool> login({required String email, required String password}) {
    return _submit(() => _gateway.login(email: email, password: password));
  }

  Future<bool> register({
    required String username,
    required String email,
    required String password,
  }) {
    return _submit(
      () => _gateway.register(
        username: username,
        email: email,
        password: password,
      ),
    );
  }

  Future<bool> refreshSession() {
    final active = _refreshOperation;
    if (active != null) return active;
    late final Future<bool> operation;
    operation = _performRefresh().whenComplete(() {
      if (identical(_refreshOperation, operation)) _refreshOperation = null;
    });
    _refreshOperation = operation;
    return operation;
  }

  Future<void> expireSession() {
    return _clear(failure: AuthFailureKind.unauthenticated);
  }

  Future<void> logout() async {
    final user = state.user;
    state = AuthSessionState(phase: AuthSessionPhase.signingOut, user: user);
    try {
      final credential = await _store.read();
      if (credential != null && credential.isNotEmpty) {
        await _gateway.logout(credential);
      }
    } catch (_) {
      // Local credentials are always cleared, even if revocation is unavailable.
    } finally {
      await _clear();
    }
  }

  Future<bool> _submit(Future<NativeSessionResponse> Function() request) async {
    if (state.isBusy) return false;
    state = const AuthSessionState(phase: AuthSessionPhase.submitting);
    try {
      await _accept(await request());
      return true;
    } on AuthRequestFailure catch (failure) {
      await _clear(failure: failure.kind);
      return false;
    } catch (_) {
      await _clear(failure: AuthFailureKind.unavailable);
      return false;
    }
  }

  Future<bool> _performRefresh() async {
    try {
      final credential = await _store.read();
      if (credential == null || credential.isEmpty) {
        await _clear(failure: AuthFailureKind.unauthenticated);
        return false;
      }
      await _accept(await _gateway.refresh(credential));
      return true;
    } on AuthRequestFailure catch (failure) {
      await _clear(failure: failure.kind);
      return false;
    } catch (_) {
      await _clear(failure: AuthFailureKind.unavailable);
      return false;
    }
  }

  Future<void> _accept(NativeSessionResponse grant) async {
    await _store.write(grant.refreshToken);
    _accessToken = grant.accessToken;
    state = AuthSessionState(
      phase: AuthSessionPhase.signedIn,
      user: grant.user,
    );
  }

  Future<void> _clear({AuthFailureKind? failure}) async {
    _accessToken = null;
    await _store.clear();
    state = AuthSessionState(
      phase: AuthSessionPhase.signedOut,
      failure: failure,
    );
  }
}
