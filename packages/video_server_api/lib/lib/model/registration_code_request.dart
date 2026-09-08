//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'registration_code_request.g.dart';

/// RegistrationCodeRequest
///
/// Properties:
/// * [email]
@BuiltValue()
abstract class RegistrationCodeRequest
    implements Built<RegistrationCodeRequest, RegistrationCodeRequestBuilder> {
  @BuiltValueField(wireName: r'email')
  String get email;

  RegistrationCodeRequest._();

  factory RegistrationCodeRequest(
          [void updates(RegistrationCodeRequestBuilder b)]) =
      _$RegistrationCodeRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegistrationCodeRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegistrationCodeRequest> get serializer =>
      _$RegistrationCodeRequestSerializer();
}

class _$RegistrationCodeRequestSerializer
    implements PrimitiveSerializer<RegistrationCodeRequest> {
  @override
  final Iterable<Type> types = const [
    RegistrationCodeRequest,
    _$RegistrationCodeRequest
  ];

  @override
  final String wireName = r'RegistrationCodeRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegistrationCodeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegistrationCodeRequest object, {
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
    required RegistrationCodeRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegistrationCodeRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegistrationCodeRequestBuilder();
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
