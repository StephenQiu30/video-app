//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/analysis_report_artifact_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_report_response.g.dart';

/// AnalysisReportResponse
///
/// Properties:
/// * [id]
/// * [status]
/// * [rendererVersion]
/// * [contentSha256]
/// * [publishedAt]
/// * [artifacts]
@BuiltValue()
abstract class AnalysisReportResponse
    implements Built<AnalysisReportResponse, AnalysisReportResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'renderer_version')
  String get rendererVersion;

  @BuiltValueField(wireName: r'content_sha256')
  String get contentSha256;

  @BuiltValueField(wireName: r'published_at')
  DateTime? get publishedAt;

  @BuiltValueField(wireName: r'artifacts')
  BuiltList<AnalysisReportArtifactResponse> get artifacts;

  AnalysisReportResponse._();

  factory AnalysisReportResponse(
          [void updates(AnalysisReportResponseBuilder b)]) =
      _$AnalysisReportResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnalysisReportResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnalysisReportResponse> get serializer =>
      _$AnalysisReportResponseSerializer();
}

class _$AnalysisReportResponseSerializer
    implements PrimitiveSerializer<AnalysisReportResponse> {
  @override
  final Iterable<Type> types = const [
    AnalysisReportResponse,
    _$AnalysisReportResponse
  ];

  @override
  final String wireName = r'AnalysisReportResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnalysisReportResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'renderer_version';
    yield serializers.serialize(
      object.rendererVersion,
      specifiedType: const FullType(String),
    );
    yield r'content_sha256';
    yield serializers.serialize(
      object.contentSha256,
      specifiedType: const FullType(String),
    );
    yield r'published_at';
    yield object.publishedAt == null
        ? null
        : serializers.serialize(
            object.publishedAt,
            specifiedType: const FullType.nullable(DateTime),
          );
    yield r'artifacts';
    yield serializers.serialize(
      object.artifacts,
      specifiedType:
          const FullType(BuiltList, [FullType(AnalysisReportArtifactResponse)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AnalysisReportResponse object, {
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
    required AnalysisReportResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'renderer_version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.rendererVersion = valueDes;
          break;
        case r'content_sha256':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.contentSha256 = valueDes;
          break;
        case r'published_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.publishedAt = valueDes;
          break;
        case r'artifacts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(AnalysisReportArtifactResponse)]),
          ) as BuiltList<AnalysisReportArtifactResponse>;
          result.artifacts.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnalysisReportResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnalysisReportResponseBuilder();
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
