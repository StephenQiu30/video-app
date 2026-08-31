//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'video_article_evidence_response.g.dart';

/// VideoArticleEvidenceResponse
///
/// Properties:
/// * [startMs]
/// * [endMs]
/// * [note]
@BuiltValue()
abstract class VideoArticleEvidenceResponse
    implements
        Built<VideoArticleEvidenceResponse,
            VideoArticleEvidenceResponseBuilder> {
  @BuiltValueField(wireName: r'start_ms')
  int get startMs;

  @BuiltValueField(wireName: r'end_ms')
  int get endMs;

  @BuiltValueField(wireName: r'note')
  String get note;

  VideoArticleEvidenceResponse._();

  factory VideoArticleEvidenceResponse(
          [void updates(VideoArticleEvidenceResponseBuilder b)]) =
      _$VideoArticleEvidenceResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VideoArticleEvidenceResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VideoArticleEvidenceResponse> get serializer =>
      _$VideoArticleEvidenceResponseSerializer();
}

class _$VideoArticleEvidenceResponseSerializer
    implements PrimitiveSerializer<VideoArticleEvidenceResponse> {
  @override
  final Iterable<Type> types = const [
    VideoArticleEvidenceResponse,
    _$VideoArticleEvidenceResponse
  ];

  @override
  final String wireName = r'VideoArticleEvidenceResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VideoArticleEvidenceResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'start_ms';
    yield serializers.serialize(
      object.startMs,
      specifiedType: const FullType(int),
    );
    yield r'end_ms';
    yield serializers.serialize(
      object.endMs,
      specifiedType: const FullType(int),
    );
    yield r'note';
    yield serializers.serialize(
      object.note,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    VideoArticleEvidenceResponse object, {
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
    required VideoArticleEvidenceResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'start_ms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.startMs = valueDes;
          break;
        case r'end_ms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.endMs = valueDes;
          break;
        case r'note':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.note = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VideoArticleEvidenceResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VideoArticleEvidenceResponseBuilder();
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
