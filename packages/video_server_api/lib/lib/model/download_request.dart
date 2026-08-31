//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_request.g.dart';

/// References an inspection and one format returned by that inspection.
///
/// Properties:
/// * [inspectionId] - 仍在有效期内的媒体解析资源 ID。
/// * [formatId] - 解析结果中选择的语义下载格式 ID。
@BuiltValue()
abstract class DownloadRequest
    implements Built<DownloadRequest, DownloadRequestBuilder> {
  /// 仍在有效期内的媒体解析资源 ID。
  @BuiltValueField(wireName: r'inspection_id')
  String get inspectionId;

  /// 解析结果中选择的语义下载格式 ID。
  @BuiltValueField(wireName: r'format_id')
  String get formatId;

  DownloadRequest._();

  factory DownloadRequest([void updates(DownloadRequestBuilder b)]) =
      _$DownloadRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DownloadRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DownloadRequest> get serializer =>
      _$DownloadRequestSerializer();
}

class _$DownloadRequestSerializer
    implements PrimitiveSerializer<DownloadRequest> {
  @override
  final Iterable<Type> types = const [DownloadRequest, _$DownloadRequest];

  @override
  final String wireName = r'DownloadRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DownloadRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'inspection_id';
    yield serializers.serialize(
      object.inspectionId,
      specifiedType: const FullType(String),
    );
    yield r'format_id';
    yield serializers.serialize(
      object.formatId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DownloadRequest object, {
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
    required DownloadRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'inspection_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.inspectionId = valueDes;
          break;
        case r'format_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.formatId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DownloadRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DownloadRequestBuilder();
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
