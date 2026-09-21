import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/l10n/app_localizations.dart';

String dataRequestFailureMessage(AppLocalizations localizations, Object error) {
  if (error is! DataRequestFailure) return localizations.operationFailed;
  return switch (error.kind) {
    DataRequestFailureKind.unauthenticated =>
      localizations.unauthenticatedError,
    DataRequestFailureKind.forbidden => localizations.forbiddenError,
    DataRequestFailureKind.rateLimited => localizations.rateLimitedError,
    DataRequestFailureKind.unavailable => localizations.serviceUnavailableError,
    DataRequestFailureKind.invalidResponse =>
      localizations.invalidResponseError,
    DataRequestFailureKind.unknown =>
      _safeDetail(error.detail) ?? localizations.operationFailed,
  };
}

String? _safeDetail(String? value) {
  final detail = value?.trim();
  return detail == null || detail.isEmpty ? null : detail;
}
