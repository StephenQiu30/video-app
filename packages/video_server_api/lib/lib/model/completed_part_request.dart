//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'completed_part_request.g.dart';

/// CompletedPartRequest
///
/// Properties:
/// * [partNumber]
/// * [etag]
@BuiltValue()
abstract class CompletedPartRequest
    implements Built<CompletedPartRequest, CompletedPartRequestBuilder> {
  @BuiltValueField(wireName: r'part_number')
  int get partNumber;

  @BuiltValueField(wireName: r'etag')
  String get etag;

  CompletedPartRequest._();

  factory CompletedPartRequest([void updates(CompletedPartRequestBuilder b)]) =
      _$CompletedPartRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CompletedPartRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CompletedPartRequest> get serializer =>
      _$CompletedPartRequestSerializer();
}

class _$CompletedPartRequestSerializer
    implements PrimitiveSerializer<CompletedPartRequest> {
  @override
  final Iterable<Type> types = const [
    CompletedPartRequest,
    _$CompletedPartRequest
  ];

  @override
  final String wireName = r'CompletedPartRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CompletedPartRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'part_number';
    yield serializers.serialize(
      object.partNumber,
      specifiedType: const FullType(int),
    );
    yield r'etag';
    yield serializers.serialize(
      object.etag,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CompletedPartRequest object, {
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
    required CompletedPartRequestBuilder result,
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
        case r'etag':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.etag = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CompletedPartRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CompletedPartRequestBuilder();
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
