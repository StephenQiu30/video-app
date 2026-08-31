//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_media_response.g.dart';

/// AnalysisMediaResponse
///
/// Properties:
/// * [durationMs]
/// * [container]
/// * [sizeBytes]
@BuiltValue()
abstract class AnalysisMediaResponse
    implements Built<AnalysisMediaResponse, AnalysisMediaResponseBuilder> {
  @BuiltValueField(wireName: r'duration_ms')
  int get durationMs;

  @BuiltValueField(wireName: r'container')
  String get container;

  @BuiltValueField(wireName: r'size_bytes')
  int get sizeBytes;

  AnalysisMediaResponse._();

  factory AnalysisMediaResponse(
      [void updates(AnalysisMediaResponseBuilder b)]) = _$AnalysisMediaResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnalysisMediaResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnalysisMediaResponse> get serializer =>
      _$AnalysisMediaResponseSerializer();
}

class _$AnalysisMediaResponseSerializer
    implements PrimitiveSerializer<AnalysisMediaResponse> {
  @override
  final Iterable<Type> types = const [
    AnalysisMediaResponse,
    _$AnalysisMediaResponse
  ];

  @override
  final String wireName = r'AnalysisMediaResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnalysisMediaResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'duration_ms';
    yield serializers.serialize(
      object.durationMs,
      specifiedType: const FullType(int),
    );
    yield r'container';
    yield serializers.serialize(
      object.container,
      specifiedType: const FullType(String),
    );
    yield r'size_bytes';
    yield serializers.serialize(
      object.sizeBytes,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AnalysisMediaResponse object, {
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
    required AnalysisMediaResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'duration_ms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.durationMs = valueDes;
          break;
        case r'container':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.container = valueDes;
          break;
        case r'size_bytes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sizeBytes = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnalysisMediaResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnalysisMediaResponseBuilder();
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
