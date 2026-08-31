//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/screenplay_analysis_result_response.dart';
import 'package:video_server_api/lib/model/screenplay_rewrite_result_response.dart';
import 'package:video_server_api/lib/model/video_article_result_response.dart';
import 'package:video_server_api/lib/model/video_analysis_result_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'analysis_response_result.g.dart';

/// AnalysisResponseResult
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
/// * [lead]
/// * [sections]
/// * [keyPoints]
/// * [closing]
/// * [limitations]
/// * [logline]
/// * [synopsis]
/// * [structure]
/// * [characters]
/// * [dialogueFindings]
/// * [strengths]
/// * [priorityRevisions]
/// * [sourceLanguage]
/// * [targetLanguage]
/// * [sourceSceneCount]
/// * [outputSceneCount]
/// * [glossary]
/// * [changeSummary]
@BuiltValue()
abstract class AnalysisResponseResult
    implements Built<AnalysisResponseResult, AnalysisResponseResultBuilder> {
  /// One Of [ScreenplayAnalysisResultResponse], [ScreenplayRewriteResultResponse], [VideoAnalysisResultResponse], [VideoArticleResultResponse]
  OneOf get oneOf;

  static const String discriminatorFieldName = r'kind';

  static const Map<String, Type> discriminatorMapping = {
    r'screenplay_analysis': ScreenplayAnalysisResultResponse,
    r'screenplay_rewrite': ScreenplayRewriteResultResponse,
    r'video_article': VideoArticleResultResponse,
    r'video_visual_analysis': VideoAnalysisResultResponse,
  };

  AnalysisResponseResult._();

  factory AnalysisResponseResult(
          [void updates(AnalysisResponseResultBuilder b)]) =
      _$AnalysisResponseResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnalysisResponseResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnalysisResponseResult> get serializer =>
      _$AnalysisResponseResultSerializer();
}

extension AnalysisResponseResultDiscriminatorExt on AnalysisResponseResult {
  String? get discriminatorValue {
    if (this is ScreenplayAnalysisResultResponse) {
      return r'screenplay_analysis';
    }
    if (this is ScreenplayRewriteResultResponse) {
      return r'screenplay_rewrite';
    }
    if (this is VideoArticleResultResponse) {
      return r'video_article';
    }
    if (this is VideoAnalysisResultResponse) {
      return r'video_visual_analysis';
    }
    return null;
  }
}

extension AnalysisResponseResultBuilderDiscriminatorExt
    on AnalysisResponseResultBuilder {
  String? get discriminatorValue {
    if (this is ScreenplayAnalysisResultResponseBuilder) {
      return r'screenplay_analysis';
    }
    if (this is ScreenplayRewriteResultResponseBuilder) {
      return r'screenplay_rewrite';
    }
    if (this is VideoArticleResultResponseBuilder) {
      return r'video_article';
    }
    if (this is VideoAnalysisResultResponseBuilder) {
      return r'video_visual_analysis';
    }
    return null;
  }
}

class _$AnalysisResponseResultSerializer
    implements PrimitiveSerializer<AnalysisResponseResult> {
  @override
  final Iterable<Type> types = const [
    AnalysisResponseResult,
    _$AnalysisResponseResult
  ];

  @override
  final String wireName = r'AnalysisResponseResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnalysisResponseResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    AnalysisResponseResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value,
        specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  AnalysisResponseResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnalysisResponseResultBuilder();
    Object? oneOfDataSrc;
    final serializedList = (serialized as Iterable<Object?>).toList();
    final discIndex =
        serializedList.indexOf(AnalysisResponseResult.discriminatorFieldName) +
            1;
    final discValue = serializers.deserialize(serializedList[discIndex],
        specifiedType: FullType(String)) as String;
    oneOfDataSrc = serialized;
    final oneOfTypes = [
      ScreenplayAnalysisResultResponse,
      ScreenplayRewriteResultResponse,
      VideoArticleResultResponse,
      VideoAnalysisResultResponse,
    ];
    Object oneOfResult;
    Type oneOfType;
    switch (discValue) {
      case r'screenplay_analysis':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(ScreenplayAnalysisResultResponse),
        ) as ScreenplayAnalysisResultResponse;
        oneOfType = ScreenplayAnalysisResultResponse;
        break;
      case r'screenplay_rewrite':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(ScreenplayRewriteResultResponse),
        ) as ScreenplayRewriteResultResponse;
        oneOfType = ScreenplayRewriteResultResponse;
        break;
      case r'video_article':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(VideoArticleResultResponse),
        ) as VideoArticleResultResponse;
        oneOfType = VideoArticleResultResponse;
        break;
      case r'video_visual_analysis':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(VideoAnalysisResultResponse),
        ) as VideoAnalysisResultResponse;
        oneOfType = VideoAnalysisResultResponse;
        break;
      default:
        throw UnsupportedError(
            "Couldn't deserialize oneOf for the discriminator value: ${discValue}");
    }
    result.oneOf = OneOfDynamic(
        typeIndex: oneOfTypes.indexOf(oneOfType),
        types: oneOfTypes,
        value: oneOfResult);
    return result.build();
  }
}

class AnalysisResponseResultKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'screenplay_rewrite')
  static const AnalysisResponseResultKindEnum screenplayRewrite =
      _$analysisResponseResultKindEnum_screenplayRewrite;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const AnalysisResponseResultKindEnum unknownDefaultOpenApi =
      _$analysisResponseResultKindEnum_unknownDefaultOpenApi;

  static Serializer<AnalysisResponseResultKindEnum> get serializer =>
      _$analysisResponseResultKindEnumSerializer;

  const AnalysisResponseResultKindEnum._(String name) : super(name);

  static BuiltSet<AnalysisResponseResultKindEnum> get values =>
      _$analysisResponseResultKindEnumValues;
  static AnalysisResponseResultKindEnum valueOf(String name) =>
      _$analysisResponseResultKindEnumValueOf(name);
}
