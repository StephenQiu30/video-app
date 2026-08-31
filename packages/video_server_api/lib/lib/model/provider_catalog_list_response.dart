//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/provider_catalog_entry_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'provider_catalog_list_response.g.dart';

/// ProviderCatalogListResponse
///
/// Properties:
/// * [items]
@BuiltValue()
abstract class ProviderCatalogListResponse
    implements
        Built<ProviderCatalogListResponse, ProviderCatalogListResponseBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<ProviderCatalogEntryResponse> get items;

  ProviderCatalogListResponse._();

  factory ProviderCatalogListResponse(
          [void updates(ProviderCatalogListResponseBuilder b)]) =
      _$ProviderCatalogListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProviderCatalogListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProviderCatalogListResponse> get serializer =>
      _$ProviderCatalogListResponseSerializer();
}

class _$ProviderCatalogListResponseSerializer
    implements PrimitiveSerializer<ProviderCatalogListResponse> {
  @override
  final Iterable<Type> types = const [
    ProviderCatalogListResponse,
    _$ProviderCatalogListResponse
  ];

  @override
  final String wireName = r'ProviderCatalogListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProviderCatalogListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(ProviderCatalogEntryResponse)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ProviderCatalogListResponse object, {
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
    required ProviderCatalogListResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(ProviderCatalogEntryResponse)]),
          ) as BuiltList<ProviderCatalogEntryResponse>;
          result.items.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProviderCatalogListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProviderCatalogListResponseBuilder();
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
