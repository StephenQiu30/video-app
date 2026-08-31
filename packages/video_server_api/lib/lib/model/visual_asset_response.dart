//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'visual_asset_response.g.dart';

/// VisualAssetResponse
///
/// Properties:
/// * [id]
/// * [type]
/// * [label]
/// * [description]
/// * [firstSeenMs]
/// * [evidenceShotIds]
@BuiltValue()
abstract class VisualAssetResponse
    implements Built<VisualAssetResponse, VisualAssetResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'type')
  String get type;

  @BuiltValueField(wireName: r'label')
  String get label;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'first_seen_ms')
  int get firstSeenMs;

  @BuiltValueField(wireName: r'evidence_shot_ids')
  BuiltList<String> get evidenceShotIds;

  VisualAssetResponse._();

  factory VisualAssetResponse([void updates(VisualAssetResponseBuilder b)]) =
      _$VisualAssetResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VisualAssetResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VisualAssetResponse> get serializer =>
      _$VisualAssetResponseSerializer();
}

class _$VisualAssetResponseSerializer
    implements PrimitiveSerializer<VisualAssetResponse> {
  @override
  final Iterable<Type> types = const [
    VisualAssetResponse,
    _$VisualAssetResponse
  ];

  @override
  final String wireName = r'VisualAssetResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VisualAssetResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(String),
    );
    yield r'label';
    yield serializers.serialize(
      object.label,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'first_seen_ms';
    yield serializers.serialize(
      object.firstSeenMs,
      specifiedType: const FullType(int),
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
    VisualAssetResponse object, {
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
    required VisualAssetResponseBuilder result,
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
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'label':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.label = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'first_seen_ms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.firstSeenMs = valueDes;
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
  VisualAssetResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VisualAssetResponseBuilder();
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
