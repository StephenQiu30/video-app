//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_analytics_source_response.g.dart';

/// DownloadAnalyticsSourceResponse
///
/// Properties:
/// * [sourceKey]
/// * [sourceName]
/// * [total]
/// * [succeeded]
/// * [failed]
/// * [cancelled]
/// * [active]
/// * [uniqueUsers]
/// * [downloadedBytes]
/// * [successRate]
@BuiltValue()
abstract class DownloadAnalyticsSourceResponse
    implements
        Built<DownloadAnalyticsSourceResponse,
            DownloadAnalyticsSourceResponseBuilder> {
  @BuiltValueField(wireName: r'source_key')
  String get sourceKey;

  @BuiltValueField(wireName: r'source_name')
  String get sourceName;

  @BuiltValueField(wireName: r'total')
  int get total;

  @BuiltValueField(wireName: r'succeeded')
  int get succeeded;

  @BuiltValueField(wireName: r'failed')
  int get failed;

  @BuiltValueField(wireName: r'cancelled')
  int get cancelled;

  @BuiltValueField(wireName: r'active')
  int get active;

  @BuiltValueField(wireName: r'unique_users')
  int get uniqueUsers;

  @BuiltValueField(wireName: r'downloaded_bytes')
  int get downloadedBytes;

  @BuiltValueField(wireName: r'success_rate')
  num get successRate;

  DownloadAnalyticsSourceResponse._();

  factory DownloadAnalyticsSourceResponse(
          [void updates(DownloadAnalyticsSourceResponseBuilder b)]) =
      _$DownloadAnalyticsSourceResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DownloadAnalyticsSourceResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DownloadAnalyticsSourceResponse> get serializer =>
      _$DownloadAnalyticsSourceResponseSerializer();
}

class _$DownloadAnalyticsSourceResponseSerializer
    implements PrimitiveSerializer<DownloadAnalyticsSourceResponse> {
  @override
  final Iterable<Type> types = const [
    DownloadAnalyticsSourceResponse,
    _$DownloadAnalyticsSourceResponse
  ];

  @override
  final String wireName = r'DownloadAnalyticsSourceResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DownloadAnalyticsSourceResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'source_key';
    yield serializers.serialize(
      object.sourceKey,
      specifiedType: const FullType(String),
    );
    yield r'source_name';
    yield serializers.serialize(
      object.sourceName,
      specifiedType: const FullType(String),
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
    yield r'active';
    yield serializers.serialize(
      object.active,
      specifiedType: const FullType(int),
    );
    yield r'unique_users';
    yield serializers.serialize(
      object.uniqueUsers,
      specifiedType: const FullType(int),
    );
    yield r'downloaded_bytes';
    yield serializers.serialize(
      object.downloadedBytes,
      specifiedType: const FullType(int),
    );
    yield r'success_rate';
    yield serializers.serialize(
      object.successRate,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DownloadAnalyticsSourceResponse object, {
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
    required DownloadAnalyticsSourceResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'source_key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourceKey = valueDes;
          break;
        case r'source_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourceName = valueDes;
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
        case r'active':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.active = valueDes;
          break;
        case r'unique_users':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.uniqueUsers = valueDes;
          break;
        case r'downloaded_bytes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.downloadedBytes = valueDes;
          break;
        case r'success_rate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.successRate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DownloadAnalyticsSourceResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DownloadAnalyticsSourceResponseBuilder();
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
