//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/download_analytics_source_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/download_analytics_summary_response.dart';
import 'package:video_server_api/lib/model/download_analytics_daily_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_analytics_response.g.dart';

/// DownloadAnalyticsResponse
///
/// Properties:
/// * [periodDays]
/// * [start]
/// * [end]
/// * [summary]
/// * [daily]
/// * [sources]
@BuiltValue()
abstract class DownloadAnalyticsResponse
    implements
        Built<DownloadAnalyticsResponse, DownloadAnalyticsResponseBuilder> {
  @BuiltValueField(wireName: r'period_days')
  int get periodDays;

  @BuiltValueField(wireName: r'start')
  DateTime get start;

  @BuiltValueField(wireName: r'end')
  DateTime get end;

  @BuiltValueField(wireName: r'summary')
  DownloadAnalyticsSummaryResponse get summary;

  @BuiltValueField(wireName: r'daily')
  BuiltList<DownloadAnalyticsDailyResponse> get daily;

  @BuiltValueField(wireName: r'sources')
  BuiltList<DownloadAnalyticsSourceResponse> get sources;

  DownloadAnalyticsResponse._();

  factory DownloadAnalyticsResponse(
          [void updates(DownloadAnalyticsResponseBuilder b)]) =
      _$DownloadAnalyticsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DownloadAnalyticsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DownloadAnalyticsResponse> get serializer =>
      _$DownloadAnalyticsResponseSerializer();
}

class _$DownloadAnalyticsResponseSerializer
    implements PrimitiveSerializer<DownloadAnalyticsResponse> {
  @override
  final Iterable<Type> types = const [
    DownloadAnalyticsResponse,
    _$DownloadAnalyticsResponse
  ];

  @override
  final String wireName = r'DownloadAnalyticsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DownloadAnalyticsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'period_days';
    yield serializers.serialize(
      object.periodDays,
      specifiedType: const FullType(int),
    );
    yield r'start';
    yield serializers.serialize(
      object.start,
      specifiedType: const FullType(DateTime),
    );
    yield r'end';
    yield serializers.serialize(
      object.end,
      specifiedType: const FullType(DateTime),
    );
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(DownloadAnalyticsSummaryResponse),
    );
    yield r'daily';
    yield serializers.serialize(
      object.daily,
      specifiedType:
          const FullType(BuiltList, [FullType(DownloadAnalyticsDailyResponse)]),
    );
    yield r'sources';
    yield serializers.serialize(
      object.sources,
      specifiedType: const FullType(
          BuiltList, [FullType(DownloadAnalyticsSourceResponse)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DownloadAnalyticsResponse object, {
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
    required DownloadAnalyticsResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'period_days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.periodDays = valueDes;
          break;
        case r'start':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.start = valueDes;
          break;
        case r'end':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.end = valueDes;
          break;
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DownloadAnalyticsSummaryResponse),
          ) as DownloadAnalyticsSummaryResponse;
          result.summary.replace(valueDes);
          break;
        case r'daily':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(DownloadAnalyticsDailyResponse)]),
          ) as BuiltList<DownloadAnalyticsDailyResponse>;
          result.daily.replace(valueDes);
          break;
        case r'sources':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(DownloadAnalyticsSourceResponse)]),
          ) as BuiltList<DownloadAnalyticsSourceResponse>;
          result.sources.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DownloadAnalyticsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DownloadAnalyticsResponseBuilder();
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
