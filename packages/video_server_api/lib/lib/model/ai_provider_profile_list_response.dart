//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/ai_provider_profile_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_provider_profile_list_response.g.dart';

/// AiProviderProfileListResponse
///
/// Properties:
/// * [items]
/// * [agentAvailable]
@BuiltValue()
abstract class AiProviderProfileListResponse
    implements
        Built<AiProviderProfileListResponse,
            AiProviderProfileListResponseBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<AiProviderProfileResponse> get items;

  @BuiltValueField(wireName: r'agent_available')
  bool get agentAvailable;

  AiProviderProfileListResponse._();

  factory AiProviderProfileListResponse(
          [void updates(AiProviderProfileListResponseBuilder b)]) =
      _$AiProviderProfileListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiProviderProfileListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiProviderProfileListResponse> get serializer =>
      _$AiProviderProfileListResponseSerializer();
}

class _$AiProviderProfileListResponseSerializer
    implements PrimitiveSerializer<AiProviderProfileListResponse> {
  @override
  final Iterable<Type> types = const [
    AiProviderProfileListResponse,
    _$AiProviderProfileListResponse
  ];

  @override
  final String wireName = r'AiProviderProfileListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiProviderProfileListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(AiProviderProfileResponse)]),
    );
    yield r'agent_available';
    yield serializers.serialize(
      object.agentAvailable,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AiProviderProfileListResponse object, {
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
    required AiProviderProfileListResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(AiProviderProfileResponse)]),
          ) as BuiltList<AiProviderProfileResponse>;
          result.items.replace(valueDes);
          break;
        case r'agent_available':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.agentAvailable = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiProviderProfileListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiProviderProfileListResponseBuilder();
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
