//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'screenplay_character_response.g.dart';

/// ScreenplayCharacterResponse
///
/// Properties:
/// * [id]
/// * [name]
/// * [goal]
/// * [conflict]
/// * [arc]
/// * [evidenceSceneIds]
@BuiltValue()
abstract class ScreenplayCharacterResponse
    implements
        Built<ScreenplayCharacterResponse, ScreenplayCharacterResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'goal')
  String get goal;

  @BuiltValueField(wireName: r'conflict')
  String get conflict;

  @BuiltValueField(wireName: r'arc')
  String get arc;

  @BuiltValueField(wireName: r'evidence_scene_ids')
  BuiltList<String> get evidenceSceneIds;

  ScreenplayCharacterResponse._();

  factory ScreenplayCharacterResponse(
          [void updates(ScreenplayCharacterResponseBuilder b)]) =
      _$ScreenplayCharacterResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScreenplayCharacterResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScreenplayCharacterResponse> get serializer =>
      _$ScreenplayCharacterResponseSerializer();
}

class _$ScreenplayCharacterResponseSerializer
    implements PrimitiveSerializer<ScreenplayCharacterResponse> {
  @override
  final Iterable<Type> types = const [
    ScreenplayCharacterResponse,
    _$ScreenplayCharacterResponse
  ];

  @override
  final String wireName = r'ScreenplayCharacterResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScreenplayCharacterResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'goal';
    yield serializers.serialize(
      object.goal,
      specifiedType: const FullType(String),
    );
    yield r'conflict';
    yield serializers.serialize(
      object.conflict,
      specifiedType: const FullType(String),
    );
    yield r'arc';
    yield serializers.serialize(
      object.arc,
      specifiedType: const FullType(String),
    );
    yield r'evidence_scene_ids';
    yield serializers.serialize(
      object.evidenceSceneIds,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ScreenplayCharacterResponse object, {
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
    required ScreenplayCharacterResponseBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'goal':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.goal = valueDes;
          break;
        case r'conflict':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.conflict = valueDes;
          break;
        case r'arc':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.arc = valueDes;
          break;
        case r'evidence_scene_ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.evidenceSceneIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ScreenplayCharacterResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScreenplayCharacterResponseBuilder();
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
