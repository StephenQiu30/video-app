//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/error_code.dart';
import 'package:video_server_api/lib/model/provider_list_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_response_provider_list_response.g.dart';

/// ApiResponseProviderListResponse
///
/// Properties:
/// * [code] - 稳定的业务结果码。
/// * [message] - 安全的结果说明。
/// * [data] - 成功时为业务数据，错误时为 null。
@BuiltValue()
abstract class ApiResponseProviderListResponse
    implements
        Built<ApiResponseProviderListResponse,
            ApiResponseProviderListResponseBuilder> {
  /// 稳定的业务结果码。
  @BuiltValueField(wireName: r'code')
  ErrorCode get code;
  // enum codeEnum {  active_ai_provider_delete,  active_task_quota_exceeded,  admin_bootstrap_required,  ai_model_catalog_unavailable,  ai_provider_conflict,  ai_provider_not_found,  analysis_already_active,  analysis_artifact_unavailable,  analysis_budget_exceeded,  analysis_report_not_ready,  analysis_report_unavailable,  analysis_retry_limited,  analysis_unavailable,  article_access_restricted,  article_discovery_failed,  artifact_not_ready,  daily_byte_quota_exceeded,  daily_task_quota_exceeded,  download_not_ready,  duration_limit_exceeded,  email_already_registered,  email_send_failed,  email_unavailable,  forbidden,  format_unavailable,  http_error,  idempotency_conflict,  import_disabled,  import_size_mismatch,  import_storage_unavailable,  inspection_failed,  inspection_timeout,  internal_error,  invalid_ai_provider_profile,  invalid_credentials,  invalid_model_output,  invalid_provider_catalog_entry,  invalid_request,  invalid_state,  invalid_url,  invalid_username,  invalid_verification_code,  job_conflict,  method_not_allowed,  metrics_unavailable,  not_found,  ok,  provider_access_policy_not_allowed,  provider_auth_required,  provider_authorization_unavailable,  provider_catalog_conflict,  provider_catalog_not_found,  provider_configuration_missing,  provider_guest_context_required,  provider_content_restricted,  provider_drm_protected,  provider_failure,  provider_geo_restricted,  provider_link_unavailable,  provider_media_unsupported,  provider_rate_limited,  provider_session_expired,  provider_temporarily_unavailable,  provider_unsupported,  provider_verification_failed,  rate_limited,  rate_limiter_unavailable,  refresh_in_progress,  request_timeout,  request_too_large,  reserved_ai_provider_mutation,  resource_expired,  self_admin_change,  service_unavailable,  storage_quota_exceeded,  storage_file_in_use,  storage_unavailable,  unauthenticated,  upload_incomplete,  upload_session_expired,  user_not_found,  username_already_registered,  verification_rate_limited,  };

  /// 安全的结果说明。
  @BuiltValueField(wireName: r'message')
  String get message;

  /// 成功时为业务数据，错误时为 null。
  @BuiltValueField(wireName: r'data')
  ProviderListResponse get data;

  ApiResponseProviderListResponse._();

  factory ApiResponseProviderListResponse(
          [void updates(ApiResponseProviderListResponseBuilder b)]) =
      _$ApiResponseProviderListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiResponseProviderListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiResponseProviderListResponse> get serializer =>
      _$ApiResponseProviderListResponseSerializer();
}

class _$ApiResponseProviderListResponseSerializer
    implements PrimitiveSerializer<ApiResponseProviderListResponse> {
  @override
  final Iterable<Type> types = const [
    ApiResponseProviderListResponse,
    _$ApiResponseProviderListResponse
  ];

  @override
  final String wireName = r'ApiResponseProviderListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiResponseProviderListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(ErrorCode),
    );
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(ProviderListResponse),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiResponseProviderListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApiResponseProviderListResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ErrorCode),
          ) as ErrorCode;
          result.code = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ProviderListResponse),
          ) as ProviderListResponse;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApiResponseProviderListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiResponseProviderListResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
