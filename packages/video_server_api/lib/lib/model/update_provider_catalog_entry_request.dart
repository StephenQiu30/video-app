//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_provider_catalog_entry_request.g.dart';

/// UpdateProviderCatalogEntryRequest
///
/// Properties:
/// * [displayName]
/// * [sortOrder]
/// * [isVisible]
@BuiltValue()
abstract class UpdateProviderCatalogEntryRequest
    implements
        Built<UpdateProviderCatalogEntryRequest,
            UpdateProviderCatalogEntryRequestBuilder> {
  @BuiltValueField(wireName: r'display_name')
  String? get displayName;

  @BuiltValueField(wireName: r'sort_order')
  int? get sortOrder;

  @BuiltValueField(wireName: r'is_visible')
  bool? get isVisible;

  UpdateProviderCatalogEntryRequest._();

  factory UpdateProviderCatalogEntryRequest(
          [void updates(UpdateProviderCatalogEntryRequestBuilder b)]) =
      _$UpdateProviderCatalogEntryRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateProviderCatalogEntryRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateProviderCatalogEntryRequest> get serializer =>
      _$UpdateProviderCatalogEntryRequestSerializer();
}

class _$UpdateProviderCatalogEntryRequestSerializer
    implements PrimitiveSerializer<UpdateProviderCatalogEntryRequest> {
  @override
  final Iterable<Type> types = const [
    UpdateProviderCatalogEntryRequest,
    _$UpdateProviderCatalogEntryRequest
  ];

  @override
  final String wireName = r'UpdateProviderCatalogEntryRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateProviderCatalogEntryRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.displayName != null) {
      yield r'display_name';
      yield serializers.serialize(
        object.displayName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sortOrder != null) {
      yield r'sort_order';
      yield serializers.serialize(
        object.sortOrder,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.isVisible != null) {
      yield r'is_visible';
      yield serializers.serialize(
        object.isVisible,
        specifiedType: const FullType.nullable(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateProviderCatalogEntryRequest object, {
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
    required UpdateProviderCatalogEntryRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'display_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.displayName = valueDes;
          break;
        case r'sort_order':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.sortOrder = valueDes;
          break;
        case r'is_visible':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isVisible = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateProviderCatalogEntryRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateProviderCatalogEntryRequestBuilder();
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
