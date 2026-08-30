//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_error_code.g.dart';

class DownloadErrorCode extends EnumClass {
  @BuiltValueEnumConst(wireName: r'cancelled')
  static const DownloadErrorCode cancelled = _$cancelled;
  @BuiltValueEnumConst(wireName: r'download_timeout')
  static const DownloadErrorCode downloadTimeout = _$downloadTimeout;
  @BuiltValueEnumConst(wireName: r'format_unavailable')
  static const DownloadErrorCode formatUnavailable = _$formatUnavailable;
  @BuiltValueEnumConst(wireName: r'inspection_timeout')
  static const DownloadErrorCode inspectionTimeout = _$inspectionTimeout;
  @BuiltValueEnumConst(wireName: r'internal_error')
  static const DownloadErrorCode internalError = _$internalError;
  @BuiltValueEnumConst(wireName: r'media_validation_failed')
  static const DownloadErrorCode mediaValidationFailed =
      _$mediaValidationFailed;
  @BuiltValueEnumConst(wireName: r'output_limit_exceeded')
  static const DownloadErrorCode outputLimitExceeded = _$outputLimitExceeded;
  @BuiltValueEnumConst(wireName: r'provider_auth_required')
  static const DownloadErrorCode providerAuthRequired = _$providerAuthRequired;
  @BuiltValueEnumConst(wireName: r'provider_content_restricted')
  static const DownloadErrorCode providerContentRestricted =
      _$providerContentRestricted;
  @BuiltValueEnumConst(wireName: r'provider_drm_protected')
  static const DownloadErrorCode providerDrmProtected = _$providerDrmProtected;
  @BuiltValueEnumConst(wireName: r'provider_geo_restricted')
  static const DownloadErrorCode providerGeoRestricted =
      _$providerGeoRestricted;
  @BuiltValueEnumConst(wireName: r'provider_link_unavailable')
  static const DownloadErrorCode providerLinkUnavailable =
      _$providerLinkUnavailable;
  @BuiltValueEnumConst(wireName: r'provider_media_unsupported')
  static const DownloadErrorCode providerMediaUnsupported =
      _$providerMediaUnsupported;
  @BuiltValueEnumConst(wireName: r'provider_rate_limited')
  static const DownloadErrorCode providerRateLimited = _$providerRateLimited;
  @BuiltValueEnumConst(wireName: r'provider_session_expired')
  static const DownloadErrorCode providerSessionExpired =
      _$providerSessionExpired;
  @BuiltValueEnumConst(wireName: r'provider_temporarily_unavailable')
  static const DownloadErrorCode providerTemporarilyUnavailable =
      _$providerTemporarilyUnavailable;
  @BuiltValueEnumConst(wireName: r'provider_unsupported')
  static const DownloadErrorCode providerUnsupported = _$providerUnsupported;
  @BuiltValueEnumConst(wireName: r'provider_verification_failed')
  static const DownloadErrorCode providerVerificationFailed =
      _$providerVerificationFailed;
  @BuiltValueEnumConst(wireName: r'storage_unavailable')
  static const DownloadErrorCode storageUnavailable = _$storageUnavailable;
  @BuiltValueEnumConst(wireName: r'temp_space_exhausted')
  static const DownloadErrorCode tempSpaceExhausted = _$tempSpaceExhausted;
  @BuiltValueEnumConst(wireName: r'transcode_required')
  static const DownloadErrorCode transcodeRequired = _$transcodeRequired;
  @BuiltValueEnumConst(wireName: r'unsupported_source')
  static const DownloadErrorCode unsupportedSource = _$unsupportedSource;
  @BuiltValueEnumConst(wireName: r'worker_lost')
  static const DownloadErrorCode workerLost = _$workerLost;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DownloadErrorCode unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<DownloadErrorCode> get serializer =>
      _$downloadErrorCodeSerializer;

  const DownloadErrorCode._(String name) : super(name);

  static BuiltSet<DownloadErrorCode> get values => _$values;
  static DownloadErrorCode valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DownloadErrorCodeMixin = Object with _$DownloadErrorCodeMixin;
