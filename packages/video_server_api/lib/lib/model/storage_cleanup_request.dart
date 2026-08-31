//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'storage_cleanup_request.g.dart';

/// StorageCleanupRequest
///
/// Properties:
/// * [olderThanDays]
@BuiltValue()
abstract class StorageCleanupRequest
    implements Built<StorageCleanupRequest, StorageCleanupRequestBuilder> {
  @BuiltValueField(wireName: r'older_than_days')
  int? get olderThanDays;

  StorageCleanupRequest._();

  factory StorageCleanupRequest(
      [void updates(StorageCleanupRequestBuilder b)]) = _$StorageCleanupRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StorageCleanupRequestBuilder b) =>
      b..olderThanDays = 30;

  @BuiltValueSerializer(custom: true)
  static Serializer<StorageCleanupRequest> get serializer =>
      _$StorageCleanupRequestSerializer();
}

class _$StorageCleanupRequestSerializer
    implements PrimitiveSerializer<StorageCleanupRequest> {
  @override
  final Iterable<Type> types = const [
    StorageCleanupRequest,
    _$StorageCleanupRequest
  ];

  @override
  final String wireName = r'StorageCleanupRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StorageCleanupRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.olderThanDays != null) {
      yield r'older_than_days';
      yield serializers.serialize(
        object.olderThanDays,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    StorageCleanupRequest object, {
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
    required StorageCleanupRequestBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StorageCleanupRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StorageCleanupRequestBuilder();
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
