//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'evidence_summary_response.g.dart';

/// EvidenceSummaryResponse
///
/// Properties:
/// * [text]
/// * [evidenceShotIds]
@BuiltValue()
abstract class EvidenceSummaryResponse
    implements Built<EvidenceSummaryResponse, EvidenceSummaryResponseBuilder> {
  @BuiltValueField(wireName: r'text')
  String get text;

  @BuiltValueField(wireName: r'evidence_shot_ids')
  BuiltList<String> get evidenceShotIds;

  EvidenceSummaryResponse._();

  factory EvidenceSummaryResponse(
          [void updates(EvidenceSummaryResponseBuilder b)]) =
      _$EvidenceSummaryResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EvidenceSummaryResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EvidenceSummaryResponse> get serializer =>
      _$EvidenceSummaryResponseSerializer();
}

class _$EvidenceSummaryResponseSerializer
    implements PrimitiveSerializer<EvidenceSummaryResponse> {
  @override
  final Iterable<Type> types = const [
    EvidenceSummaryResponse,
    _$EvidenceSummaryResponse
  ];

  @override
  final String wireName = r'EvidenceSummaryResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EvidenceSummaryResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'text';
    yield serializers.serialize(
      object.text,
      specifiedType: const FullType(String),
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
    EvidenceSummaryResponse object, {
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
    required EvidenceSummaryResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.text = valueDes;
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
  EvidenceSummaryResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EvidenceSummaryResponseBuilder();
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
