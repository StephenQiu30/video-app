//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_analytics_daily_response.g.dart';

/// DownloadAnalyticsDailyResponse
///
/// Properties:
/// * [date]
/// * [total]
/// * [succeeded]
/// * [failed]
/// * [cancelled]
@BuiltValue()
abstract class DownloadAnalyticsDailyResponse
    implements
        Built<DownloadAnalyticsDailyResponse,
            DownloadAnalyticsDailyResponseBuilder> {
  @BuiltValueField(wireName: r'date')
  Date get date;

  @BuiltValueField(wireName: r'total')
  int get total;

  @BuiltValueField(wireName: r'succeeded')
  int get succeeded;

  @BuiltValueField(wireName: r'failed')
  int get failed;

  @BuiltValueField(wireName: r'cancelled')
  int get cancelled;

  DownloadAnalyticsDailyResponse._();

  factory DownloadAnalyticsDailyResponse(
          [void updates(DownloadAnalyticsDailyResponseBuilder b)]) =
      _$DownloadAnalyticsDailyResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DownloadAnalyticsDailyResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DownloadAnalyticsDailyResponse> get serializer =>
      _$DownloadAnalyticsDailyResponseSerializer();
}

class _$DownloadAnalyticsDailyResponseSerializer
    implements PrimitiveSerializer<DownloadAnalyticsDailyResponse> {
  @override
  final Iterable<Type> types = const [
    DownloadAnalyticsDailyResponse,
    _$DownloadAnalyticsDailyResponse
  ];

  @override
  final String wireName = r'DownloadAnalyticsDailyResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DownloadAnalyticsDailyResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'date';
    yield serializers.serialize(
      object.date,
      specifiedType: const FullType(Date),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
    yield r'succeeded';
    yield serializers.serialize(
      object.succeeded,
      specifiedType: const FullType(int),
    );
    yield r'failed';
    yield serializers.serialize(
      object.failed,
      specifiedType: const FullType(int),
    );
    yield r'cancelled';
    yield serializers.serialize(
      object.cancelled,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DownloadAnalyticsDailyResponse object, {
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
    required DownloadAnalyticsDailyResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.date = valueDes;
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'succeeded':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.succeeded = valueDes;
          break;
        case r'failed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.failed = valueDes;
          break;
        case r'cancelled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cancelled = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DownloadAnalyticsDailyResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DownloadAnalyticsDailyResponseBuilder();
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
