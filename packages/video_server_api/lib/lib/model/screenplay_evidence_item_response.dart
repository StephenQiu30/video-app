//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'screenplay_evidence_item_response.g.dart';

/// ScreenplayEvidenceItemResponse
///
/// Properties:
/// * [id]
/// * [title]
/// * [description]
/// * [evidenceSceneIds]
@BuiltValue()
abstract class ScreenplayEvidenceItemResponse
    implements
        Built<ScreenplayEvidenceItemResponse,
            ScreenplayEvidenceItemResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'evidence_scene_ids')
  BuiltList<String> get evidenceSceneIds;

  ScreenplayEvidenceItemResponse._();

  factory ScreenplayEvidenceItemResponse(
          [void updates(ScreenplayEvidenceItemResponseBuilder b)]) =
      _$ScreenplayEvidenceItemResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScreenplayEvidenceItemResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScreenplayEvidenceItemResponse> get serializer =>
      _$ScreenplayEvidenceItemResponseSerializer();
}

class _$ScreenplayEvidenceItemResponseSerializer
    implements PrimitiveSerializer<ScreenplayEvidenceItemResponse> {
  @override
  final Iterable<Type> types = const [
    ScreenplayEvidenceItemResponse,
    _$ScreenplayEvidenceItemResponse
  ];

  @override
  final String wireName = r'ScreenplayEvidenceItemResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScreenplayEvidenceItemResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
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
    ScreenplayEvidenceItemResponse object, {
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
    required ScreenplayEvidenceItemResponseBuilder result,
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
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
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
  ScreenplayEvidenceItemResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScreenplayEvidenceItemResponseBuilder();
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
