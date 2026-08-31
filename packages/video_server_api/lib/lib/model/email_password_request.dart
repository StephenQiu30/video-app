//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'email_password_request.g.dart';

/// EmailPasswordRequest
///
/// Properties:
/// * [email]
/// * [password]
@BuiltValue()
abstract class EmailPasswordRequest
    implements Built<EmailPasswordRequest, EmailPasswordRequestBuilder> {
  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'password')
  String get password;

  EmailPasswordRequest._();

  factory EmailPasswordRequest([void updates(EmailPasswordRequestBuilder b)]) =
      _$EmailPasswordRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EmailPasswordRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EmailPasswordRequest> get serializer =>
      _$EmailPasswordRequestSerializer();
}

class _$EmailPasswordRequestSerializer
    implements PrimitiveSerializer<EmailPasswordRequest> {
  @override
  final Iterable<Type> types = const [
    EmailPasswordRequest,
    _$EmailPasswordRequest
  ];

  @override
  final String wireName = r'EmailPasswordRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EmailPasswordRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'password';
    yield serializers.serialize(
      object.password,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EmailPasswordRequest object, {
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
    required EmailPasswordRequestBuilder result,
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
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.password = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EmailPasswordRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EmailPasswordRequestBuilder();
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
