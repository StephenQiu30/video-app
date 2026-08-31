//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/screenplay_evidence_item_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/screenplay_character_response.dart';
import 'package:video_server_api/lib/model/screenplay_scene_response.dart';
import 'package:video_server_api/lib/model/screenplay_structure_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'screenplay_analysis_result_response.g.dart';

/// ScreenplayAnalysisResultResponse
///
/// Properties:
/// * [kind]
/// * [language]
/// * [title]
/// * [logline]
/// * [synopsis]
/// * [structure]
/// * [characters]
/// * [scenes]
/// * [dialogueFindings]
/// * [strengths]
/// * [priorityRevisions]
@BuiltValue()
abstract class ScreenplayAnalysisResultResponse
    implements
        Built<ScreenplayAnalysisResultResponse,
            ScreenplayAnalysisResultResponseBuilder> {
  @BuiltValueField(wireName: r'kind')
  ScreenplayAnalysisResultResponseKindEnum get kind;
  // enum kindEnum {  screenplay_analysis,  };

  @BuiltValueField(wireName: r'language')
  String get language;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'logline')
  String get logline;

  @BuiltValueField(wireName: r'synopsis')
  String get synopsis;

  @BuiltValueField(wireName: r'structure')
  ScreenplayStructureResponse get structure;

  @BuiltValueField(wireName: r'characters')
  BuiltList<ScreenplayCharacterResponse> get characters;

  @BuiltValueField(wireName: r'scenes')
  BuiltList<ScreenplaySceneResponse> get scenes;

  @BuiltValueField(wireName: r'dialogue_findings')
  BuiltList<ScreenplayEvidenceItemResponse> get dialogueFindings;

  @BuiltValueField(wireName: r'strengths')
  BuiltList<ScreenplayEvidenceItemResponse> get strengths;

  @BuiltValueField(wireName: r'priority_revisions')
  BuiltList<ScreenplayEvidenceItemResponse> get priorityRevisions;

  ScreenplayAnalysisResultResponse._();

  factory ScreenplayAnalysisResultResponse(
          [void updates(ScreenplayAnalysisResultResponseBuilder b)]) =
      _$ScreenplayAnalysisResultResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScreenplayAnalysisResultResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScreenplayAnalysisResultResponse> get serializer =>
      _$ScreenplayAnalysisResultResponseSerializer();
}

class _$ScreenplayAnalysisResultResponseSerializer
    implements PrimitiveSerializer<ScreenplayAnalysisResultResponse> {
  @override
  final Iterable<Type> types = const [
    ScreenplayAnalysisResultResponse,
    _$ScreenplayAnalysisResultResponse
  ];

  @override
  final String wireName = r'ScreenplayAnalysisResultResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScreenplayAnalysisResultResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'kind';
    yield serializers.serialize(
      object.kind,
      specifiedType: const FullType(ScreenplayAnalysisResultResponseKindEnum),
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
    yield r'logline';
    yield serializers.serialize(
      object.logline,
      specifiedType: const FullType(String),
    );
    yield r'synopsis';
    yield serializers.serialize(
      object.synopsis,
      specifiedType: const FullType(String),
    );
    yield r'structure';
    yield serializers.serialize(
      object.structure,
      specifiedType: const FullType(ScreenplayStructureResponse),
    );
    yield r'characters';
    yield serializers.serialize(
      object.characters,
      specifiedType:
          const FullType(BuiltList, [FullType(ScreenplayCharacterResponse)]),
    );
    yield r'scenes';
    yield serializers.serialize(
      object.scenes,
      specifiedType:
          const FullType(BuiltList, [FullType(ScreenplaySceneResponse)]),
    );
    yield r'dialogue_findings';
    yield serializers.serialize(
      object.dialogueFindings,
      specifiedType:
          const FullType(BuiltList, [FullType(ScreenplayEvidenceItemResponse)]),
    );
    yield r'strengths';
    yield serializers.serialize(
      object.strengths,
      specifiedType:
          const FullType(BuiltList, [FullType(ScreenplayEvidenceItemResponse)]),
    );
    yield r'priority_revisions';
    yield serializers.serialize(
      object.priorityRevisions,
      specifiedType:
          const FullType(BuiltList, [FullType(ScreenplayEvidenceItemResponse)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ScreenplayAnalysisResultResponse object, {
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
    required ScreenplayAnalysisResultResponseBuilder result,
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
                const FullType(ScreenplayAnalysisResultResponseKindEnum),
          ) as ScreenplayAnalysisResultResponseKindEnum;
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
        case r'logline':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.logline = valueDes;
          break;
        case r'synopsis':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.synopsis = valueDes;
          break;
        case r'structure':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ScreenplayStructureResponse),
          ) as ScreenplayStructureResponse;
          result.structure.replace(valueDes);
          break;
        case r'characters':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(ScreenplayCharacterResponse)]),
          ) as BuiltList<ScreenplayCharacterResponse>;
          result.characters.replace(valueDes);
          break;
        case r'scenes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(ScreenplaySceneResponse)]),
          ) as BuiltList<ScreenplaySceneResponse>;
          result.scenes.replace(valueDes);
          break;
        case r'dialogue_findings':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(ScreenplayEvidenceItemResponse)]),
          ) as BuiltList<ScreenplayEvidenceItemResponse>;
          result.dialogueFindings.replace(valueDes);
          break;
        case r'strengths':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(ScreenplayEvidenceItemResponse)]),
          ) as BuiltList<ScreenplayEvidenceItemResponse>;
          result.strengths.replace(valueDes);
          break;
        case r'priority_revisions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(ScreenplayEvidenceItemResponse)]),
          ) as BuiltList<ScreenplayEvidenceItemResponse>;
          result.priorityRevisions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ScreenplayAnalysisResultResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScreenplayAnalysisResultResponseBuilder();
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

class ScreenplayAnalysisResultResponseKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'screenplay_analysis')
  static const ScreenplayAnalysisResultResponseKindEnum screenplayAnalysis =
      _$screenplayAnalysisResultResponseKindEnum_screenplayAnalysis;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ScreenplayAnalysisResultResponseKindEnum unknownDefaultOpenApi =
      _$screenplayAnalysisResultResponseKindEnum_unknownDefaultOpenApi;

  static Serializer<ScreenplayAnalysisResultResponseKindEnum> get serializer =>
      _$screenplayAnalysisResultResponseKindEnumSerializer;

  const ScreenplayAnalysisResultResponseKindEnum._(String name) : super(name);

  static BuiltSet<ScreenplayAnalysisResultResponseKindEnum> get values =>
      _$screenplayAnalysisResultResponseKindEnumValues;
  static ScreenplayAnalysisResultResponseKindEnum valueOf(String name) =>
      _$screenplayAnalysisResultResponseKindEnumValueOf(name);
}
