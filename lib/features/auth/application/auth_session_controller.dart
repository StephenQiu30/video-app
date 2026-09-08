import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/data/refresh_credential_store.dart';
import 'package:framegrab/features/auth/data/session_credential_access.dart';
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
  int _generation = 0;
  Future<bool>? _refreshOperation;
  late final _credentials = SessionCredentialAccess(
    ref.read(refreshCredentialStoreProvider),
  );

  NativeAuthGateway get _gateway => ref.read(nativeAuthGatewayProvider);
  String? get accessToken => _accessToken;
  int get sessionGeneration => _generation;

  @override
  AuthSessionState build() {
    ref.onDispose(() => _generation++);
    return const AuthSessionState.restoring();
  }

  Future<void> restore() async {
    if (_restored) return;
    _restored = true;
    await _rotate(_generation, restoring: true);
  }

  Future<bool> login({required String email, required String password}) =>
      _submit(() => _gateway.login(email: email, password: password));

  Future<bool> register({
    required String username,
    required String verificationCode,
    required String email,
    required String password,
  }) => _submit(
    () => _gateway.register(
      username: username,
      email: email,
      password: password,
      verificationCode: verificationCode,
    ),
  );

  Future<bool> refreshSession() {
    if (!state.isSignedIn) return Future.value(false);
    final active = _refreshOperation;
    if (active != null) return active;
    late final Future<bool> operation;
    operation = _rotate(_generation).whenComplete(() {
      if (identical(_refreshOperation, operation)) _refreshOperation = null;
    });
    _refreshOperation = operation;
    return operation;
  }

  void acceptUpdatedProfile(UserResponse user, int generation) {
    if (!_isCurrent(generation) ||
        !state.isSignedIn ||
        state.user?.id != user.id) {
      return;
    }
    state = AuthSessionState(phase: AuthSessionPhase.signedIn, user: user);
  }

  Future<void> expireSession() =>
      _clear(failure: AuthFailureKind.unauthenticated);

  Future<void> logout() async {
    final gateway = _gateway;
    final user = state.user;
    final generation = _invalidate();
    state = AuthSessionState(phase: AuthSessionPhase.signingOut, user: user);
    String? credential;
    try {
      credential = await _credentials.run((store) async {
        try {
          return await store.read();
        } finally {
          await store.clear();
        }
      });
    } finally {
      if (_isCurrent(generation)) {
        state = const AuthSessionState(phase: AuthSessionPhase.signedOut);
      }
    }
    if (credential != null) await _revoke(gateway, credential);
  }

  Future<bool> _submit(Future<NativeSessionResponse> Function() request) {
    if (state.isBusy) return Future.value(false);
    final generation = _invalidate();
    state = const AuthSessionState(phase: AuthSessionPhase.submitting);
    return _authenticate(generation, request);
  }

  Future<bool> _rotate(int generation, {bool restoring = false}) {
    final gateway = _gateway;
    return _authenticate(generation, () async {
      final credential = await _credentials.run((store) => store.read());
      if (!_isCurrent(generation)) return null;
      if (credential == null || credential.isEmpty) {
        await _clear(
          failure: restoring ? null : AuthFailureKind.unauthenticated,
        );
        return null;
      }
      return gateway.refresh(credential);
    });
  }

  Future<bool> _authenticate(
    int generation,
    Future<NativeSessionResponse?> Function() request,
  ) async {
    final gateway = _gateway;
    NativeSessionResponse? grant;
    var accepted = false;
    try {
      grant = await request();
      if (grant == null) return false;
      final result = grant;
      accepted = await _credentials.run((store) async {
        if (!_isCurrent(generation)) return false;
        await store.write(result.refreshToken);
        if (!_isCurrent(generation)) return false;
        _accessToken = result.accessToken;
        state = AuthSessionState(
          phase: AuthSessionPhase.signedIn,
          user: result.user,
        );
        return true;
      });
      return accepted;
    } on AuthRequestFailure catch (failure) {
      if (_isCurrent(generation)) await _clear(failure: failure.kind);
      return false;
    } catch (_) {
      if (_isCurrent(generation)) {
        await _clear(failure: AuthFailureKind.unavailable);
      }
      return false;
    } finally {
      if (grant != null && !accepted) {
        await _revoke(gateway, grant.refreshToken);
      }
    }
  }

  bool _isCurrent(int generation) => ref.mounted && generation == _generation;

  int _invalidate() {
    _generation++;
    _refreshOperation = null;
    _accessToken = null;
    ref.read(videoServerApiProvider).removeBearerAuth('NativeBearerAuth');
    return _generation;
  }

  Future<void> _clear({AuthFailureKind? failure}) async {
    _invalidate();
    state = AuthSessionState(
      phase: AuthSessionPhase.signedOut,
      failure: failure,
    );
    await _credentials.run((store) => store.clear());
  }
}

Future<void> _revoke(NativeAuthGateway gateway, String credential) async {
  try {
    await gateway.logout(credential);
  } catch (_) {
    // Revocation remains best effort when the service cannot be reached.
  }
}
