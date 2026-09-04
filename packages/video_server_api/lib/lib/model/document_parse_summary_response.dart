//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'document_parse_summary_response.g.dart';

/// DocumentParseSummaryResponse
///
/// Properties:
/// * [pageCount]
/// * [paragraphCount]
/// * [headingCount]
/// * [listItemCount]
/// * [tableCount]
/// * [dialogueBlockCount]
@BuiltValue()
abstract class DocumentParseSummaryResponse
    implements
        Built<DocumentParseSummaryResponse,
            DocumentParseSummaryResponseBuilder> {
  @BuiltValueField(wireName: r'page_count')
  int? get pageCount;

  @BuiltValueField(wireName: r'paragraph_count')
  int get paragraphCount;

  @BuiltValueField(wireName: r'heading_count')
  int get headingCount;

  @BuiltValueField(wireName: r'list_item_count')
  int get listItemCount;

  @BuiltValueField(wireName: r'table_count')
  int get tableCount;

  @BuiltValueField(wireName: r'dialogue_block_count')
  int get dialogueBlockCount;

  DocumentParseSummaryResponse._();

  factory DocumentParseSummaryResponse(
          [void updates(DocumentParseSummaryResponseBuilder b)]) =
      _$DocumentParseSummaryResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DocumentParseSummaryResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DocumentParseSummaryResponse> get serializer =>
      _$DocumentParseSummaryResponseSerializer();
}

class _$DocumentParseSummaryResponseSerializer
    implements PrimitiveSerializer<DocumentParseSummaryResponse> {
  @override
  final Iterable<Type> types = const [
    DocumentParseSummaryResponse,
    _$DocumentParseSummaryResponse
  ];

  @override
  final String wireName = r'DocumentParseSummaryResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DocumentParseSummaryResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'page_count';
    yield object.pageCount == null
        ? null
        : serializers.serialize(
            object.pageCount,
            specifiedType: const FullType.nullable(int),
          );
    yield r'paragraph_count';
    yield serializers.serialize(
      object.paragraphCount,
      specifiedType: const FullType(int),
    );
    yield r'heading_count';
    yield serializers.serialize(
      object.headingCount,
      specifiedType: const FullType(int),
    );
    yield r'list_item_count';
    yield serializers.serialize(
      object.listItemCount,
      specifiedType: const FullType(int),
    );
    yield r'table_count';
    yield serializers.serialize(
      object.tableCount,
      specifiedType: const FullType(int),
    );
    yield r'dialogue_block_count';
    yield serializers.serialize(
      object.dialogueBlockCount,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DocumentParseSummaryResponse object, {
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
    required DocumentParseSummaryResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'page_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.pageCount = valueDes;
          break;
        case r'paragraph_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.paragraphCount = valueDes;
          break;
        case r'heading_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.headingCount = valueDes;
          break;
        case r'list_item_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.listItemCount = valueDes;
          break;
        case r'table_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.tableCount = valueDes;
          break;
        case r'dialogue_block_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.dialogueBlockCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DocumentParseSummaryResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DocumentParseSummaryResponseBuilder();
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
