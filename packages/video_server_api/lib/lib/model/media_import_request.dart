//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/declared_origin.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'media_import_request.g.dart';

/// Untrusted browser declarations for one local MP4 resource.
///
/// Properties:
/// * [fileName]
/// * [declaredSizeBytes]
/// * [declaredSha256]
/// * [rightsAccepted]
/// * [declaredOrigin]
@BuiltValue()
abstract class MediaImportRequest
    implements Built<MediaImportRequest, MediaImportRequestBuilder> {
  @BuiltValueField(wireName: r'file_name')
  String get fileName;

  @BuiltValueField(wireName: r'declared_size_bytes')
  int get declaredSizeBytes;

  @BuiltValueField(wireName: r'declared_sha256')
  String get declaredSha256;

  @BuiltValueField(wireName: r'rights_accepted')
  bool get rightsAccepted;

  @BuiltValueField(wireName: r'declared_origin')
  DeclaredOrigin? get declaredOrigin;
  // enum declaredOriginEnum {  user_file,  wechat_channels,  };

  MediaImportRequest._();

  factory MediaImportRequest([void updates(MediaImportRequestBuilder b)]) =
      _$MediaImportRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MediaImportRequestBuilder b) =>
      b..declaredOrigin = DeclaredOrigin.userFile;

  @BuiltValueSerializer(custom: true)
  static Serializer<MediaImportRequest> get serializer =>
      _$MediaImportRequestSerializer();
}

class _$MediaImportRequestSerializer
    implements PrimitiveSerializer<MediaImportRequest> {
  @override
  final Iterable<Type> types = const [MediaImportRequest, _$MediaImportRequest];

  @override
  final String wireName = r'MediaImportRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MediaImportRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'file_name';
    yield serializers.serialize(
      object.fileName,
      specifiedType: const FullType(String),
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
    if (object.declaredOrigin != null) {
      yield r'declared_origin';
      yield serializers.serialize(
        object.declaredOrigin,
        specifiedType: const FullType(DeclaredOrigin),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MediaImportRequest object, {
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
    required MediaImportRequestBuilder result,
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
  MediaImportRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MediaImportRequestBuilder();
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
