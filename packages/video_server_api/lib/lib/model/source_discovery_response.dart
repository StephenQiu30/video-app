//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/discovery_status.dart';
import 'package:video_server_api/lib/model/source_discovery_item_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'source_discovery_response.g.dart';

/// SourceDiscoveryResponse
///
/// Properties:
/// * [id]
/// * [providerKey]
/// * [title]
/// * [status]
/// * [expiresAt]
/// * [items]
@BuiltValue()
abstract class SourceDiscoveryResponse
    implements Built<SourceDiscoveryResponse, SourceDiscoveryResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'provider_key')
  String get providerKey;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'status')
  DiscoveryStatus get status;
  // enum statusEnum {  ready,  empty,  };

  @BuiltValueField(wireName: r'expires_at')
  DateTime get expiresAt;

  @BuiltValueField(wireName: r'items')
  BuiltList<SourceDiscoveryItemResponse> get items;

  SourceDiscoveryResponse._();

  factory SourceDiscoveryResponse(
          [void updates(SourceDiscoveryResponseBuilder b)]) =
      _$SourceDiscoveryResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SourceDiscoveryResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SourceDiscoveryResponse> get serializer =>
      _$SourceDiscoveryResponseSerializer();
}

class _$SourceDiscoveryResponseSerializer
    implements PrimitiveSerializer<SourceDiscoveryResponse> {
  @override
  final Iterable<Type> types = const [
    SourceDiscoveryResponse,
    _$SourceDiscoveryResponse
  ];

  @override
  final String wireName = r'SourceDiscoveryResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SourceDiscoveryResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'provider_key';
    yield serializers.serialize(
      object.providerKey,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(DiscoveryStatus),
    );
    yield r'expires_at';
    yield serializers.serialize(
      object.expiresAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(SourceDiscoveryItemResponse)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SourceDiscoveryResponse object, {
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
    required SourceDiscoveryResponseBuilder result,
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
        case r'provider_key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.providerKey = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DiscoveryStatus),
          ) as DiscoveryStatus;
          result.status = valueDes;
          break;
        case r'expires_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.expiresAt = valueDes;
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(SourceDiscoveryItemResponse)]),
          ) as BuiltList<SourceDiscoveryItemResponse>;
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
  SourceDiscoveryResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SourceDiscoveryResponseBuilder();
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
