//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:video_server_api/lib/model/import_error_code.dart';
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/import_status.dart';
import 'package:video_server_api/lib/model/document_source_format.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'document_response.g.dart';

/// DocumentResponse
///
/// Properties:
/// * [id]
/// * [title]
/// * [originalFilename]
/// * [sourceFormat]
/// * [declaredSizeBytes]
/// * [status]
/// * [attempt]
/// * [errorCode]
/// * [version]
/// * [detectedLanguage]
/// * [sceneCount]
/// * [characterCount]
/// * [qualityWarnings]
/// * [createdAt]
/// * [updatedAt]
/// * [finishedAt]
@BuiltValue()
abstract class DocumentResponse
    implements Built<DocumentResponse, DocumentResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'original_filename')
  String get originalFilename;

  @BuiltValueField(wireName: r'source_format')
  DocumentSourceFormat get sourceFormat;
  // enum sourceFormatEnum {  docx,  pdf,  txt,  markdown,  fountain,  };

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

  @BuiltValueField(wireName: r'detected_language')
  String? get detectedLanguage;

  @BuiltValueField(wireName: r'scene_count')
  int? get sceneCount;

  @BuiltValueField(wireName: r'character_count')
  int? get characterCount;

  @BuiltValueField(wireName: r'quality_warnings')
  BuiltList<String> get qualityWarnings;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  @BuiltValueField(wireName: r'finished_at')
  DateTime? get finishedAt;

  DocumentResponse._();

  factory DocumentResponse([void updates(DocumentResponseBuilder b)]) =
      _$DocumentResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DocumentResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DocumentResponse> get serializer =>
      _$DocumentResponseSerializer();
}

class _$DocumentResponseSerializer
    implements PrimitiveSerializer<DocumentResponse> {
  @override
  final Iterable<Type> types = const [DocumentResponse, _$DocumentResponse];

  @override
  final String wireName = r'DocumentResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DocumentResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'original_filename';
    yield serializers.serialize(
      object.originalFilename,
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
    yield r'detected_language';
    yield object.detectedLanguage == null
        ? null
        : serializers.serialize(
            object.detectedLanguage,
            specifiedType: const FullType.nullable(String),
          );
    yield r'scene_count';
    yield object.sceneCount == null
        ? null
        : serializers.serialize(
            object.sceneCount,
            specifiedType: const FullType.nullable(int),
          );
    yield r'character_count';
    yield object.characterCount == null
        ? null
        : serializers.serialize(
            object.characterCount,
            specifiedType: const FullType.nullable(int),
          );
    yield r'quality_warnings';
    yield serializers.serialize(
      object.qualityWarnings,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
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
    DocumentResponse object, {
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
    required DocumentResponseBuilder result,
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
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'original_filename':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.originalFilename = valueDes;
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
        case r'detected_language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.detectedLanguage = valueDes;
          break;
        case r'scene_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.sceneCount = valueDes;
          break;
        case r'character_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.characterCount = valueDes;
          break;
        case r'quality_warnings':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.qualityWarnings.replace(valueDes);
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
  DocumentResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DocumentResponseBuilder();
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
