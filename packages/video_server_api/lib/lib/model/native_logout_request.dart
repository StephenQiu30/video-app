//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'native_logout_request.g.dart';

/// NativeLogoutRequest
///
/// Properties:
/// * [refreshToken]
@BuiltValue()
abstract class NativeLogoutRequest
    implements Built<NativeLogoutRequest, NativeLogoutRequestBuilder> {
  @BuiltValueField(wireName: r'refresh_token')
  String get refreshToken;

  NativeLogoutRequest._();

  factory NativeLogoutRequest([void updates(NativeLogoutRequestBuilder b)]) =
      _$NativeLogoutRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NativeLogoutRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NativeLogoutRequest> get serializer =>
      _$NativeLogoutRequestSerializer();
}

class _$NativeLogoutRequestSerializer
    implements PrimitiveSerializer<NativeLogoutRequest> {
  @override
  final Iterable<Type> types = const [
    NativeLogoutRequest,
    _$NativeLogoutRequest
  ];

  @override
  final String wireName = r'NativeLogoutRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NativeLogoutRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'refresh_token';
    yield serializers.serialize(
      object.refreshToken,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NativeLogoutRequest object, {
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
    required NativeLogoutRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'refresh_token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.refreshToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NativeLogoutRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NativeLogoutRequestBuilder();
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
