//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/provider_access_policy.dart';
import 'package:video_server_api/lib/model/provider_evidence_state.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'provider_runtime_response.g.dart';

/// ProviderRuntimeResponse
///
/// Properties:
/// * [providerKey]
/// * [accessPolicyId]
/// * [routeConfigured]
/// * [contextAvailable]
/// * [profileVersion]
/// * [engineCommit]
/// * [sourceState]
/// * [evidenceState]
/// * [lastMediaVerifiedAt]
/// * [userAction]
/// * [routeRetryAt]
@BuiltValue()
abstract class ProviderRuntimeResponse
    implements Built<ProviderRuntimeResponse, ProviderRuntimeResponseBuilder> {
  @BuiltValueField(wireName: r'provider_key')
  String get providerKey;

  @BuiltValueField(wireName: r'access_policy_id')
  ProviderAccessPolicy? get accessPolicyId;
  // enum accessPolicyIdEnum {  public,  public_session,  operator_public,  personal_entitled,  };

  @BuiltValueField(wireName: r'route_configured')
  bool get routeConfigured;

  @BuiltValueField(wireName: r'context_available')
  bool get contextAvailable;

  @BuiltValueField(wireName: r'profile_version')
  String? get profileVersion;

  @BuiltValueField(wireName: r'engine_commit')
  String? get engineCommit;

  @BuiltValueField(wireName: r'source_state')
  ProviderRuntimeResponseSourceStateEnum get sourceState;
  // enum sourceStateEnum {  not_required,  revision_observed,  not_observed,  unknown,  };

  @BuiltValueField(wireName: r'evidence_state')
  ProviderEvidenceState get evidenceState;
  // enum evidenceStateEnum {  missing,  stale,  fresh,  };

  @BuiltValueField(wireName: r'last_media_verified_at')
  DateTime? get lastMediaVerifiedAt;

  @BuiltValueField(wireName: r'user_action')
  String? get userAction;

  @BuiltValueField(wireName: r'route_retry_at')
  DateTime? get routeRetryAt;

  ProviderRuntimeResponse._();

  factory ProviderRuntimeResponse(
          [void updates(ProviderRuntimeResponseBuilder b)]) =
      _$ProviderRuntimeResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProviderRuntimeResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProviderRuntimeResponse> get serializer =>
      _$ProviderRuntimeResponseSerializer();
}

class _$ProviderRuntimeResponseSerializer
    implements PrimitiveSerializer<ProviderRuntimeResponse> {
  @override
  final Iterable<Type> types = const [
    ProviderRuntimeResponse,
    _$ProviderRuntimeResponse
  ];

  @override
  final String wireName = r'ProviderRuntimeResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProviderRuntimeResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'provider_key';
    yield serializers.serialize(
      object.providerKey,
      specifiedType: const FullType(String),
    );
    yield r'access_policy_id';
    yield object.accessPolicyId == null
        ? null
        : serializers.serialize(
            object.accessPolicyId,
            specifiedType: const FullType.nullable(ProviderAccessPolicy),
          );
    yield r'route_configured';
    yield serializers.serialize(
      object.routeConfigured,
      specifiedType: const FullType(bool),
    );
    yield r'context_available';
    yield serializers.serialize(
      object.contextAvailable,
      specifiedType: const FullType(bool),
    );
    yield r'profile_version';
    yield object.profileVersion == null
        ? null
        : serializers.serialize(
            object.profileVersion,
            specifiedType: const FullType.nullable(String),
          );
    yield r'engine_commit';
    yield object.engineCommit == null
        ? null
        : serializers.serialize(
            object.engineCommit,
            specifiedType: const FullType.nullable(String),
          );
    yield r'source_state';
    yield serializers.serialize(
      object.sourceState,
      specifiedType: const FullType(ProviderRuntimeResponseSourceStateEnum),
    );
    yield r'evidence_state';
    yield serializers.serialize(
      object.evidenceState,
      specifiedType: const FullType(ProviderEvidenceState),
    );
    yield r'last_media_verified_at';
    yield object.lastMediaVerifiedAt == null
        ? null
        : serializers.serialize(
            object.lastMediaVerifiedAt,
            specifiedType: const FullType.nullable(DateTime),
          );
    yield r'user_action';
    yield object.userAction == null
        ? null
        : serializers.serialize(
            object.userAction,
            specifiedType: const FullType.nullable(String),
          );
    if (object.routeRetryAt != null) {
      yield r'route_retry_at';
      yield serializers.serialize(
        object.routeRetryAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ProviderRuntimeResponse object, {
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
    required ProviderRuntimeResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'provider_key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.providerKey = valueDes;
          break;
        case r'access_policy_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ProviderAccessPolicy),
          ) as ProviderAccessPolicy?;
          if (valueDes == null) continue;
          result.accessPolicyId = valueDes;
          break;
        case r'route_configured':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.routeConfigured = valueDes;
          break;
        case r'context_available':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.contextAvailable = valueDes;
          break;
        case r'profile_version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.profileVersion = valueDes;
          break;
        case r'engine_commit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.engineCommit = valueDes;
          break;
        case r'source_state':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(ProviderRuntimeResponseSourceStateEnum),
          ) as ProviderRuntimeResponseSourceStateEnum;
          result.sourceState = valueDes;
          break;
        case r'evidence_state':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ProviderEvidenceState),
          ) as ProviderEvidenceState;
          result.evidenceState = valueDes;
          break;
        case r'last_media_verified_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.lastMediaVerifiedAt = valueDes;
          break;
        case r'user_action':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userAction = valueDes;
          break;
        case r'route_retry_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.routeRetryAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProviderRuntimeResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProviderRuntimeResponseBuilder();
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

class ProviderRuntimeResponseSourceStateEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'not_required')
  static const ProviderRuntimeResponseSourceStateEnum notRequired =
      _$providerRuntimeResponseSourceStateEnum_notRequired;
  @BuiltValueEnumConst(wireName: r'revision_observed')
  static const ProviderRuntimeResponseSourceStateEnum revisionObserved =
      _$providerRuntimeResponseSourceStateEnum_revisionObserved;
  @BuiltValueEnumConst(wireName: r'not_observed')
  static const ProviderRuntimeResponseSourceStateEnum notObserved =
      _$providerRuntimeResponseSourceStateEnum_notObserved;
  @BuiltValueEnumConst(wireName: r'unknown')
  static const ProviderRuntimeResponseSourceStateEnum unknown =
      _$providerRuntimeResponseSourceStateEnum_unknown;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ProviderRuntimeResponseSourceStateEnum unknownDefaultOpenApi =
      _$providerRuntimeResponseSourceStateEnum_unknownDefaultOpenApi;

  static Serializer<ProviderRuntimeResponseSourceStateEnum> get serializer =>
      _$providerRuntimeResponseSourceStateEnumSerializer;

  const ProviderRuntimeResponseSourceStateEnum._(String name) : super(name);

  static BuiltSet<ProviderRuntimeResponseSourceStateEnum> get values =>
      _$providerRuntimeResponseSourceStateEnumValues;
  static ProviderRuntimeResponseSourceStateEnum valueOf(String name) =>
      _$providerRuntimeResponseSourceStateEnumValueOf(name);
}
