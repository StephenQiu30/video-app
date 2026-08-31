//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'production_advice_response.g.dart';

/// ProductionAdviceResponse
///
/// Properties:
/// * [summary]
/// * [priorityShotIds]
/// * [recommendedExtensions]
@BuiltValue()
abstract class ProductionAdviceResponse
    implements
        Built<ProductionAdviceResponse, ProductionAdviceResponseBuilder> {
  @BuiltValueField(wireName: r'summary')
  String get summary;

  @BuiltValueField(wireName: r'priority_shot_ids')
  BuiltList<String> get priorityShotIds;

  @BuiltValueField(wireName: r'recommended_extensions')
  BuiltList<String> get recommendedExtensions;

  ProductionAdviceResponse._();

  factory ProductionAdviceResponse(
          [void updates(ProductionAdviceResponseBuilder b)]) =
      _$ProductionAdviceResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProductionAdviceResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProductionAdviceResponse> get serializer =>
      _$ProductionAdviceResponseSerializer();
}

class _$ProductionAdviceResponseSerializer
    implements PrimitiveSerializer<ProductionAdviceResponse> {
  @override
  final Iterable<Type> types = const [
    ProductionAdviceResponse,
    _$ProductionAdviceResponse
  ];

  @override
  final String wireName = r'ProductionAdviceResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProductionAdviceResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(String),
    );
    yield r'priority_shot_ids';
    yield serializers.serialize(
      object.priorityShotIds,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'recommended_extensions';
    yield serializers.serialize(
      object.recommendedExtensions,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ProductionAdviceResponse object, {
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
    required ProductionAdviceResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.summary = valueDes;
          break;
        case r'priority_shot_ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.priorityShotIds.replace(valueDes);
          break;
        case r'recommended_extensions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.recommendedExtensions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProductionAdviceResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProductionAdviceResponseBuilder();
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
