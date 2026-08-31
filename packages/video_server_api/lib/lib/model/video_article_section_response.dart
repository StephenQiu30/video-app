//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/video_article_evidence_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'video_article_section_response.g.dart';

/// VideoArticleSectionResponse
///
/// Properties:
/// * [id]
/// * [title]
/// * [body]
/// * [evidence]
@BuiltValue()
abstract class VideoArticleSectionResponse
    implements
        Built<VideoArticleSectionResponse, VideoArticleSectionResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'body')
  String get body;

  @BuiltValueField(wireName: r'evidence')
  BuiltList<VideoArticleEvidenceResponse> get evidence;

  VideoArticleSectionResponse._();

  factory VideoArticleSectionResponse(
          [void updates(VideoArticleSectionResponseBuilder b)]) =
      _$VideoArticleSectionResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VideoArticleSectionResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VideoArticleSectionResponse> get serializer =>
      _$VideoArticleSectionResponseSerializer();
}

class _$VideoArticleSectionResponseSerializer
    implements PrimitiveSerializer<VideoArticleSectionResponse> {
  @override
  final Iterable<Type> types = const [
    VideoArticleSectionResponse,
    _$VideoArticleSectionResponse
  ];

  @override
  final String wireName = r'VideoArticleSectionResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VideoArticleSectionResponse object, {
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
    yield r'body';
    yield serializers.serialize(
      object.body,
      specifiedType: const FullType(String),
    );
    yield r'evidence';
    yield serializers.serialize(
      object.evidence,
      specifiedType:
          const FullType(BuiltList, [FullType(VideoArticleEvidenceResponse)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    VideoArticleSectionResponse object, {
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
    required VideoArticleSectionResponseBuilder result,
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
        case r'body':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.body = valueDes;
          break;
        case r'evidence':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(VideoArticleEvidenceResponse)]),
          ) as BuiltList<VideoArticleEvidenceResponse>;
          result.evidence.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VideoArticleSectionResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VideoArticleSectionResponseBuilder();
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
