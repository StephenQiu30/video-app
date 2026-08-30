//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:video_server_api/lib/model/ai_provider_engine.dart';
import 'package:video_server_api/lib/model/ai_provider_auth_mode.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_provider_profile_response.g.dart';

/// AiProviderProfileResponse
///
/// Properties:
/// * [key]
/// * [displayName]
/// * [engine]
/// * [authMode]
/// * [baseUrl]
/// * [model]
/// * [credentialConfigured]
/// * [isActive]
/// * [createdAt]
/// * [updatedAt]
@BuiltValue()
abstract class AiProviderProfileResponse
    implements
        Built<AiProviderProfileResponse, AiProviderProfileResponseBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'display_name')
  String get displayName;

  @BuiltValueField(wireName: r'engine')
  AiProviderEngine get engine;
  // enum engineEnum {  codex,  claude,  deepseek,  };

  @BuiltValueField(wireName: r'auth_mode')
  AiProviderAuthMode get authMode;
  // enum authModeEnum {  host_login,  api_key,  };

  @BuiltValueField(wireName: r'base_url')
  String? get baseUrl;

  @BuiltValueField(wireName: r'model')
  String get model;

  @BuiltValueField(wireName: r'credential_configured')
  bool get credentialConfigured;

  @BuiltValueField(wireName: r'is_active')
  bool get isActive;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  AiProviderProfileResponse._();

  factory AiProviderProfileResponse(
          [void updates(AiProviderProfileResponseBuilder b)]) =
      _$AiProviderProfileResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiProviderProfileResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiProviderProfileResponse> get serializer =>
      _$AiProviderProfileResponseSerializer();
}

class _$AiProviderProfileResponseSerializer
    implements PrimitiveSerializer<AiProviderProfileResponse> {
  @override
  final Iterable<Type> types = const [
    AiProviderProfileResponse,
    _$AiProviderProfileResponse
  ];

  @override
  final String wireName = r'AiProviderProfileResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiProviderProfileResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'display_name';
    yield serializers.serialize(
      object.displayName,
      specifiedType: const FullType(String),
    );
    yield r'engine';
    yield serializers.serialize(
      object.engine,
      specifiedType: const FullType(AiProviderEngine),
    );
    yield r'auth_mode';
    yield serializers.serialize(
      object.authMode,
      specifiedType: const FullType(AiProviderAuthMode),
    );
    yield r'base_url';
    yield object.baseUrl == null
        ? null
        : serializers.serialize(
            object.baseUrl,
            specifiedType: const FullType.nullable(String),
          );
    yield r'model';
    yield serializers.serialize(
      object.model,
      specifiedType: const FullType(String),
    );
    yield r'credential_configured';
    yield serializers.serialize(
      object.credentialConfigured,
      specifiedType: const FullType(bool),
    );
    yield r'is_active';
    yield serializers.serialize(
      object.isActive,
      specifiedType: const FullType(bool),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AiProviderProfileResponse object, {
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
    required AiProviderProfileResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        case r'display_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.displayName = valueDes;
          break;
        case r'engine':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiProviderEngine),
          ) as AiProviderEngine;
          result.engine = valueDes;
          break;
        case r'auth_mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiProviderAuthMode),
          ) as AiProviderAuthMode;
          result.authMode = valueDes;
          break;
        case r'base_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.baseUrl = valueDes;
          break;
        case r'model':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.model = valueDes;
          break;
        case r'credential_configured':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.credentialConfigured = valueDes;
          break;
        case r'is_active':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isActive = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiProviderProfileResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiProviderProfileResponseBuilder();
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
