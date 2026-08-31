//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/video_scene_response.dart';
import 'package:video_server_api/lib/model/visual_asset_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/highlight_response.dart';
import 'package:video_server_api/lib/model/production_advice_response.dart';
import 'package:video_server_api/lib/model/evidence_summary_response.dart';
import 'package:video_server_api/lib/model/shot_response.dart';
import 'package:video_server_api/lib/model/analysis_media_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'video_analysis_result_response.g.dart';

/// VideoAnalysisResultResponse
///
/// Properties:
/// * [kind]
/// * [language]
/// * [title]
/// * [summary]
/// * [media]
/// * [shotCount]
/// * [shots]
/// * [scenes]
/// * [highlights]
/// * [assets]
/// * [productionAdvice]
@BuiltValue()
abstract class VideoAnalysisResultResponse
    implements
        Built<VideoAnalysisResultResponse, VideoAnalysisResultResponseBuilder> {
  @BuiltValueField(wireName: r'kind')
  VideoAnalysisResultResponseKindEnum get kind;
  // enum kindEnum {  video_visual_analysis,  };

  @BuiltValueField(wireName: r'language')
  String get language;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'summary')
  EvidenceSummaryResponse get summary;

  @BuiltValueField(wireName: r'media')
  AnalysisMediaResponse get media;

  @BuiltValueField(wireName: r'shot_count')
  int get shotCount;

  @BuiltValueField(wireName: r'shots')
  BuiltList<ShotResponse> get shots;

  @BuiltValueField(wireName: r'scenes')
  BuiltList<VideoSceneResponse> get scenes;

  @BuiltValueField(wireName: r'highlights')
  BuiltList<HighlightResponse> get highlights;

  @BuiltValueField(wireName: r'assets')
  BuiltList<VisualAssetResponse> get assets;

  @BuiltValueField(wireName: r'production_advice')
  ProductionAdviceResponse get productionAdvice;

  VideoAnalysisResultResponse._();

  factory VideoAnalysisResultResponse(
          [void updates(VideoAnalysisResultResponseBuilder b)]) =
      _$VideoAnalysisResultResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VideoAnalysisResultResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VideoAnalysisResultResponse> get serializer =>
      _$VideoAnalysisResultResponseSerializer();
}

class _$VideoAnalysisResultResponseSerializer
    implements PrimitiveSerializer<VideoAnalysisResultResponse> {
  @override
  final Iterable<Type> types = const [
    VideoAnalysisResultResponse,
    _$VideoAnalysisResultResponse
  ];

  @override
  final String wireName = r'VideoAnalysisResultResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VideoAnalysisResultResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'kind';
    yield serializers.serialize(
      object.kind,
      specifiedType: const FullType(VideoAnalysisResultResponseKindEnum),
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
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(EvidenceSummaryResponse),
    );
    yield r'media';
    yield serializers.serialize(
      object.media,
      specifiedType: const FullType(AnalysisMediaResponse),
    );
    yield r'shot_count';
    yield serializers.serialize(
      object.shotCount,
      specifiedType: const FullType(int),
    );
    yield r'shots';
    yield serializers.serialize(
      object.shots,
      specifiedType: const FullType(BuiltList, [FullType(ShotResponse)]),
    );
    yield r'scenes';
    yield serializers.serialize(
      object.scenes,
      specifiedType: const FullType(BuiltList, [FullType(VideoSceneResponse)]),
    );
    yield r'highlights';
    yield serializers.serialize(
      object.highlights,
      specifiedType: const FullType(BuiltList, [FullType(HighlightResponse)]),
    );
    yield r'assets';
    yield serializers.serialize(
      object.assets,
      specifiedType: const FullType(BuiltList, [FullType(VisualAssetResponse)]),
    );
    yield r'production_advice';
    yield serializers.serialize(
      object.productionAdvice,
      specifiedType: const FullType(ProductionAdviceResponse),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    VideoAnalysisResultResponse object, {
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
    required VideoAnalysisResultResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VideoAnalysisResultResponseKindEnum),
          ) as VideoAnalysisResultResponseKindEnum;
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
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EvidenceSummaryResponse),
          ) as EvidenceSummaryResponse;
          result.summary.replace(valueDes);
          break;
        case r'media':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AnalysisMediaResponse),
          ) as AnalysisMediaResponse;
          result.media.replace(valueDes);
          break;
        case r'shot_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.shotCount = valueDes;
          break;
        case r'shots':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ShotResponse)]),
          ) as BuiltList<ShotResponse>;
          result.shots.replace(valueDes);
          break;
        case r'scenes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(VideoSceneResponse)]),
          ) as BuiltList<VideoSceneResponse>;
          result.scenes.replace(valueDes);
          break;
        case r'highlights':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(HighlightResponse)]),
          ) as BuiltList<HighlightResponse>;
          result.highlights.replace(valueDes);
          break;
        case r'assets':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(VisualAssetResponse)]),
          ) as BuiltList<VisualAssetResponse>;
          result.assets.replace(valueDes);
          break;
        case r'production_advice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ProductionAdviceResponse),
          ) as ProductionAdviceResponse;
          result.productionAdvice.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VideoAnalysisResultResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VideoAnalysisResultResponseBuilder();
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

class VideoAnalysisResultResponseKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'video_visual_analysis')
  static const VideoAnalysisResultResponseKindEnum videoVisualAnalysis =
      _$videoAnalysisResultResponseKindEnum_videoVisualAnalysis;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const VideoAnalysisResultResponseKindEnum unknownDefaultOpenApi =
      _$videoAnalysisResultResponseKindEnum_unknownDefaultOpenApi;

  static Serializer<VideoAnalysisResultResponseKindEnum> get serializer =>
      _$videoAnalysisResultResponseKindEnumSerializer;

  const VideoAnalysisResultResponseKindEnum._(String name) : super(name);

  static BuiltSet<VideoAnalysisResultResponseKindEnum> get values =>
      _$videoAnalysisResultResponseKindEnumValues;
  static VideoAnalysisResultResponseKindEnum valueOf(String name) =>
      _$videoAnalysisResultResponseKindEnumValueOf(name);
}
