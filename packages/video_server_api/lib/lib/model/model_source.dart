//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/public_url_inspection_source.dart';
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/discovered_item_inspection_source.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'model_source.g.dart';

/// ModelSource
///
/// Properties:
/// * [kind]
/// * [url] - 用户有权处理的公开、非 DRM HTTP(S) 媒体地址。
/// * [discoveryId]
/// * [itemRef]
@BuiltValue()
abstract class ModelSource implements Built<ModelSource, ModelSourceBuilder> {
  /// One Of [DiscoveredItemInspectionSource], [PublicUrlInspectionSource]
  OneOf get oneOf;

  static const String discriminatorFieldName = r'kind';

  static const Map<String, Type> discriminatorMapping = {
    r'discovered_item': DiscoveredItemInspectionSource,
    r'public_url': PublicUrlInspectionSource,
  };

  ModelSource._();

  factory ModelSource([void updates(ModelSourceBuilder b)]) = _$ModelSource;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ModelSourceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ModelSource> get serializer => _$ModelSourceSerializer();
}

extension ModelSourceDiscriminatorExt on ModelSource {
  String? get discriminatorValue {
    if (this is DiscoveredItemInspectionSource) {
      return r'discovered_item';
    }
    if (this is PublicUrlInspectionSource) {
      return r'public_url';
    }
    return null;
  }
}

extension ModelSourceBuilderDiscriminatorExt on ModelSourceBuilder {
  String? get discriminatorValue {
    if (this is DiscoveredItemInspectionSourceBuilder) {
      return r'discovered_item';
    }
    if (this is PublicUrlInspectionSourceBuilder) {
      return r'public_url';
    }
    return null;
  }
}

class _$ModelSourceSerializer implements PrimitiveSerializer<ModelSource> {
  @override
  final Iterable<Type> types = const [ModelSource, _$ModelSource];

  @override
  final String wireName = r'ModelSource';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ModelSource object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    ModelSource object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value,
        specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  ModelSource deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelSourceBuilder();
    Object? oneOfDataSrc;
    final serializedList = (serialized as Iterable<Object?>).toList();
    final discIndex =
        serializedList.indexOf(ModelSource.discriminatorFieldName) + 1;
    final discValue = serializers.deserialize(serializedList[discIndex],
        specifiedType: FullType(String)) as String;
    oneOfDataSrc = serialized;
    final oneOfTypes = [
      DiscoveredItemInspectionSource,
      PublicUrlInspectionSource,
    ];
    Object oneOfResult;
    Type oneOfType;
    switch (discValue) {
      case r'discovered_item':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(DiscoveredItemInspectionSource),
        ) as DiscoveredItemInspectionSource;
        oneOfType = DiscoveredItemInspectionSource;
        break;
      case r'public_url':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(PublicUrlInspectionSource),
        ) as PublicUrlInspectionSource;
        oneOfType = PublicUrlInspectionSource;
        break;
      default:
        throw UnsupportedError(
            "Couldn't deserialize oneOf for the discriminator value: ${discValue}");
    }
    result.oneOf = OneOfDynamic(
        typeIndex: oneOfTypes.indexOf(oneOfType),
        types: oneOfTypes,
        value: oneOfResult);
    return result.build();
  }
}

class ModelSourceKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'discovered_item')
  static const ModelSourceKindEnum discoveredItem =
      _$modelSourceKindEnum_discoveredItem;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ModelSourceKindEnum unknownDefaultOpenApi =
      _$modelSourceKindEnum_unknownDefaultOpenApi;

  static Serializer<ModelSourceKindEnum> get serializer =>
      _$modelSourceKindEnumSerializer;

  const ModelSourceKindEnum._(String name) : super(name);

  static BuiltSet<ModelSourceKindEnum> get values =>
      _$modelSourceKindEnumValues;
  static ModelSourceKindEnum valueOf(String name) =>
      _$modelSourceKindEnumValueOf(name);
}
