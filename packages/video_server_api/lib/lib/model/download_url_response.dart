//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_url_response.g.dart';

/// Short-lived URL for retrieving a completed download artifact.
///
/// Properties:
/// * [url]
/// * [expiresAt]
@BuiltValue()
abstract class DownloadUrlResponse
    implements Built<DownloadUrlResponse, DownloadUrlResponseBuilder> {
  @BuiltValueField(wireName: r'url')
  String get url;

  @BuiltValueField(wireName: r'expires_at')
  DateTime get expiresAt;

  DownloadUrlResponse._();

  factory DownloadUrlResponse([void updates(DownloadUrlResponseBuilder b)]) =
      _$DownloadUrlResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DownloadUrlResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DownloadUrlResponse> get serializer =>
      _$DownloadUrlResponseSerializer();
}

class _$DownloadUrlResponseSerializer
    implements PrimitiveSerializer<DownloadUrlResponse> {
  @override
  final Iterable<Type> types = const [
    DownloadUrlResponse,
    _$DownloadUrlResponse
  ];

  @override
  final String wireName = r'DownloadUrlResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DownloadUrlResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'url';
    yield serializers.serialize(
      object.url,
      specifiedType: const FullType(String),
    );
    yield r'expires_at';
    yield serializers.serialize(
      object.expiresAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DownloadUrlResponse object, {
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
    required DownloadUrlResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.url = valueDes;
          break;
        case r'expires_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.expiresAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DownloadUrlResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DownloadUrlResponseBuilder();
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
