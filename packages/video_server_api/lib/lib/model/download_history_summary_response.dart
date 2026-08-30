//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_history_summary_response.g.dart';

/// DownloadHistorySummaryResponse
///
/// Properties:
/// * [total]
/// * [succeeded]
/// * [active]
/// * [failed]
@BuiltValue()
abstract class DownloadHistorySummaryResponse
    implements
        Built<DownloadHistorySummaryResponse,
            DownloadHistorySummaryResponseBuilder> {
  @BuiltValueField(wireName: r'total')
  int get total;

  @BuiltValueField(wireName: r'succeeded')
  int get succeeded;

  @BuiltValueField(wireName: r'active')
  int get active;

  @BuiltValueField(wireName: r'failed')
  int get failed;

  DownloadHistorySummaryResponse._();

  factory DownloadHistorySummaryResponse(
          [void updates(DownloadHistorySummaryResponseBuilder b)]) =
      _$DownloadHistorySummaryResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DownloadHistorySummaryResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DownloadHistorySummaryResponse> get serializer =>
      _$DownloadHistorySummaryResponseSerializer();
}

class _$DownloadHistorySummaryResponseSerializer
    implements PrimitiveSerializer<DownloadHistorySummaryResponse> {
  @override
  final Iterable<Type> types = const [
    DownloadHistorySummaryResponse,
    _$DownloadHistorySummaryResponse
  ];

  @override
  final String wireName = r'DownloadHistorySummaryResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DownloadHistorySummaryResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    yield r'active';
    yield serializers.serialize(
      object.active,
      specifiedType: const FullType(int),
    );
    yield r'failed';
    yield serializers.serialize(
      object.failed,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DownloadHistorySummaryResponse object, {
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
    required DownloadHistorySummaryResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'active':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.active = valueDes;
          break;
        case r'failed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.failed = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DownloadHistorySummaryResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DownloadHistorySummaryResponseBuilder();
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
