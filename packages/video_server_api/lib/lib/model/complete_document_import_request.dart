//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/completed_part_request.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'complete_document_import_request.g.dart';

/// CompleteDocumentImportRequest
///
/// Properties:
/// * [parts]
@BuiltValue()
abstract class CompleteDocumentImportRequest
    implements
        Built<CompleteDocumentImportRequest,
            CompleteDocumentImportRequestBuilder> {
  @BuiltValueField(wireName: r'parts')
  BuiltList<CompletedPartRequest> get parts;

  CompleteDocumentImportRequest._();

  factory CompleteDocumentImportRequest(
          [void updates(CompleteDocumentImportRequestBuilder b)]) =
      _$CompleteDocumentImportRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CompleteDocumentImportRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CompleteDocumentImportRequest> get serializer =>
      _$CompleteDocumentImportRequestSerializer();
}

class _$CompleteDocumentImportRequestSerializer
    implements PrimitiveSerializer<CompleteDocumentImportRequest> {
  @override
  final Iterable<Type> types = const [
    CompleteDocumentImportRequest,
    _$CompleteDocumentImportRequest
  ];

  @override
  final String wireName = r'CompleteDocumentImportRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CompleteDocumentImportRequest object, {
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
    CompleteDocumentImportRequest object, {
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
    required CompleteDocumentImportRequestBuilder result,
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
  CompleteDocumentImportRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CompleteDocumentImportRequestBuilder();
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
