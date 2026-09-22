//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/intent_history_item_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'intent_history_response.g.dart';

/// IntentHistoryResponse
///
/// Properties:
/// * [items]
/// * [nextCursor]
@BuiltValue()
abstract class IntentHistoryResponse
    implements Built<IntentHistoryResponse, IntentHistoryResponseBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<IntentHistoryItemResponse> get items;

  @BuiltValueField(wireName: r'next_cursor')
  String? get nextCursor;

  IntentHistoryResponse._();

  factory IntentHistoryResponse(
      [void updates(IntentHistoryResponseBuilder b)]) = _$IntentHistoryResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IntentHistoryResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IntentHistoryResponse> get serializer =>
      _$IntentHistoryResponseSerializer();
}

class _$IntentHistoryResponseSerializer
    implements PrimitiveSerializer<IntentHistoryResponse> {
  @override
  final Iterable<Type> types = const [
    IntentHistoryResponse,
    _$IntentHistoryResponse
  ];

  @override
  final String wireName = r'IntentHistoryResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IntentHistoryResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(IntentHistoryItemResponse)]),
    );
    yield r'next_cursor';
    yield object.nextCursor == null
        ? null
        : serializers.serialize(
            object.nextCursor,
            specifiedType: const FullType.nullable(String),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    IntentHistoryResponse object, {
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
    required IntentHistoryResponseBuilder result,
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
                BuiltList, [FullType(IntentHistoryItemResponse)]),
          ) as BuiltList<IntentHistoryItemResponse>;
          result.items.replace(valueDes);
          break;
        case r'next_cursor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nextCursor = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IntentHistoryResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IntentHistoryResponseBuilder();
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
