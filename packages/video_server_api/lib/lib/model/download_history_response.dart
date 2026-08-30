//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:video_server_api/lib/model/download_history_item_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/download_history_summary_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_history_response.g.dart';

/// DownloadHistoryResponse
///
/// Properties:
/// * [items]
/// * [page]
/// * [pageSize]
/// * [total]
/// * [summary]
@BuiltValue()
abstract class DownloadHistoryResponse
    implements Built<DownloadHistoryResponse, DownloadHistoryResponseBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<DownloadHistoryItemResponse> get items;

  @BuiltValueField(wireName: r'page')
  int get page;

  @BuiltValueField(wireName: r'page_size')
  int get pageSize;

  @BuiltValueField(wireName: r'total')
  int get total;

  @BuiltValueField(wireName: r'summary')
  DownloadHistorySummaryResponse get summary;

  DownloadHistoryResponse._();

  factory DownloadHistoryResponse(
          [void updates(DownloadHistoryResponseBuilder b)]) =
      _$DownloadHistoryResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DownloadHistoryResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DownloadHistoryResponse> get serializer =>
      _$DownloadHistoryResponseSerializer();
}

class _$DownloadHistoryResponseSerializer
    implements PrimitiveSerializer<DownloadHistoryResponse> {
  @override
  final Iterable<Type> types = const [
    DownloadHistoryResponse,
    _$DownloadHistoryResponse
  ];

  @override
  final String wireName = r'DownloadHistoryResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DownloadHistoryResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(DownloadHistoryItemResponse)]),
    );
    yield r'page';
    yield serializers.serialize(
      object.page,
      specifiedType: const FullType(int),
    );
    yield r'page_size';
    yield serializers.serialize(
      object.pageSize,
      specifiedType: const FullType(int),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(DownloadHistorySummaryResponse),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DownloadHistoryResponse object, {
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
    required DownloadHistoryResponseBuilder result,
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
                BuiltList, [FullType(DownloadHistoryItemResponse)]),
          ) as BuiltList<DownloadHistoryItemResponse>;
          result.items.replace(valueDes);
          break;
        case r'page':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.page = valueDes;
          break;
        case r'page_size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.pageSize = valueDes;
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DownloadHistorySummaryResponse),
          ) as DownloadHistorySummaryResponse;
          result.summary.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DownloadHistoryResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DownloadHistoryResponseBuilder();
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
