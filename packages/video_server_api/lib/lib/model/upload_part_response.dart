//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upload_part_response.g.dart';

/// UploadPartResponse
///
/// Properties:
/// * [partNumber]
/// * [url]
@BuiltValue()
abstract class UploadPartResponse
    implements Built<UploadPartResponse, UploadPartResponseBuilder> {
  @BuiltValueField(wireName: r'part_number')
  int get partNumber;

  @BuiltValueField(wireName: r'url')
  String get url;

  UploadPartResponse._();

  factory UploadPartResponse([void updates(UploadPartResponseBuilder b)]) =
      _$UploadPartResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UploadPartResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UploadPartResponse> get serializer =>
      _$UploadPartResponseSerializer();
}

class _$UploadPartResponseSerializer
    implements PrimitiveSerializer<UploadPartResponse> {
  @override
  final Iterable<Type> types = const [UploadPartResponse, _$UploadPartResponse];

  @override
  final String wireName = r'UploadPartResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UploadPartResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'part_number';
    yield serializers.serialize(
      object.partNumber,
      specifiedType: const FullType(int),
    );
    yield r'url';
    yield serializers.serialize(
      object.url,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UploadPartResponse object, {
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
    required UploadPartResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'part_number':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.partNumber = valueDes;
          break;
        case r'url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.url = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UploadPartResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UploadPartResponseBuilder();
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
