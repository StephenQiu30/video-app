//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/screenplay_glossary_term_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'screenplay_rewrite_result_response.g.dart';

/// ScreenplayRewriteResultResponse
///
/// Properties:
/// * [kind]
/// * [sourceLanguage]
/// * [targetLanguage]
/// * [sourceSceneCount]
/// * [outputSceneCount]
/// * [glossary]
/// * [changeSummary]
@BuiltValue()
abstract class ScreenplayRewriteResultResponse
    implements
        Built<ScreenplayRewriteResultResponse,
            ScreenplayRewriteResultResponseBuilder> {
  @BuiltValueField(wireName: r'kind')
  ScreenplayRewriteResultResponseKindEnum get kind;
  // enum kindEnum {  screenplay_rewrite,  };

  @BuiltValueField(wireName: r'source_language')
  String get sourceLanguage;

  @BuiltValueField(wireName: r'target_language')
  String get targetLanguage;

  @BuiltValueField(wireName: r'source_scene_count')
  int get sourceSceneCount;

  @BuiltValueField(wireName: r'output_scene_count')
  int get outputSceneCount;

  @BuiltValueField(wireName: r'glossary')
  BuiltList<ScreenplayGlossaryTermResponse> get glossary;

  @BuiltValueField(wireName: r'change_summary')
  BuiltList<String> get changeSummary;

  ScreenplayRewriteResultResponse._();

  factory ScreenplayRewriteResultResponse(
          [void updates(ScreenplayRewriteResultResponseBuilder b)]) =
      _$ScreenplayRewriteResultResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScreenplayRewriteResultResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScreenplayRewriteResultResponse> get serializer =>
      _$ScreenplayRewriteResultResponseSerializer();
}

class _$ScreenplayRewriteResultResponseSerializer
    implements PrimitiveSerializer<ScreenplayRewriteResultResponse> {
  @override
  final Iterable<Type> types = const [
    ScreenplayRewriteResultResponse,
    _$ScreenplayRewriteResultResponse
  ];

  @override
  final String wireName = r'ScreenplayRewriteResultResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScreenplayRewriteResultResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'kind';
    yield serializers.serialize(
      object.kind,
      specifiedType: const FullType(ScreenplayRewriteResultResponseKindEnum),
    );
    yield r'source_language';
    yield serializers.serialize(
      object.sourceLanguage,
      specifiedType: const FullType(String),
    );
    yield r'target_language';
    yield serializers.serialize(
      object.targetLanguage,
      specifiedType: const FullType(String),
    );
    yield r'source_scene_count';
    yield serializers.serialize(
      object.sourceSceneCount,
      specifiedType: const FullType(int),
    );
    yield r'output_scene_count';
    yield serializers.serialize(
      object.outputSceneCount,
      specifiedType: const FullType(int),
    );
    yield r'glossary';
    yield serializers.serialize(
      object.glossary,
      specifiedType:
          const FullType(BuiltList, [FullType(ScreenplayGlossaryTermResponse)]),
    );
    yield r'change_summary';
    yield serializers.serialize(
      object.changeSummary,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ScreenplayRewriteResultResponse object, {
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
    required ScreenplayRewriteResultResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(ScreenplayRewriteResultResponseKindEnum),
          ) as ScreenplayRewriteResultResponseKindEnum;
          result.kind = valueDes;
          break;
        case r'source_language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourceLanguage = valueDes;
          break;
        case r'target_language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.targetLanguage = valueDes;
          break;
        case r'source_scene_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sourceSceneCount = valueDes;
          break;
        case r'output_scene_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.outputSceneCount = valueDes;
          break;
        case r'glossary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(ScreenplayGlossaryTermResponse)]),
          ) as BuiltList<ScreenplayGlossaryTermResponse>;
          result.glossary.replace(valueDes);
          break;
        case r'change_summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.changeSummary.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ScreenplayRewriteResultResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScreenplayRewriteResultResponseBuilder();
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

class ScreenplayRewriteResultResponseKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'screenplay_rewrite')
  static const ScreenplayRewriteResultResponseKindEnum screenplayRewrite =
      _$screenplayRewriteResultResponseKindEnum_screenplayRewrite;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ScreenplayRewriteResultResponseKindEnum unknownDefaultOpenApi =
      _$screenplayRewriteResultResponseKindEnum_unknownDefaultOpenApi;

  static Serializer<ScreenplayRewriteResultResponseKindEnum> get serializer =>
      _$screenplayRewriteResultResponseKindEnumSerializer;

  const ScreenplayRewriteResultResponseKindEnum._(String name) : super(name);

  static BuiltSet<ScreenplayRewriteResultResponseKindEnum> get values =>
      _$screenplayRewriteResultResponseKindEnumValues;
  static ScreenplayRewriteResultResponseKindEnum valueOf(String name) =>
      _$screenplayRewriteResultResponseKindEnumValueOf(name);
}
