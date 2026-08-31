//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/video_article_section_response.dart';
import 'package:video_server_api/lib/model/analysis_media_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'video_article_result_response.g.dart';

/// VideoArticleResultResponse
///
/// Properties:
/// * [kind]
/// * [language]
/// * [title]
/// * [lead]
/// * [sections]
/// * [keyPoints]
/// * [closing]
/// * [limitations]
/// * [media]
@BuiltValue()
abstract class VideoArticleResultResponse
    implements
        Built<VideoArticleResultResponse, VideoArticleResultResponseBuilder> {
  @BuiltValueField(wireName: r'kind')
  VideoArticleResultResponseKindEnum get kind;
  // enum kindEnum {  video_article,  };

  @BuiltValueField(wireName: r'language')
  String get language;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'lead')
  String get lead;

  @BuiltValueField(wireName: r'sections')
  BuiltList<VideoArticleSectionResponse> get sections;

  @BuiltValueField(wireName: r'key_points')
  BuiltList<String> get keyPoints;

  @BuiltValueField(wireName: r'closing')
  String get closing;

  @BuiltValueField(wireName: r'limitations')
  BuiltList<String> get limitations;

  @BuiltValueField(wireName: r'media')
  AnalysisMediaResponse get media;

  VideoArticleResultResponse._();

  factory VideoArticleResultResponse(
          [void updates(VideoArticleResultResponseBuilder b)]) =
      _$VideoArticleResultResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VideoArticleResultResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VideoArticleResultResponse> get serializer =>
      _$VideoArticleResultResponseSerializer();
}

class _$VideoArticleResultResponseSerializer
    implements PrimitiveSerializer<VideoArticleResultResponse> {
  @override
  final Iterable<Type> types = const [
    VideoArticleResultResponse,
    _$VideoArticleResultResponse
  ];

  @override
  final String wireName = r'VideoArticleResultResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VideoArticleResultResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'kind';
    yield serializers.serialize(
      object.kind,
      specifiedType: const FullType(VideoArticleResultResponseKindEnum),
    );
    yield r'language';
    yield serializers.serialize(
      object.language,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'lead';
    yield serializers.serialize(
      object.lead,
      specifiedType: const FullType(String),
    );
    yield r'sections';
    yield serializers.serialize(
      object.sections,
      specifiedType:
          const FullType(BuiltList, [FullType(VideoArticleSectionResponse)]),
    );
    yield r'key_points';
    yield serializers.serialize(
      object.keyPoints,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'closing';
    yield serializers.serialize(
      object.closing,
      specifiedType: const FullType(String),
    );
    yield r'limitations';
    yield serializers.serialize(
      object.limitations,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'media';
    yield serializers.serialize(
      object.media,
      specifiedType: const FullType(AnalysisMediaResponse),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    VideoArticleResultResponse object, {
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
    required VideoArticleResultResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VideoArticleResultResponseKindEnum),
          ) as VideoArticleResultResponseKindEnum;
          result.kind = valueDes;
          break;
        case r'language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.language = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'lead':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lead = valueDes;
          break;
        case r'sections':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(VideoArticleSectionResponse)]),
          ) as BuiltList<VideoArticleSectionResponse>;
          result.sections.replace(valueDes);
          break;
        case r'key_points':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.keyPoints.replace(valueDes);
          break;
        case r'closing':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.closing = valueDes;
          break;
        case r'limitations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.limitations.replace(valueDes);
          break;
        case r'media':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AnalysisMediaResponse),
          ) as AnalysisMediaResponse;
          result.media.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VideoArticleResultResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VideoArticleResultResponseBuilder();
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

class VideoArticleResultResponseKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'video_article')
  static const VideoArticleResultResponseKindEnum videoArticle =
      _$videoArticleResultResponseKindEnum_videoArticle;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const VideoArticleResultResponseKindEnum unknownDefaultOpenApi =
      _$videoArticleResultResponseKindEnum_unknownDefaultOpenApi;

  static Serializer<VideoArticleResultResponseKindEnum> get serializer =>
      _$videoArticleResultResponseKindEnumSerializer;

  const VideoArticleResultResponseKindEnum._(String name) : super(name);

  static BuiltSet<VideoArticleResultResponseKindEnum> get values =>
      _$videoArticleResultResponseKindEnumValues;
  static VideoArticleResultResponseKindEnum valueOf(String name) =>
      _$videoArticleResultResponseKindEnumValueOf(name);
}
