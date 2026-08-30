import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/config/app_config.dart';
import 'package:video_server_api/video_server_api.dart';

final videoServerApiProvider = Provider<VideoServerApi>(
  (ref) => VideoServerApi(basePathOverride: AppConfig.serverBaseUrl),
);

final nativeAuthGatewayProvider = Provider<NativeAuthGateway>(
  (ref) => GeneratedNativeAuthGateway(ref.watch(videoServerApiProvider)),
);

enum AuthFailureKind {
  invalidCredentials,
  emailRegistered,
  usernameRegistered,
  unauthenticated,
  rateLimited,
  unavailable,
  unknown,
}

final class AuthRequestFailure implements Exception {
  const AuthRequestFailure(this.kind);

  final AuthFailureKind kind;
}

abstract interface class NativeAuthGateway {
  Future<NativeSessionResponse> login({
    required String email,
    required String password,
  });

  Future<NativeSessionResponse> register({
    required String username,
    required String email,
    required String password,
  });

  Future<NativeSessionResponse> refresh(String refreshCredential);

  Future<void> logout(String refreshCredential);
}

final class GeneratedNativeAuthGateway implements NativeAuthGateway {
  GeneratedNativeAuthGateway(this._client);

  final VideoServerApi _client;

  AppAuthApi get _api => _client.getAppAuthApi();

  @override
  Future<NativeSessionResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _api.loginNativeUser(
        emailPasswordRequest: EmailPasswordRequest(
          (builder) => builder
            ..email = email
            ..password = password,
        ),
      );
      return _requireSession(response.data);
    } on DioException catch (error) {
      throw _failure(error);
    }
  }

  @override
  Future<void> logout(String refreshCredential) async {
    try {
      await _api.logoutNativeSession(
        nativeLogoutRequest: NativeLogoutRequest(
          (builder) => builder..refreshToken = refreshCredential,
        ),
      );
    } on DioException catch (error) {
      throw _failure(error);
    }
  }

  @override
  Future<NativeSessionResponse> refresh(String refreshCredential) async {
    try {
      final response = await _api.refreshNativeSession(
        nativeRefreshRequest: NativeRefreshRequest(
          (builder) => builder..refreshToken = refreshCredential,
        ),
      );
      return _requireSession(response.data);
    } on DioException catch (error) {
      throw _failure(error);
    }
  }

  @override
  Future<NativeSessionResponse> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _api.registerNativeUser(
        registerRequest: RegisterRequest(
          (builder) => builder
            ..username = username
            ..email = email
            ..password = password,
        ),
      );
      return _requireSession(response.data);
    } on DioException catch (error) {
      throw _failure(error);
    }
  }
}

NativeSessionResponse _requireSession(NativeSessionResponse? session) {
  if (session == null) throw const AuthRequestFailure(AuthFailureKind.unknown);
  return session;
}

AuthRequestFailure _failure(DioException error) {
  final Object? data = error.response?.data;
  final code = switch (data) {
    {'code': final String value} => value,
    _ => null,
  };
  final kind = switch (code) {
    'invalid_credentials' => AuthFailureKind.invalidCredentials,
    'email_already_registered' => AuthFailureKind.emailRegistered,
    'username_already_registered' => AuthFailureKind.usernameRegistered,
    'unauthenticated' => AuthFailureKind.unauthenticated,
    'rate_limited' => AuthFailureKind.rateLimited,
    _ when error.response == null => AuthFailureKind.unavailable,
    _ => AuthFailureKind.unknown,
  };
  return AuthRequestFailure(kind);
}
