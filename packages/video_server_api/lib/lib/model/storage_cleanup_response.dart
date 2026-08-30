//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'storage_cleanup_response.g.dart';

/// StorageCleanupResponse
///
/// Properties:
/// * [olderThanDays]
/// * [removedResources]
/// * [removedObjects]
/// * [freedBytes]
/// * [failedResources]
@BuiltValue()
abstract class StorageCleanupResponse
    implements Built<StorageCleanupResponse, StorageCleanupResponseBuilder> {
  @BuiltValueField(wireName: r'older_than_days')
  int get olderThanDays;

  @BuiltValueField(wireName: r'removed_resources')
  int get removedResources;

  @BuiltValueField(wireName: r'removed_objects')
  int get removedObjects;

  @BuiltValueField(wireName: r'freed_bytes')
  int get freedBytes;

  @BuiltValueField(wireName: r'failed_resources')
  int get failedResources;

  StorageCleanupResponse._();

  factory StorageCleanupResponse(
          [void updates(StorageCleanupResponseBuilder b)]) =
      _$StorageCleanupResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StorageCleanupResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StorageCleanupResponse> get serializer =>
      _$StorageCleanupResponseSerializer();
}

class _$StorageCleanupResponseSerializer
    implements PrimitiveSerializer<StorageCleanupResponse> {
  @override
  final Iterable<Type> types = const [
    StorageCleanupResponse,
    _$StorageCleanupResponse
  ];

  @override
  final String wireName = r'StorageCleanupResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StorageCleanupResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'older_than_days';
    yield serializers.serialize(
      object.olderThanDays,
      specifiedType: const FullType(int),
    );
    yield r'removed_resources';
    yield serializers.serialize(
      object.removedResources,
      specifiedType: const FullType(int),
    );
    yield r'removed_objects';
    yield serializers.serialize(
      object.removedObjects,
      specifiedType: const FullType(int),
    );
    yield r'freed_bytes';
    yield serializers.serialize(
      object.freedBytes,
      specifiedType: const FullType(int),
    );
    yield r'failed_resources';
    yield serializers.serialize(
      object.failedResources,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    StorageCleanupResponse object, {
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
    required StorageCleanupResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'older_than_days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.olderThanDays = valueDes;
          break;
        case r'removed_resources':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.removedResources = valueDes;
          break;
        case r'removed_objects':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.removedObjects = valueDes;
          break;
        case r'freed_bytes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.freedBytes = valueDes;
          break;
        case r'failed_resources':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.failedResources = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StorageCleanupResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StorageCleanupResponseBuilder();
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
