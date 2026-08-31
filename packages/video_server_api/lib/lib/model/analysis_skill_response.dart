//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/analysis_input_kind.dart';
import 'package:video_server_api/lib/model/analysis_result_contract.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_skill_response.g.dart';

/// AnalysisSkillResponse
///
/// Properties:
/// * [id]
/// * [displayName]
/// * [description]
/// * [defaultPrompt]
/// * [inputKinds]
/// * [resultContract]
@BuiltValue()
abstract class AnalysisSkillResponse
    implements Built<AnalysisSkillResponse, AnalysisSkillResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'display_name')
  String get displayName;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'default_prompt')
  String get defaultPrompt;

  @BuiltValueField(wireName: r'input_kinds')
  BuiltList<AnalysisInputKind> get inputKinds;

  @BuiltValueField(wireName: r'result_contract')
  AnalysisResultContract get resultContract;
  // enum resultContractEnum {  video-visual-analysis,  video-article,  screenplay-analysis,  screenplay-rewrite,  };

  AnalysisSkillResponse._();

  factory AnalysisSkillResponse(
      [void updates(AnalysisSkillResponseBuilder b)]) = _$AnalysisSkillResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnalysisSkillResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnalysisSkillResponse> get serializer =>
      _$AnalysisSkillResponseSerializer();
}

class _$AnalysisSkillResponseSerializer
    implements PrimitiveSerializer<AnalysisSkillResponse> {
  @override
  final Iterable<Type> types = const [
    AnalysisSkillResponse,
    _$AnalysisSkillResponse
  ];

  @override
  final String wireName = r'AnalysisSkillResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnalysisSkillResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'display_name';
    yield serializers.serialize(
      object.displayName,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'default_prompt';
    yield serializers.serialize(
      object.defaultPrompt,
      specifiedType: const FullType(String),
    );
    yield r'input_kinds';
    yield serializers.serialize(
      object.inputKinds,
      specifiedType: const FullType(BuiltList, [FullType(AnalysisInputKind)]),
    );
    yield r'result_contract';
    yield serializers.serialize(
      object.resultContract,
      specifiedType: const FullType(AnalysisResultContract),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AnalysisSkillResponse object, {
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
    required AnalysisSkillResponseBuilder result,
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
        case r'display_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.displayName = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'default_prompt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.defaultPrompt = valueDes;
          break;
        case r'input_kinds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(AnalysisInputKind)]),
          ) as BuiltList<AnalysisInputKind>;
          result.inputKinds.replace(valueDes);
          break;
        case r'result_contract':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AnalysisResultContract),
          ) as AnalysisResultContract;
          result.resultContract = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnalysisSkillResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnalysisSkillResponseBuilder();
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
