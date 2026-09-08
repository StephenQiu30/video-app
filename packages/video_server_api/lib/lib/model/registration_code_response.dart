//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'registration_code_response.g.dart';

/// RegistrationCodeResponse
///
/// Properties:
/// * [emailSent]
/// * [expiresInSeconds]
/// * [retryAfterSeconds]
@BuiltValue()
abstract class RegistrationCodeResponse
    implements
        Built<RegistrationCodeResponse, RegistrationCodeResponseBuilder> {
  @BuiltValueField(wireName: r'email_sent')
  bool? get emailSent;

  @BuiltValueField(wireName: r'expires_in_seconds')
  int? get expiresInSeconds;

  @BuiltValueField(wireName: r'retry_after_seconds')
  int? get retryAfterSeconds;

  RegistrationCodeResponse._();

  factory RegistrationCodeResponse(
          [void updates(RegistrationCodeResponseBuilder b)]) =
      _$RegistrationCodeResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegistrationCodeResponseBuilder b) => b
    ..emailSent = true
    ..expiresInSeconds = 600
    ..retryAfterSeconds = 60;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegistrationCodeResponse> get serializer =>
      _$RegistrationCodeResponseSerializer();
}

class _$RegistrationCodeResponseSerializer
    implements PrimitiveSerializer<RegistrationCodeResponse> {
  @override
  final Iterable<Type> types = const [
    RegistrationCodeResponse,
    _$RegistrationCodeResponse
  ];

  @override
  final String wireName = r'RegistrationCodeResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegistrationCodeResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.emailSent != null) {
      yield r'email_sent';
      yield serializers.serialize(
        object.emailSent,
        specifiedType: const FullType(bool),
      );
    }
    if (object.expiresInSeconds != null) {
      yield r'expires_in_seconds';
      yield serializers.serialize(
        object.expiresInSeconds,
        specifiedType: const FullType(int),
      );
    }
    if (object.retryAfterSeconds != null) {
      yield r'retry_after_seconds';
      yield serializers.serialize(
        object.retryAfterSeconds,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RegistrationCodeResponse object, {
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
    required RegistrationCodeResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'email_sent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.emailSent = valueDes;
          break;
        case r'expires_in_seconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.expiresInSeconds = valueDes;
          break;
        case r'retry_after_seconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.retryAfterSeconds = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegistrationCodeResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegistrationCodeResponseBuilder();
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
