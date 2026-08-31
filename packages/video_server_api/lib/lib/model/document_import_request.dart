//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/document_source_format.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'document_import_request.g.dart';

/// DocumentImportRequest
///
/// Properties:
/// * [fileName]
/// * [sourceFormat]
/// * [declaredSizeBytes]
/// * [declaredSha256]
/// * [rightsAccepted]
@BuiltValue()
abstract class DocumentImportRequest
    implements Built<DocumentImportRequest, DocumentImportRequestBuilder> {
  @BuiltValueField(wireName: r'file_name')
  String get fileName;

  @BuiltValueField(wireName: r'source_format')
  DocumentSourceFormat get sourceFormat;
  // enum sourceFormatEnum {  docx,  pdf,  txt,  markdown,  fountain,  };

  @BuiltValueField(wireName: r'declared_size_bytes')
  int get declaredSizeBytes;

  @BuiltValueField(wireName: r'declared_sha256')
  String get declaredSha256;

  @BuiltValueField(wireName: r'rights_accepted')
  bool get rightsAccepted;

  DocumentImportRequest._();

  factory DocumentImportRequest(
      [void updates(DocumentImportRequestBuilder b)]) = _$DocumentImportRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DocumentImportRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DocumentImportRequest> get serializer =>
      _$DocumentImportRequestSerializer();
}

class _$DocumentImportRequestSerializer
    implements PrimitiveSerializer<DocumentImportRequest> {
  @override
  final Iterable<Type> types = const [
    DocumentImportRequest,
    _$DocumentImportRequest
  ];

  @override
  final String wireName = r'DocumentImportRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DocumentImportRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'file_name';
    yield serializers.serialize(
      object.fileName,
      specifiedType: const FullType(String),
    );
    yield r'source_format';
    yield serializers.serialize(
      object.sourceFormat,
      specifiedType: const FullType(DocumentSourceFormat),
    );
    yield r'declared_size_bytes';
    yield serializers.serialize(
      object.declaredSizeBytes,
      specifiedType: const FullType(int),
    );
    yield r'declared_sha256';
    yield serializers.serialize(
      object.declaredSha256,
      specifiedType: const FullType(String),
    );
    yield r'rights_accepted';
    yield serializers.serialize(
      object.rightsAccepted,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DocumentImportRequest object, {
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
    required DocumentImportRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'file_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fileName = valueDes;
          break;
        case r'source_format':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DocumentSourceFormat),
          ) as DocumentSourceFormat;
          result.sourceFormat = valueDes;
          break;
        case r'declared_size_bytes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.declaredSizeBytes = valueDes;
          break;
        case r'declared_sha256':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.declaredSha256 = valueDes;
          break;
        case r'rights_accepted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.rightsAccepted = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DocumentImportRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DocumentImportRequestBuilder();
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
