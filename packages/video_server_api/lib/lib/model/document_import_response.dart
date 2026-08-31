//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/import_error_code.dart';
import 'package:video_server_api/lib/model/import_status.dart';
import 'package:video_server_api/lib/model/document_source_format.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'document_import_response.g.dart';

/// DocumentImportResponse
///
/// Properties:
/// * [id]
/// * [sourceFormat]
/// * [originalFilename]
/// * [declaredSizeBytes]
/// * [status]
/// * [attempt]
/// * [errorCode]
/// * [version]
/// * [createdAt]
/// * [updatedAt]
/// * [finishedAt]
@BuiltValue()
abstract class DocumentImportResponse
    implements Built<DocumentImportResponse, DocumentImportResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'source_format')
  DocumentSourceFormat get sourceFormat;
  // enum sourceFormatEnum {  docx,  pdf,  txt,  markdown,  fountain,  };

  @BuiltValueField(wireName: r'original_filename')
  String get originalFilename;

  @BuiltValueField(wireName: r'declared_size_bytes')
  int get declaredSizeBytes;

  @BuiltValueField(wireName: r'status')
  ImportStatus get status;
  // enum statusEnum {  uploading,  verifying,  ready,  failed,  cancelled,  expired,  };

  @BuiltValueField(wireName: r'attempt')
  int get attempt;

  @BuiltValueField(wireName: r'error_code')
  ImportErrorCode? get errorCode;
  // enum errorCodeEnum {  import_storage_unavailable,  upload_session_expired,  upload_incomplete,  import_size_mismatch,  import_sha256_mismatch,  video_import_invalid,  document_format_unsupported,  document_encrypted,  document_archive_unsafe,  document_text_unavailable,  document_structure_invalid,  };

  @BuiltValueField(wireName: r'version')
  int get version;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  @BuiltValueField(wireName: r'finished_at')
  DateTime? get finishedAt;

  DocumentImportResponse._();

  factory DocumentImportResponse(
          [void updates(DocumentImportResponseBuilder b)]) =
      _$DocumentImportResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DocumentImportResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DocumentImportResponse> get serializer =>
      _$DocumentImportResponseSerializer();
}

class _$DocumentImportResponseSerializer
    implements PrimitiveSerializer<DocumentImportResponse> {
  @override
  final Iterable<Type> types = const [
    DocumentImportResponse,
    _$DocumentImportResponse
  ];

  @override
  final String wireName = r'DocumentImportResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DocumentImportResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'source_format';
    yield serializers.serialize(
      object.sourceFormat,
      specifiedType: const FullType(DocumentSourceFormat),
    );
    yield r'original_filename';
    yield serializers.serialize(
      object.originalFilename,
      specifiedType: const FullType(String),
    );
    yield r'declared_size_bytes';
    yield serializers.serialize(
      object.declaredSizeBytes,
      specifiedType: const FullType(int),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(ImportStatus),
    );
    yield r'attempt';
    yield serializers.serialize(
      object.attempt,
      specifiedType: const FullType(int),
    );
    yield r'error_code';
    yield object.errorCode == null
        ? null
        : serializers.serialize(
            object.errorCode,
            specifiedType: const FullType.nullable(ImportErrorCode),
          );
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(int),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'finished_at';
    yield object.finishedAt == null
        ? null
        : serializers.serialize(
            object.finishedAt,
            specifiedType: const FullType.nullable(DateTime),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    DocumentImportResponse object, {
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
    required DocumentImportResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'source_format':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DocumentSourceFormat),
          ) as DocumentSourceFormat;
          result.sourceFormat = valueDes;
          break;
        case r'original_filename':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.originalFilename = valueDes;
          break;
        case r'declared_size_bytes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.declaredSizeBytes = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ImportStatus),
          ) as ImportStatus;
          result.status = valueDes;
          break;
        case r'attempt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.attempt = valueDes;
          break;
        case r'error_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ImportErrorCode),
          ) as ImportErrorCode?;
          if (valueDes == null) continue;
          result.errorCode = valueDes;
          break;
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.version = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        case r'finished_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.finishedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DocumentImportResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DocumentImportResponseBuilder();
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
