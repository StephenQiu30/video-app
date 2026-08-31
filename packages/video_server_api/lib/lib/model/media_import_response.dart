//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/declared_origin.dart';
import 'package:video_server_api/lib/model/import_error_code.dart';
import 'package:video_server_api/lib/model/import_source_format.dart';
import 'package:video_server_api/lib/model/import_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'media_import_response.g.dart';

/// Owner-scoped public state without storage credentials or object keys.
///
/// Properties:
/// * [id]
/// * [downloadId]
/// * [sourceFormat]
/// * [displayName]
/// * [declaredSizeBytes]
/// * [status]
/// * [attempt]
/// * [errorCode]
/// * [version]
/// * [createdAt]
/// * [updatedAt]
/// * [finishedAt]
/// * [declaredOrigin]
@BuiltValue()
abstract class MediaImportResponse
    implements Built<MediaImportResponse, MediaImportResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'download_id')
  String get downloadId;

  @BuiltValueField(wireName: r'source_format')
  ImportSourceFormat get sourceFormat;
  // enum sourceFormatEnum {  mp4,  docx,  pdf,  txt,  markdown,  fountain,  };

  @BuiltValueField(wireName: r'display_name')
  String get displayName;

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

  @BuiltValueField(wireName: r'declared_origin')
  DeclaredOrigin get declaredOrigin;
  // enum declaredOriginEnum {  user_file,  wechat_channels,  };

  MediaImportResponse._();

  factory MediaImportResponse([void updates(MediaImportResponseBuilder b)]) =
      _$MediaImportResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MediaImportResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MediaImportResponse> get serializer =>
      _$MediaImportResponseSerializer();
}

class _$MediaImportResponseSerializer
    implements PrimitiveSerializer<MediaImportResponse> {
  @override
  final Iterable<Type> types = const [
    MediaImportResponse,
    _$MediaImportResponse
  ];

  @override
  final String wireName = r'MediaImportResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MediaImportResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'download_id';
    yield serializers.serialize(
      object.downloadId,
      specifiedType: const FullType(String),
    );
    yield r'source_format';
    yield serializers.serialize(
      object.sourceFormat,
      specifiedType: const FullType(ImportSourceFormat),
    );
    yield r'display_name';
    yield serializers.serialize(
      object.displayName,
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
    yield r'declared_origin';
    yield serializers.serialize(
      object.declaredOrigin,
      specifiedType: const FullType(DeclaredOrigin),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MediaImportResponse object, {
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
    required MediaImportResponseBuilder result,
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
        case r'download_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.downloadId = valueDes;
          break;
        case r'source_format':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ImportSourceFormat),
          ) as ImportSourceFormat;
          result.sourceFormat = valueDes;
          break;
        case r'display_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.displayName = valueDes;
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
        case r'declared_origin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DeclaredOrigin),
          ) as DeclaredOrigin;
          result.declaredOrigin = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MediaImportResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MediaImportResponseBuilder();
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
