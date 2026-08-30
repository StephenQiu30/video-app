//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'discovered_item_inspection_source.g.dart';

/// DiscoveredItemInspectionSource
///
/// Properties:
/// * [kind]
/// * [discoveryId]
/// * [itemRef]
@BuiltValue()
abstract class DiscoveredItemInspectionSource
    implements
        Built<DiscoveredItemInspectionSource,
            DiscoveredItemInspectionSourceBuilder> {
  @BuiltValueField(wireName: r'kind')
  DiscoveredItemInspectionSourceKindEnum get kind;
  // enum kindEnum {  discovered_item,  };

  @BuiltValueField(wireName: r'discovery_id')
  String get discoveryId;

  @BuiltValueField(wireName: r'item_ref')
  String get itemRef;

  DiscoveredItemInspectionSource._();

  factory DiscoveredItemInspectionSource(
          [void updates(DiscoveredItemInspectionSourceBuilder b)]) =
      _$DiscoveredItemInspectionSource;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DiscoveredItemInspectionSourceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DiscoveredItemInspectionSource> get serializer =>
      _$DiscoveredItemInspectionSourceSerializer();
}

class _$DiscoveredItemInspectionSourceSerializer
    implements PrimitiveSerializer<DiscoveredItemInspectionSource> {
  @override
  final Iterable<Type> types = const [
    DiscoveredItemInspectionSource,
    _$DiscoveredItemInspectionSource
  ];

  @override
  final String wireName = r'DiscoveredItemInspectionSource';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DiscoveredItemInspectionSource object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'kind';
    yield serializers.serialize(
      object.kind,
      specifiedType: const FullType(DiscoveredItemInspectionSourceKindEnum),
    );
    yield r'discovery_id';
    yield serializers.serialize(
      object.discoveryId,
      specifiedType: const FullType(String),
    );
    yield r'item_ref';
    yield serializers.serialize(
      object.itemRef,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DiscoveredItemInspectionSource object, {
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
    required DiscoveredItemInspectionSourceBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(DiscoveredItemInspectionSourceKindEnum),
          ) as DiscoveredItemInspectionSourceKindEnum;
          result.kind = valueDes;
          break;
        case r'discovery_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.discoveryId = valueDes;
          break;
        case r'item_ref':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.itemRef = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DiscoveredItemInspectionSource deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DiscoveredItemInspectionSourceBuilder();
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

class DiscoveredItemInspectionSourceKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'discovered_item')
  static const DiscoveredItemInspectionSourceKindEnum discoveredItem =
      _$discoveredItemInspectionSourceKindEnum_discoveredItem;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DiscoveredItemInspectionSourceKindEnum unknownDefaultOpenApi =
      _$discoveredItemInspectionSourceKindEnum_unknownDefaultOpenApi;

  static Serializer<DiscoveredItemInspectionSourceKindEnum> get serializer =>
      _$discoveredItemInspectionSourceKindEnumSerializer;

  const DiscoveredItemInspectionSourceKindEnum._(String name) : super(name);

  static BuiltSet<DiscoveredItemInspectionSourceKindEnum> get values =>
      _$discoveredItemInspectionSourceKindEnumValues;
  static DiscoveredItemInspectionSourceKindEnum valueOf(String name) =>
      _$discoveredItemInspectionSourceKindEnumValueOf(name);
}
