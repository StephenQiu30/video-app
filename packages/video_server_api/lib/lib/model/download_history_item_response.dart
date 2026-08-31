//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/download_error_code.dart';
import 'package:video_server_api/lib/model/download_status.dart';
import 'package:video_server_api/lib/model/download_source_kind.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_history_item_response.g.dart';

/// DownloadHistoryItemResponse
///
/// Properties:
/// * [id]
/// * [title]
/// * [thumbnailUrl]
/// * [formatName]
/// * [status]
/// * [progress]
/// * [errorCode]
/// * [createdAt]
/// * [updatedAt]
/// * [finishedAt]
/// * [fileAvailable]
/// * [sourceKind]
/// * [sourceLabel]
@BuiltValue()
abstract class DownloadHistoryItemResponse
    implements
        Built<DownloadHistoryItemResponse, DownloadHistoryItemResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'thumbnail_url')
  String? get thumbnailUrl;

  @BuiltValueField(wireName: r'format_name')
  String get formatName;

  @BuiltValueField(wireName: r'status')
  DownloadStatus get status;
  // enum statusEnum {  queued,  running,  retry_wait,  succeeded,  failed,  cancelled,  };

  @BuiltValueField(wireName: r'progress')
  int get progress;

  @BuiltValueField(wireName: r'error_code')
  DownloadErrorCode? get errorCode;
  // enum errorCodeEnum {  cancelled,  download_timeout,  format_unavailable,  inspection_timeout,  internal_error,  media_validation_failed,  output_limit_exceeded,  provider_auth_required,  provider_content_restricted,  provider_drm_protected,  provider_geo_restricted,  provider_link_unavailable,  provider_media_unsupported,  provider_rate_limited,  provider_session_expired,  provider_temporarily_unavailable,  provider_unsupported,  provider_verification_failed,  storage_unavailable,  temp_space_exhausted,  transcode_required,  unsupported_source,  worker_lost,  };

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  @BuiltValueField(wireName: r'finished_at')
  DateTime? get finishedAt;

  @BuiltValueField(wireName: r'file_available')
  bool get fileAvailable;

  @BuiltValueField(wireName: r'source_kind')
  DownloadSourceKind get sourceKind;
  // enum sourceKindEnum {  remote_provider,  browser_import,  };

  @BuiltValueField(wireName: r'source_label')
  String get sourceLabel;

  DownloadHistoryItemResponse._();

  factory DownloadHistoryItemResponse(
          [void updates(DownloadHistoryItemResponseBuilder b)]) =
      _$DownloadHistoryItemResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DownloadHistoryItemResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DownloadHistoryItemResponse> get serializer =>
      _$DownloadHistoryItemResponseSerializer();
}

class _$DownloadHistoryItemResponseSerializer
    implements PrimitiveSerializer<DownloadHistoryItemResponse> {
  @override
  final Iterable<Type> types = const [
    DownloadHistoryItemResponse,
    _$DownloadHistoryItemResponse
  ];

  @override
  final String wireName = r'DownloadHistoryItemResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DownloadHistoryItemResponse object, {
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
    yield r'thumbnail_url';
    yield object.thumbnailUrl == null
        ? null
        : serializers.serialize(
            object.thumbnailUrl,
            specifiedType: const FullType.nullable(String),
          );
    yield r'format_name';
    yield serializers.serialize(
      object.formatName,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(DownloadStatus),
    );
    yield r'progress';
    yield serializers.serialize(
      object.progress,
      specifiedType: const FullType(int),
    );
    yield r'error_code';
    yield object.errorCode == null
        ? null
        : serializers.serialize(
            object.errorCode,
            specifiedType: const FullType.nullable(DownloadErrorCode),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    DownloadHistoryItemResponse object, {
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
    required DownloadHistoryItemResponseBuilder result,
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
        case r'thumbnail_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.thumbnailUrl = valueDes;
          break;
        case r'format_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.formatName = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DownloadStatus),
          ) as DownloadStatus;
          result.status = valueDes;
          break;
        case r'progress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.progress = valueDes;
          break;
        case r'error_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DownloadErrorCode),
          ) as DownloadErrorCode?;
          if (valueDes == null) continue;
          result.errorCode = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DownloadHistoryItemResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DownloadHistoryItemResponseBuilder();
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
