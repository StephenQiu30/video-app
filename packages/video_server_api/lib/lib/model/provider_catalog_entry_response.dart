//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:video_server_api/lib/model/provider_support_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'provider_catalog_entry_response.g.dart';

/// ProviderCatalogEntryResponse
///
/// Properties:
/// * [key]
/// * [displayName]
/// * [sortOrder]
/// * [isVisible]
/// * [systemRegistered]
/// * [systemStatus]
/// * [createdAt]
/// * [updatedAt]
@BuiltValue()
abstract class ProviderCatalogEntryResponse
    implements
        Built<ProviderCatalogEntryResponse,
            ProviderCatalogEntryResponseBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'display_name')
  String get displayName;

  @BuiltValueField(wireName: r'sort_order')
  int get sortOrder;

  @BuiltValueField(wireName: r'is_visible')
  bool get isVisible;

  @BuiltValueField(wireName: r'system_registered')
  bool get systemRegistered;

  @BuiltValueField(wireName: r'system_status')
  ProviderSupportStatus get systemStatus;
  // enum systemStatusEnum {  unknown,  verified,  degraded,  access_required,  rate_limited,  blocked,  disabled,  unsupported,  };

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  ProviderCatalogEntryResponse._();

  factory ProviderCatalogEntryResponse(
          [void updates(ProviderCatalogEntryResponseBuilder b)]) =
      _$ProviderCatalogEntryResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProviderCatalogEntryResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProviderCatalogEntryResponse> get serializer =>
      _$ProviderCatalogEntryResponseSerializer();
}

class _$ProviderCatalogEntryResponseSerializer
    implements PrimitiveSerializer<ProviderCatalogEntryResponse> {
  @override
  final Iterable<Type> types = const [
    ProviderCatalogEntryResponse,
    _$ProviderCatalogEntryResponse
  ];

  @override
  final String wireName = r'ProviderCatalogEntryResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProviderCatalogEntryResponse object, {
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
    yield r'is_visible';
    yield serializers.serialize(
      object.isVisible,
      specifiedType: const FullType(bool),
    );
    yield r'system_registered';
    yield serializers.serialize(
      object.systemRegistered,
      specifiedType: const FullType(bool),
    );
    yield r'system_status';
    yield serializers.serialize(
      object.systemStatus,
      specifiedType: const FullType(ProviderSupportStatus),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ProviderCatalogEntryResponse object, {
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
    required ProviderCatalogEntryResponseBuilder result,
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
        case r'system_registered':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.systemRegistered = valueDes;
          break;
        case r'system_status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ProviderSupportStatus),
          ) as ProviderSupportStatus;
          result.systemStatus = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProviderCatalogEntryResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProviderCatalogEntryResponseBuilder();
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
