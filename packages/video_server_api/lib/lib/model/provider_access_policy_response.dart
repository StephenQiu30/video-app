//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/provider_access_policy.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'provider_access_policy_response.g.dart';

/// ProviderAccessPolicyResponse
///
/// Properties:
/// * [id]
/// * [configured]
@BuiltValue()
abstract class ProviderAccessPolicyResponse
    implements
        Built<ProviderAccessPolicyResponse,
            ProviderAccessPolicyResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  ProviderAccessPolicy get id;
  // enum idEnum {  public,  public_session,  operator_public,  personal_entitled,  };

  @BuiltValueField(wireName: r'configured')
  bool get configured;

  ProviderAccessPolicyResponse._();

  factory ProviderAccessPolicyResponse(
          [void updates(ProviderAccessPolicyResponseBuilder b)]) =
      _$ProviderAccessPolicyResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProviderAccessPolicyResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProviderAccessPolicyResponse> get serializer =>
      _$ProviderAccessPolicyResponseSerializer();
}

class _$ProviderAccessPolicyResponseSerializer
    implements PrimitiveSerializer<ProviderAccessPolicyResponse> {
  @override
  final Iterable<Type> types = const [
    ProviderAccessPolicyResponse,
    _$ProviderAccessPolicyResponse
  ];

  @override
  final String wireName = r'ProviderAccessPolicyResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProviderAccessPolicyResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(ProviderAccessPolicy),
    );
    yield r'configured';
    yield serializers.serialize(
      object.configured,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ProviderAccessPolicyResponse object, {
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
    required ProviderAccessPolicyResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ProviderAccessPolicy),
          ) as ProviderAccessPolicy;
          result.id = valueDes;
          break;
        case r'configured':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.configured = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProviderAccessPolicyResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProviderAccessPolicyResponseBuilder();
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
