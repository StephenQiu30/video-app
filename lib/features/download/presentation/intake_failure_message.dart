import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/l10n/app_localizations.dart';

String intakeFailureMessage(AppLocalizations localizations, Object error) {
  if (error is! DataRequestFailure) return localizations.operationFailed;
  return switch (error.code) {
    'invalid_url' => localizations.mediaUrlError,
    'inspection_failed' => localizations.inspectionFailedError,
    'inspection_timeout' => localizations.inspectionTimeoutError,
    'provider_auth_required' ||
    'provider_session_expired' => localizations.providerSessionError,
    'provider_geo_restricted' => localizations.providerRegionError,
    'provider_content_restricted' => localizations.providerRestrictedError,
    'provider_drm_protected' => localizations.providerDrmError,
    'provider_link_unavailable' => localizations.providerLinkError,
    'provider_verification_failed' ||
    'provider_temporarily_unavailable' => localizations.providerTemporaryError,
    'provider_media_unsupported' ||
    'provider_unsupported' => localizations.providerUnsupportedError,
    'duration_limit_exceeded' => localizations.durationLimitError,
    'format_unavailable' => localizations.noFormatsAvailable,
    'article_access_restricted' => localizations.articleRestrictedError,
    'article_discovery_failed' => localizations.articleDiscoveryError,
    _ => switch (error.kind) {
      DataRequestFailureKind.unauthenticated =>
        localizations.unauthenticatedError,
      DataRequestFailureKind.forbidden => localizations.providerRestrictedError,
      DataRequestFailureKind.rateLimited => localizations.rateLimitedError,
      DataRequestFailureKind.unavailable =>
        localizations.serviceUnavailableError,
      _ => localizations.operationFailed,
    },
  };
}
