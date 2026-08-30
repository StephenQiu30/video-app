import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:video_server_api/video_server_api.dart';

typedef AuthenticatedOperation<T> = Future<T> Function(VideoServerApi client);

final authenticatedRequestProvider = Provider<AuthenticatedRequest>((ref) {
  final controller = ref.read(authSessionProvider.notifier);
  return AuthenticatedRequest(
    client: ref.watch(videoServerApiProvider),
    accessToken: () => controller.accessToken,
    expireSession: controller.expireSession,
    refreshSession: controller.refreshSession,
  );
});

final class AuthenticatedRequest {
  const AuthenticatedRequest({
    required this._client,
    required this._accessToken,
    required this._expireSession,
    required this._refreshSession,
  });

  final VideoServerApi _client;
  final String? Function() _accessToken;
  final Future<void> Function() _expireSession;
  final Future<bool> Function() _refreshSession;

  Future<T> execute<T>(AuthenticatedOperation<T> operation) async {
    _applyToken();
    try {
      return await operation(_client);
    } on DioException catch (error) {
      if (error.response?.statusCode != 401) throw _mapFailure(error);
    }

    if (!await _refreshSession()) {
      throw const DataRequestFailure(DataRequestFailureKind.unauthenticated);
    }

    _applyToken();
    try {
      return await operation(_client);
    } on DioException catch (error) {
      if (error.response?.statusCode == 401) {
        await _expireSession();
        throw const DataRequestFailure(DataRequestFailureKind.unauthenticated);
      }
      throw _mapFailure(error);
    }
  }

  void _applyToken() {
    final token = _accessToken();
    if (token == null || token.isEmpty) {
      throw const DataRequestFailure(DataRequestFailureKind.unauthenticated);
    }
    _client.setBearerAuth('NativeBearerAuth', token);
  }
}

DataRequestFailure _mapFailure(DioException error) {
  final statusCode = error.response?.statusCode;
  final kind = switch (statusCode) {
    401 => DataRequestFailureKind.unauthenticated,
    403 => DataRequestFailureKind.forbidden,
    429 => DataRequestFailureKind.rateLimited,
    null => DataRequestFailureKind.unavailable,
    final int value when value >= 500 => DataRequestFailureKind.unavailable,
    _ => DataRequestFailureKind.unknown,
  };
  final body = error.response?.data;
  final code = body is Map ? body['code'] as String? : null;
  final detail = body is Map ? body['detail'] as String? : null;
  return DataRequestFailure(
    kind,
    code: code,
    detail: detail,
    statusCode: statusCode,
  );
}
