//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/download_error_code.dart';
import 'package:video_server_api/lib/model/download_status.dart';
import 'package:video_server_api/lib/model/media_kind.dart';
import 'package:video_server_api/lib/model/semantic_plan_response.dart';
import 'package:video_server_api/lib/model/download_source_kind.dart';
import 'package:video_server_api/lib/model/download_stage.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_response.g.dart';

/// Current state of a durable asynchronous download resource.
///
/// Properties:
/// * [id]
/// * [inspectionId]
/// * [formatId]
/// * [sourceKind]
/// * [sourceLabel]
/// * [status]
/// * [stage]
/// * [progress]
/// * [attempt]
/// * [version]
/// * [errorCode]
/// * [errorMessage]
/// * [createdAt]
/// * [updatedAt]
/// * [finishedAt]
/// * [fileAvailable]
/// * [title]
/// * [extractorKey]
/// * [durationSeconds]
/// * [mediaKind]
/// * [assetCount]
/// * [thumbnailUrl]
/// * [format]
@BuiltValue()
abstract class DownloadResponse
    implements Built<DownloadResponse, DownloadResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'inspection_id')
  String? get inspectionId;

  @BuiltValueField(wireName: r'format_id')
  String? get formatId;

  @BuiltValueField(wireName: r'source_kind')
  DownloadSourceKind get sourceKind;
  // enum sourceKindEnum {  remote_provider,  browser_import,  };

  @BuiltValueField(wireName: r'source_label')
  String get sourceLabel;

  @BuiltValueField(wireName: r'status')
  DownloadStatus get status;
  // enum statusEnum {  queued,  running,  retry_wait,  succeeded,  failed,  cancelled,  };

  @BuiltValueField(wireName: r'stage')
  DownloadStage? get stage;
  // enum stageEnum {  revalidating,  downloading,  remuxing,  verifying,  uploading,  };

  @BuiltValueField(wireName: r'progress')
  int get progress;

  @BuiltValueField(wireName: r'attempt')
  int get attempt;

  @BuiltValueField(wireName: r'version')
  int get version;

  @BuiltValueField(wireName: r'error_code')
  DownloadErrorCode? get errorCode;
  // enum errorCodeEnum {  cancelled,  download_timeout,  format_unavailable,  inspection_timeout,  internal_error,  media_validation_failed,  output_limit_exceeded,  provider_auth_required,  provider_content_restricted,  provider_drm_protected,  provider_geo_restricted,  provider_link_unavailable,  provider_media_unsupported,  provider_rate_limited,  provider_session_expired,  provider_temporarily_unavailable,  provider_unsupported,  provider_verification_failed,  storage_unavailable,  temp_space_exhausted,  transcode_required,  unsupported_source,  worker_lost,  };

  @BuiltValueField(wireName: r'error_message')
  String? get errorMessage;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  @BuiltValueField(wireName: r'finished_at')
  DateTime? get finishedAt;

  @BuiltValueField(wireName: r'file_available')
  bool get fileAvailable;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'extractor_key')
  String? get extractorKey;

  @BuiltValueField(wireName: r'duration_seconds')
  int? get durationSeconds;

  @BuiltValueField(wireName: r'media_kind')
  MediaKind get mediaKind;
  // enum mediaKindEnum {  video,  image_gallery,  video_collection,  };

  @BuiltValueField(wireName: r'asset_count')
  int get assetCount;

  @BuiltValueField(wireName: r'thumbnail_url')
  String? get thumbnailUrl;

  @BuiltValueField(wireName: r'format')
  SemanticPlanResponse? get format;

  DownloadResponse._();

  factory DownloadResponse([void updates(DownloadResponseBuilder b)]) =
      _$DownloadResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DownloadResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DownloadResponse> get serializer =>
      _$DownloadResponseSerializer();
}

class _$DownloadResponseSerializer
    implements PrimitiveSerializer<DownloadResponse> {
  @override
  final Iterable<Type> types = const [DownloadResponse, _$DownloadResponse];

  @override
  final String wireName = r'DownloadResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DownloadResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'inspection_id';
    yield object.inspectionId == null
        ? null
        : serializers.serialize(
            object.inspectionId,
            specifiedType: const FullType.nullable(String),
          );
    yield r'format_id';
    yield object.formatId == null
        ? null
        : serializers.serialize(
            object.formatId,
            specifiedType: const FullType.nullable(String),
          );
    yield r'source_kind';
    yield serializers.serialize(
      object.sourceKind,
      specifiedType: const FullType(DownloadSourceKind),
    );
    yield r'source_label';
    yield serializers.serialize(
      object.sourceLabel,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(DownloadStatus),
    );
    yield r'stage';
    yield object.stage == null
        ? null
        : serializers.serialize(
            object.stage,
            specifiedType: const FullType.nullable(DownloadStage),
          );
    yield r'progress';
    yield serializers.serialize(
      object.progress,
      specifiedType: const FullType(int),
    );
    yield r'attempt';
    yield serializers.serialize(
      object.attempt,
      specifiedType: const FullType(int),
    );
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(int),
    );
    yield r'error_code';
    yield object.errorCode == null
        ? null
        : serializers.serialize(
            object.errorCode,
            specifiedType: const FullType.nullable(DownloadErrorCode),
          );
    yield r'error_message';
    yield object.errorMessage == null
        ? null
        : serializers.serialize(
            object.errorMessage,
            specifiedType: const FullType.nullable(String),
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
    yield r'file_available';
    yield serializers.serialize(
      object.fileAvailable,
      specifiedType: const FullType(bool),
    );
    yield r'title';
    yield object.title == null
        ? null
        : serializers.serialize(
            object.title,
            specifiedType: const FullType.nullable(String),
          );
    yield r'extractor_key';
    yield object.extractorKey == null
        ? null
        : serializers.serialize(
            object.extractorKey,
            specifiedType: const FullType.nullable(String),
          );
    yield r'duration_seconds';
    yield object.durationSeconds == null
        ? null
        : serializers.serialize(
            object.durationSeconds,
            specifiedType: const FullType.nullable(int),
          );
    yield r'media_kind';
    yield serializers.serialize(
      object.mediaKind,
      specifiedType: const FullType(MediaKind),
    );
    yield r'asset_count';
    yield serializers.serialize(
      object.assetCount,
      specifiedType: const FullType(int),
    );
    yield r'thumbnail_url';
    yield object.thumbnailUrl == null
        ? null
        : serializers.serialize(
            object.thumbnailUrl,
            specifiedType: const FullType.nullable(String),
          );
    yield r'format';
    yield object.format == null
        ? null
        : serializers.serialize(
            object.format,
            specifiedType: const FullType.nullable(SemanticPlanResponse),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    DownloadResponse object, {
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
    required DownloadResponseBuilder result,
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
        case r'inspection_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.inspectionId = valueDes;
          break;
        case r'format_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.formatId = valueDes;
          break;
        case r'source_kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DownloadSourceKind),
          ) as DownloadSourceKind;
          result.sourceKind = valueDes;
          break;
        case r'source_label':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourceLabel = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DownloadStatus),
          ) as DownloadStatus;
          result.status = valueDes;
          break;
        case r'stage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DownloadStage),
          ) as DownloadStage?;
          if (valueDes == null) continue;
          result.stage = valueDes;
          break;
        case r'progress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.progress = valueDes;
          break;
        case r'attempt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.attempt = valueDes;
          break;
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.version = valueDes;
          break;
        case r'error_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DownloadErrorCode),
          ) as DownloadErrorCode?;
          if (valueDes == null) continue;
          result.errorCode = valueDes;
          break;
        case r'error_message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMessage = valueDes;
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
        case r'file_available':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.fileAvailable = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.title = valueDes;
          break;
        case r'extractor_key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.extractorKey = valueDes;
          break;
        case r'duration_seconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.durationSeconds = valueDes;
          break;
        case r'media_kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MediaKind),
          ) as MediaKind;
          result.mediaKind = valueDes;
          break;
        case r'asset_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.assetCount = valueDes;
          break;
        case r'thumbnail_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.thumbnailUrl = valueDes;
          break;
        case r'format':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SemanticPlanResponse),
          ) as SemanticPlanResponse?;
          if (valueDes == null) continue;
          result.format.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DownloadResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DownloadResponseBuilder();
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
