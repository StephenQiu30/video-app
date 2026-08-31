//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/screenplay_evidence_item_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'screenplay_structure_response.g.dart';

/// ScreenplayStructureResponse
///
/// Properties:
/// * [acts]
/// * [turningPoints]
/// * [pacingSummary]
@BuiltValue()
abstract class ScreenplayStructureResponse
    implements
        Built<ScreenplayStructureResponse, ScreenplayStructureResponseBuilder> {
  @BuiltValueField(wireName: r'acts')
  BuiltList<ScreenplayEvidenceItemResponse> get acts;

  @BuiltValueField(wireName: r'turning_points')
  BuiltList<ScreenplayEvidenceItemResponse> get turningPoints;

  @BuiltValueField(wireName: r'pacing_summary')
  String get pacingSummary;

  ScreenplayStructureResponse._();

  factory ScreenplayStructureResponse(
          [void updates(ScreenplayStructureResponseBuilder b)]) =
      _$ScreenplayStructureResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScreenplayStructureResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScreenplayStructureResponse> get serializer =>
      _$ScreenplayStructureResponseSerializer();
}

class _$ScreenplayStructureResponseSerializer
    implements PrimitiveSerializer<ScreenplayStructureResponse> {
  @override
  final Iterable<Type> types = const [
    ScreenplayStructureResponse,
    _$ScreenplayStructureResponse
  ];

  @override
  final String wireName = r'ScreenplayStructureResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScreenplayStructureResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'acts';
    yield serializers.serialize(
      object.acts,
      specifiedType:
          const FullType(BuiltList, [FullType(ScreenplayEvidenceItemResponse)]),
    );
    yield r'turning_points';
    yield serializers.serialize(
      object.turningPoints,
      specifiedType:
          const FullType(BuiltList, [FullType(ScreenplayEvidenceItemResponse)]),
    );
    yield r'pacing_summary';
    yield serializers.serialize(
      object.pacingSummary,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ScreenplayStructureResponse object, {
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
    required ScreenplayStructureResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'acts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(ScreenplayEvidenceItemResponse)]),
          ) as BuiltList<ScreenplayEvidenceItemResponse>;
          result.acts.replace(valueDes);
          break;
        case r'turning_points':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(ScreenplayEvidenceItemResponse)]),
          ) as BuiltList<ScreenplayEvidenceItemResponse>;
          result.turningPoints.replace(valueDes);
          break;
        case r'pacing_summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.pacingSummary = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ScreenplayStructureResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScreenplayStructureResponseBuilder();
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
