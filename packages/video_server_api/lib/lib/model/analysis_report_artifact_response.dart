//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_report_artifact_response.g.dart';

/// AnalysisReportArtifactResponse
///
/// Properties:
/// * [format]
/// * [mediaType]
/// * [sizeBytes]
/// * [sha256]
@BuiltValue()
abstract class AnalysisReportArtifactResponse
    implements
        Built<AnalysisReportArtifactResponse,
            AnalysisReportArtifactResponseBuilder> {
  @BuiltValueField(wireName: r'format')
  String get format;

  @BuiltValueField(wireName: r'media_type')
  String get mediaType;

  @BuiltValueField(wireName: r'size_bytes')
  int get sizeBytes;

  @BuiltValueField(wireName: r'sha256')
  String get sha256;

  AnalysisReportArtifactResponse._();

  factory AnalysisReportArtifactResponse(
          [void updates(AnalysisReportArtifactResponseBuilder b)]) =
      _$AnalysisReportArtifactResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnalysisReportArtifactResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnalysisReportArtifactResponse> get serializer =>
      _$AnalysisReportArtifactResponseSerializer();
}

class _$AnalysisReportArtifactResponseSerializer
    implements PrimitiveSerializer<AnalysisReportArtifactResponse> {
  @override
  final Iterable<Type> types = const [
    AnalysisReportArtifactResponse,
    _$AnalysisReportArtifactResponse
  ];

  @override
  final String wireName = r'AnalysisReportArtifactResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnalysisReportArtifactResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'format';
    yield serializers.serialize(
      object.format,
      specifiedType: const FullType(String),
    );
    yield r'media_type';
    yield serializers.serialize(
      object.mediaType,
      specifiedType: const FullType(String),
    );
    yield r'size_bytes';
    yield serializers.serialize(
      object.sizeBytes,
      specifiedType: const FullType(int),
    );
    yield r'sha256';
    yield serializers.serialize(
      object.sha256,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AnalysisReportArtifactResponse object, {
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
    required AnalysisReportArtifactResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'format':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.format = valueDes;
          break;
        case r'media_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mediaType = valueDes;
          break;
        case r'size_bytes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sizeBytes = valueDes;
          break;
        case r'sha256':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sha256 = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnalysisReportArtifactResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnalysisReportArtifactResponseBuilder();
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
