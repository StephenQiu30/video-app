import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/l10n/app_localizations.dart';

String deletionFailureMessage(AppLocalizations l10n, Object error) {
  if (error case DataRequestFailure(statusCode: 409, code: 'invalid_state')) {
    return l10n.deletionBlockedByAnalysis;
  }
  if (error case DataRequestFailure(kind: DataRequestFailureKind.unavailable)) {
    return l10n.serviceUnavailableError;
  }
  return l10n.operationFailed;
}
