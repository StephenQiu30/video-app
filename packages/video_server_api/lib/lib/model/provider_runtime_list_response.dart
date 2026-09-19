//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/provider_runtime_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'provider_runtime_list_response.g.dart';

/// ProviderRuntimeListResponse
///
/// Properties:
/// * [items]
/// * [snapshotMaxAgeSeconds]
@BuiltValue()
abstract class ProviderRuntimeListResponse
    implements
        Built<ProviderRuntimeListResponse, ProviderRuntimeListResponseBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<ProviderRuntimeResponse> get items;

  @BuiltValueField(wireName: r'snapshot_max_age_seconds')
  int? get snapshotMaxAgeSeconds;

  ProviderRuntimeListResponse._();

  factory ProviderRuntimeListResponse(
          [void updates(ProviderRuntimeListResponseBuilder b)]) =
      _$ProviderRuntimeListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProviderRuntimeListResponseBuilder b) =>
      b..snapshotMaxAgeSeconds = 30;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProviderRuntimeListResponse> get serializer =>
      _$ProviderRuntimeListResponseSerializer();
}

class _$ProviderRuntimeListResponseSerializer
    implements PrimitiveSerializer<ProviderRuntimeListResponse> {
  @override
  final Iterable<Type> types = const [
    ProviderRuntimeListResponse,
    _$ProviderRuntimeListResponse
  ];

  @override
  final String wireName = r'ProviderRuntimeListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProviderRuntimeListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(ProviderRuntimeResponse)]),
    );
    if (object.snapshotMaxAgeSeconds != null) {
      yield r'snapshot_max_age_seconds';
      yield serializers.serialize(
        object.snapshotMaxAgeSeconds,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ProviderRuntimeListResponse object, {
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
    required ProviderRuntimeListResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(ProviderRuntimeResponse)]),
          ) as BuiltList<ProviderRuntimeResponse>;
          result.items.replace(valueDes);
          break;
        case r'snapshot_max_age_seconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.snapshotMaxAgeSeconds = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProviderRuntimeListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProviderRuntimeListResponseBuilder();
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
