//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'native_refresh_request.g.dart';

/// NativeRefreshRequest
///
/// Properties:
/// * [refreshToken]
@BuiltValue()
abstract class NativeRefreshRequest
    implements Built<NativeRefreshRequest, NativeRefreshRequestBuilder> {
  @BuiltValueField(wireName: r'refresh_token')
  String get refreshToken;

  NativeRefreshRequest._();

  factory NativeRefreshRequest([void updates(NativeRefreshRequestBuilder b)]) =
      _$NativeRefreshRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NativeRefreshRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NativeRefreshRequest> get serializer =>
      _$NativeRefreshRequestSerializer();
}

class _$NativeRefreshRequestSerializer
    implements PrimitiveSerializer<NativeRefreshRequest> {
  @override
  final Iterable<Type> types = const [
    NativeRefreshRequest,
    _$NativeRefreshRequest
  ];

  @override
  final String wireName = r'NativeRefreshRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NativeRefreshRequest object, {
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
    NativeRefreshRequest object, {
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
    required NativeRefreshRequestBuilder result,
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
  NativeRefreshRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NativeRefreshRequestBuilder();
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
