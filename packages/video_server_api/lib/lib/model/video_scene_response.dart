//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'video_scene_response.g.dart';

/// VideoSceneResponse
///
/// Properties:
/// * [id]
/// * [index]
/// * [title]
/// * [startMs]
/// * [endMs]
/// * [location]
/// * [description]
/// * [narrativeFunction]
/// * [visualRules]
/// * [continuityRisks]
/// * [evidenceShotIds]
@BuiltValue()
abstract class VideoSceneResponse
    implements Built<VideoSceneResponse, VideoSceneResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'index')
  int get index;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'start_ms')
  int get startMs;

  @BuiltValueField(wireName: r'end_ms')
  int get endMs;

  @BuiltValueField(wireName: r'location')
  String get location;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'narrative_function')
  String get narrativeFunction;

  @BuiltValueField(wireName: r'visual_rules')
  BuiltList<String> get visualRules;

  @BuiltValueField(wireName: r'continuity_risks')
  BuiltList<String> get continuityRisks;

  @BuiltValueField(wireName: r'evidence_shot_ids')
  BuiltList<String> get evidenceShotIds;

  VideoSceneResponse._();

  factory VideoSceneResponse([void updates(VideoSceneResponseBuilder b)]) =
      _$VideoSceneResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VideoSceneResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VideoSceneResponse> get serializer =>
      _$VideoSceneResponseSerializer();
}

class _$VideoSceneResponseSerializer
    implements PrimitiveSerializer<VideoSceneResponse> {
  @override
  final Iterable<Type> types = const [VideoSceneResponse, _$VideoSceneResponse];

  @override
  final String wireName = r'VideoSceneResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VideoSceneResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'index';
    yield serializers.serialize(
      object.index,
      specifiedType: const FullType(int),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
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
    yield r'location';
    yield serializers.serialize(
      object.location,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'narrative_function';
    yield serializers.serialize(
      object.narrativeFunction,
      specifiedType: const FullType(String),
    );
    yield r'visual_rules';
    yield serializers.serialize(
      object.visualRules,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'continuity_risks';
    yield serializers.serialize(
      object.continuityRisks,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'evidence_shot_ids';
    yield serializers.serialize(
      object.evidenceShotIds,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    VideoSceneResponse object, {
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
    required VideoSceneResponseBuilder result,
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
        case r'index':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.index = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
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
        case r'location':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.location = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'narrative_function':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.narrativeFunction = valueDes;
          break;
        case r'visual_rules':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.visualRules.replace(valueDes);
          break;
        case r'continuity_risks':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.continuityRisks.replace(valueDes);
          break;
        case r'evidence_shot_ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.evidenceShotIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VideoSceneResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VideoSceneResponseBuilder();
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
