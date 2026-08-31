//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'screenplay_scene_response.g.dart';

/// ScreenplaySceneResponse
///
/// Properties:
/// * [id]
/// * [sourceSceneId]
/// * [purpose]
/// * [conflict]
/// * [turn]
/// * [pacing]
/// * [findings]
@BuiltValue()
abstract class ScreenplaySceneResponse
    implements Built<ScreenplaySceneResponse, ScreenplaySceneResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'source_scene_id')
  String get sourceSceneId;

  @BuiltValueField(wireName: r'purpose')
  String get purpose;

  @BuiltValueField(wireName: r'conflict')
  String get conflict;

  @BuiltValueField(wireName: r'turn')
  String get turn;

  @BuiltValueField(wireName: r'pacing')
  String get pacing;

  @BuiltValueField(wireName: r'findings')
  BuiltList<String> get findings;

  ScreenplaySceneResponse._();

  factory ScreenplaySceneResponse(
          [void updates(ScreenplaySceneResponseBuilder b)]) =
      _$ScreenplaySceneResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScreenplaySceneResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScreenplaySceneResponse> get serializer =>
      _$ScreenplaySceneResponseSerializer();
}

class _$ScreenplaySceneResponseSerializer
    implements PrimitiveSerializer<ScreenplaySceneResponse> {
  @override
  final Iterable<Type> types = const [
    ScreenplaySceneResponse,
    _$ScreenplaySceneResponse
  ];

  @override
  final String wireName = r'ScreenplaySceneResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScreenplaySceneResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'source_scene_id';
    yield serializers.serialize(
      object.sourceSceneId,
      specifiedType: const FullType(String),
    );
    yield r'purpose';
    yield serializers.serialize(
      object.purpose,
      specifiedType: const FullType(String),
    );
    yield r'conflict';
    yield serializers.serialize(
      object.conflict,
      specifiedType: const FullType(String),
    );
    yield r'turn';
    yield serializers.serialize(
      object.turn,
      specifiedType: const FullType(String),
    );
    yield r'pacing';
    yield serializers.serialize(
      object.pacing,
      specifiedType: const FullType(String),
    );
    yield r'findings';
    yield serializers.serialize(
      object.findings,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ScreenplaySceneResponse object, {
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
    required ScreenplaySceneResponseBuilder result,
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
        case r'source_scene_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourceSceneId = valueDes;
          break;
        case r'purpose':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.purpose = valueDes;
          break;
        case r'conflict':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.conflict = valueDes;
          break;
        case r'turn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.turn = valueDes;
          break;
        case r'pacing':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.pacing = valueDes;
          break;
        case r'findings':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.findings.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ScreenplaySceneResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScreenplaySceneResponseBuilder();
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
