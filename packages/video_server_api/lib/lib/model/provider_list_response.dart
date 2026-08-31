//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/provider_status_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'provider_list_response.g.dart';

/// ProviderListResponse
///
/// Properties:
/// * [items]
@BuiltValue()
abstract class ProviderListResponse
    implements Built<ProviderListResponse, ProviderListResponseBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<ProviderStatusResponse> get items;

  ProviderListResponse._();

  factory ProviderListResponse([void updates(ProviderListResponseBuilder b)]) =
      _$ProviderListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProviderListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProviderListResponse> get serializer =>
      _$ProviderListResponseSerializer();
}

class _$ProviderListResponseSerializer
    implements PrimitiveSerializer<ProviderListResponse> {
  @override
  final Iterable<Type> types = const [
    ProviderListResponse,
    _$ProviderListResponse
  ];

  @override
  final String wireName = r'ProviderListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProviderListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(ProviderStatusResponse)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ProviderListResponse object, {
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
    required ProviderListResponseBuilder result,
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
                const FullType(BuiltList, [FullType(ProviderStatusResponse)]),
          ) as BuiltList<ProviderStatusResponse>;
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
  ProviderListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProviderListResponseBuilder();
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
