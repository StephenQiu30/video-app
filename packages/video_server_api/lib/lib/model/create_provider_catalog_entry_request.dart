//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_provider_catalog_entry_request.g.dart';

/// CreateProviderCatalogEntryRequest
///
/// Properties:
/// * [key]
/// * [displayName]
/// * [sortOrder]
/// * [isVisible]
@BuiltValue()
abstract class CreateProviderCatalogEntryRequest
    implements
        Built<CreateProviderCatalogEntryRequest,
            CreateProviderCatalogEntryRequestBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'display_name')
  String get displayName;

  @BuiltValueField(wireName: r'sort_order')
  int get sortOrder;

  @BuiltValueField(wireName: r'is_visible')
  bool? get isVisible;

  CreateProviderCatalogEntryRequest._();

  factory CreateProviderCatalogEntryRequest(
          [void updates(CreateProviderCatalogEntryRequestBuilder b)]) =
      _$CreateProviderCatalogEntryRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateProviderCatalogEntryRequestBuilder b) =>
      b..isVisible = true;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateProviderCatalogEntryRequest> get serializer =>
      _$CreateProviderCatalogEntryRequestSerializer();
}

class _$CreateProviderCatalogEntryRequestSerializer
    implements PrimitiveSerializer<CreateProviderCatalogEntryRequest> {
  @override
  final Iterable<Type> types = const [
    CreateProviderCatalogEntryRequest,
    _$CreateProviderCatalogEntryRequest
  ];

  @override
  final String wireName = r'CreateProviderCatalogEntryRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateProviderCatalogEntryRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'display_name';
    yield serializers.serialize(
      object.displayName,
      specifiedType: const FullType(String),
    );
    yield r'sort_order';
    yield serializers.serialize(
      object.sortOrder,
      specifiedType: const FullType(int),
    );
    if (object.isVisible != null) {
      yield r'is_visible';
      yield serializers.serialize(
        object.isVisible,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateProviderCatalogEntryRequest object, {
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
    required CreateProviderCatalogEntryRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        case r'display_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.displayName = valueDes;
          break;
        case r'sort_order':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sortOrder = valueDes;
          break;
        case r'is_visible':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
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
  CreateProviderCatalogEntryRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateProviderCatalogEntryRequestBuilder();
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
