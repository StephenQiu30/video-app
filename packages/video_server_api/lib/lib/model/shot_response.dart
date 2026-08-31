//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shot_response.g.dart';

/// ShotResponse
///
/// Properties:
/// * [id]
/// * [index]
/// * [startMs]
/// * [endMs]
/// * [representativeFrameMs]
/// * [description]
/// * [transitionIn]
/// * [shotSize]
/// * [cameraMotion]
/// * [narrativeFunction]
/// * [highlightScore]
/// * [visualTags]
/// * [assetIds]
@BuiltValue()
abstract class ShotResponse
    implements Built<ShotResponse, ShotResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'index')
  int get index;

  @BuiltValueField(wireName: r'start_ms')
  int get startMs;

  @BuiltValueField(wireName: r'end_ms')
  int get endMs;

  @BuiltValueField(wireName: r'representative_frame_ms')
  int get representativeFrameMs;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'transition_in')
  String get transitionIn;

  @BuiltValueField(wireName: r'shot_size')
  String get shotSize;

  @BuiltValueField(wireName: r'camera_motion')
  String get cameraMotion;

  @BuiltValueField(wireName: r'narrative_function')
  String get narrativeFunction;

  @BuiltValueField(wireName: r'highlight_score')
  int get highlightScore;

  @BuiltValueField(wireName: r'visual_tags')
  BuiltList<String> get visualTags;

  @BuiltValueField(wireName: r'asset_ids')
  BuiltList<String> get assetIds;

  ShotResponse._();

  factory ShotResponse([void updates(ShotResponseBuilder b)]) = _$ShotResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShotResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShotResponse> get serializer => _$ShotResponseSerializer();
}

class _$ShotResponseSerializer implements PrimitiveSerializer<ShotResponse> {
  @override
  final Iterable<Type> types = const [ShotResponse, _$ShotResponse];

  @override
  final String wireName = r'ShotResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShotResponse object, {
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
    yield r'representative_frame_ms';
    yield serializers.serialize(
      object.representativeFrameMs,
      specifiedType: const FullType(int),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'transition_in';
    yield serializers.serialize(
      object.transitionIn,
      specifiedType: const FullType(String),
    );
    yield r'shot_size';
    yield serializers.serialize(
      object.shotSize,
      specifiedType: const FullType(String),
    );
    yield r'camera_motion';
    yield serializers.serialize(
      object.cameraMotion,
      specifiedType: const FullType(String),
    );
    yield r'narrative_function';
    yield serializers.serialize(
      object.narrativeFunction,
      specifiedType: const FullType(String),
    );
    yield r'highlight_score';
    yield serializers.serialize(
      object.highlightScore,
      specifiedType: const FullType(int),
    );
    yield r'visual_tags';
    yield serializers.serialize(
      object.visualTags,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'asset_ids';
    yield serializers.serialize(
      object.assetIds,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ShotResponse object, {
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
    required ShotResponseBuilder result,
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
        case r'representative_frame_ms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.representativeFrameMs = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'transition_in':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.transitionIn = valueDes;
          break;
        case r'shot_size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.shotSize = valueDes;
          break;
        case r'camera_motion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.cameraMotion = valueDes;
          break;
        case r'narrative_function':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.narrativeFunction = valueDes;
          break;
        case r'highlight_score':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.highlightScore = valueDes;
          break;
        case r'visual_tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.visualTags.replace(valueDes);
          break;
        case r'asset_ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.assetIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShotResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShotResponseBuilder();
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
