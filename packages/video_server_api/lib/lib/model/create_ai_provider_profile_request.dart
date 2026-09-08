//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/ai_provider_engine.dart';
import 'package:video_server_api/lib/model/ai_provider_auth_mode.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_ai_provider_profile_request.g.dart';

/// CreateAiProviderProfileRequest
///
/// Properties:
/// * [key]
/// * [displayName]
/// * [engine]
/// * [authMode]
/// * [baseUrl]
/// * [model]
/// * [apiKey]
@BuiltValue()
abstract class CreateAiProviderProfileRequest
    implements
        Built<CreateAiProviderProfileRequest,
            CreateAiProviderProfileRequestBuilder> {
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

  @BuiltValueField(wireName: r'api_key')
  String? get apiKey;

  CreateAiProviderProfileRequest._();

  factory CreateAiProviderProfileRequest(
          [void updates(CreateAiProviderProfileRequestBuilder b)]) =
      _$CreateAiProviderProfileRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateAiProviderProfileRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateAiProviderProfileRequest> get serializer =>
      _$CreateAiProviderProfileRequestSerializer();
}

class _$CreateAiProviderProfileRequestSerializer
    implements PrimitiveSerializer<CreateAiProviderProfileRequest> {
  @override
  final Iterable<Type> types = const [
    CreateAiProviderProfileRequest,
    _$CreateAiProviderProfileRequest
  ];

  @override
  final String wireName = r'CreateAiProviderProfileRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateAiProviderProfileRequest object, {
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
    if (object.baseUrl != null) {
      yield r'base_url';
      yield serializers.serialize(
        object.baseUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'model';
    yield serializers.serialize(
      object.model,
      specifiedType: const FullType(String),
    );
    if (object.apiKey != null) {
      yield r'api_key';
      yield serializers.serialize(
        object.apiKey,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateAiProviderProfileRequest object, {
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
    required CreateAiProviderProfileRequestBuilder result,
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
        case r'api_key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.apiKey = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateAiProviderProfileRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateAiProviderProfileRequestBuilder();
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
