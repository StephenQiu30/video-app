//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/completed_part_request.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'complete_media_import_request.g.dart';

/// CompleteMediaImportRequest
///
/// Properties:
/// * [parts]
@BuiltValue()
abstract class CompleteMediaImportRequest
    implements
        Built<CompleteMediaImportRequest, CompleteMediaImportRequestBuilder> {
  @BuiltValueField(wireName: r'parts')
  BuiltList<CompletedPartRequest> get parts;

  CompleteMediaImportRequest._();

  factory CompleteMediaImportRequest(
          [void updates(CompleteMediaImportRequestBuilder b)]) =
      _$CompleteMediaImportRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CompleteMediaImportRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CompleteMediaImportRequest> get serializer =>
      _$CompleteMediaImportRequestSerializer();
}

class _$CompleteMediaImportRequestSerializer
    implements PrimitiveSerializer<CompleteMediaImportRequest> {
  @override
  final Iterable<Type> types = const [
    CompleteMediaImportRequest,
    _$CompleteMediaImportRequest
  ];

  @override
  final String wireName = r'CompleteMediaImportRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CompleteMediaImportRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'parts';
    yield serializers.serialize(
      object.parts,
      specifiedType:
          const FullType(BuiltList, [FullType(CompletedPartRequest)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CompleteMediaImportRequest object, {
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
    required CompleteMediaImportRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'parts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(CompletedPartRequest)]),
          ) as BuiltList<CompletedPartRequest>;
          result.parts.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CompleteMediaImportRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CompleteMediaImportRequestBuilder();
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
