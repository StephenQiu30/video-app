import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/l10n/app_localizations.dart';

String authFailureMessage(
  AppLocalizations localizations,
  AuthFailureKind failure,
) {
  return switch (failure) {
    AuthFailureKind.invalidCredentials => localizations.invalidCredentialsError,
    AuthFailureKind.emailRegistered => localizations.emailRegisteredError,
    AuthFailureKind.usernameRegistered => localizations.usernameRegisteredError,
    AuthFailureKind.unauthenticated => localizations.unauthenticatedError,
    AuthFailureKind.rateLimited => localizations.rateLimitedError,
    AuthFailureKind.unavailable => localizations.serviceUnavailableError,
    AuthFailureKind.unknown => localizations.unknownAuthError,
  };
}
