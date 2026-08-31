//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/analysis_report_response.dart';
import 'package:video_server_api/lib/model/analysis_error_code.dart';
import 'package:video_server_api/lib/model/analysis_input_kind.dart';
import 'package:video_server_api/lib/model/analysis_stage.dart';
import 'package:video_server_api/lib/model/analysis_result_contract.dart';
import 'package:video_server_api/lib/model/analysis_response_result.dart';
import 'package:video_server_api/lib/model/analysis_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_response.g.dart';

/// AnalysisResponse
///
/// Properties:
/// * [id]
/// * [runId]
/// * [runNo]
/// * [runTrigger]
/// * [version]
/// * [skillId]
/// * [outputLanguage]
/// * [inputKind]
/// * [resultContract]
/// * [status]
/// * [stage]
/// * [progress]
/// * [attempt]
/// * [errorCode]
/// * [createdAt]
/// * [updatedAt]
/// * [finishedAt]
/// * [result]
/// * [reportMarkdown]
/// * [currentReportId]
/// * [report]
@BuiltValue()
abstract class AnalysisResponse
    implements Built<AnalysisResponse, AnalysisResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'run_id')
  String get runId;

  @BuiltValueField(wireName: r'run_no')
  int get runNo;

  @BuiltValueField(wireName: r'run_trigger')
  String get runTrigger;

  @BuiltValueField(wireName: r'version')
  int get version;

  @BuiltValueField(wireName: r'skill_id')
  String get skillId;

  @BuiltValueField(wireName: r'output_language')
  String get outputLanguage;

  @BuiltValueField(wireName: r'input_kind')
  AnalysisInputKind get inputKind;
  // enum inputKindEnum {  video,  screenplay,  };

  @BuiltValueField(wireName: r'result_contract')
  AnalysisResultContract get resultContract;
  // enum resultContractEnum {  video-visual-analysis,  video-article,  screenplay-analysis,  screenplay-rewrite,  };

  @BuiltValueField(wireName: r'status')
  AnalysisStatus get status;
  // enum statusEnum {  queued,  running,  retry_wait,  succeeded,  failed,  cancelled,  };

  @BuiltValueField(wireName: r'stage')
  AnalysisStage? get stage;
  // enum stageEnum {  preparing,  analyzing,  validating,  publishing,  };

  @BuiltValueField(wireName: r'progress')
  int get progress;

  @BuiltValueField(wireName: r'attempt')
  int get attempt;

  @BuiltValueField(wireName: r'error_code')
  AnalysisErrorCode? get errorCode;
  // enum errorCodeEnum {  cancelled,  analysis_cli_unavailable,  analysis_cli_unsupported,  analysis_cli_not_authenticated,  analysis_sandbox_unavailable,  analysis_media_invalid,  analysis_provider_rate_limited,  analysis_provider_usage_limited,  analysis_cli_timeout,  analysis_cli_failed,  invalid_model_output,  analysis_resource_limit,  input_artifact_unavailable,  analysis_input_expired,  screenplay_output_incomplete,  analysis_report_unavailable,  internal_error,  worker_lost,  };

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  @BuiltValueField(wireName: r'finished_at')
  DateTime? get finishedAt;

  @BuiltValueField(wireName: r'result')
  AnalysisResponseResult? get result;

  @BuiltValueField(wireName: r'report_markdown')
  String? get reportMarkdown;

  @BuiltValueField(wireName: r'current_report_id')
  String? get currentReportId;

  @BuiltValueField(wireName: r'report')
  AnalysisReportResponse? get report;

  AnalysisResponse._();

  factory AnalysisResponse([void updates(AnalysisResponseBuilder b)]) =
      _$AnalysisResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnalysisResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnalysisResponse> get serializer =>
      _$AnalysisResponseSerializer();
}

class _$AnalysisResponseSerializer
    implements PrimitiveSerializer<AnalysisResponse> {
  @override
  final Iterable<Type> types = const [AnalysisResponse, _$AnalysisResponse];

  @override
  final String wireName = r'AnalysisResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnalysisResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'run_id';
    yield serializers.serialize(
      object.runId,
      specifiedType: const FullType(String),
    );
    yield r'run_no';
    yield serializers.serialize(
      object.runNo,
      specifiedType: const FullType(int),
    );
    yield r'run_trigger';
    yield serializers.serialize(
      object.runTrigger,
      specifiedType: const FullType(String),
    );
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(int),
    );
    yield r'skill_id';
    yield serializers.serialize(
      object.skillId,
      specifiedType: const FullType(String),
    );
    yield r'output_language';
    yield serializers.serialize(
      object.outputLanguage,
      specifiedType: const FullType(String),
    );
    yield r'input_kind';
    yield serializers.serialize(
      object.inputKind,
      specifiedType: const FullType(AnalysisInputKind),
    );
    yield r'result_contract';
    yield serializers.serialize(
      object.resultContract,
      specifiedType: const FullType(AnalysisResultContract),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(AnalysisStatus),
    );
    yield r'stage';
    yield object.stage == null
        ? null
        : serializers.serialize(
            object.stage,
            specifiedType: const FullType.nullable(AnalysisStage),
          );
    yield r'progress';
    yield serializers.serialize(
      object.progress,
      specifiedType: const FullType(int),
    );
    yield r'attempt';
    yield serializers.serialize(
      object.attempt,
      specifiedType: const FullType(int),
    );
    yield r'error_code';
    yield object.errorCode == null
        ? null
        : serializers.serialize(
            object.errorCode,
            specifiedType: const FullType.nullable(AnalysisErrorCode),
          );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'finished_at';
    yield object.finishedAt == null
        ? null
        : serializers.serialize(
            object.finishedAt,
            specifiedType: const FullType.nullable(DateTime),
          );
    yield r'result';
    yield object.result == null
        ? null
        : serializers.serialize(
            object.result,
            specifiedType: const FullType.nullable(AnalysisResponseResult),
          );
    yield r'report_markdown';
    yield object.reportMarkdown == null
        ? null
        : serializers.serialize(
            object.reportMarkdown,
            specifiedType: const FullType.nullable(String),
          );
    yield r'current_report_id';
    yield object.currentReportId == null
        ? null
        : serializers.serialize(
            object.currentReportId,
            specifiedType: const FullType.nullable(String),
          );
    yield r'report';
    yield object.report == null
        ? null
        : serializers.serialize(
            object.report,
            specifiedType: const FullType.nullable(AnalysisReportResponse),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    AnalysisResponse object, {
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
    required AnalysisResponseBuilder result,
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
        case r'run_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.runId = valueDes;
          break;
        case r'run_no':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.runNo = valueDes;
          break;
        case r'run_trigger':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.runTrigger = valueDes;
          break;
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.version = valueDes;
          break;
        case r'skill_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.skillId = valueDes;
          break;
        case r'output_language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.outputLanguage = valueDes;
          break;
        case r'input_kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AnalysisInputKind),
          ) as AnalysisInputKind;
          result.inputKind = valueDes;
          break;
        case r'result_contract':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AnalysisResultContract),
          ) as AnalysisResultContract;
          result.resultContract = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AnalysisStatus),
          ) as AnalysisStatus;
          result.status = valueDes;
          break;
        case r'stage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AnalysisStage),
          ) as AnalysisStage?;
          if (valueDes == null) continue;
          result.stage = valueDes;
          break;
        case r'progress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.progress = valueDes;
          break;
        case r'attempt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.attempt = valueDes;
          break;
        case r'error_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AnalysisErrorCode),
          ) as AnalysisErrorCode?;
          if (valueDes == null) continue;
          result.errorCode = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        case r'finished_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.finishedAt = valueDes;
          break;
        case r'result':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AnalysisResponseResult),
          ) as AnalysisResponseResult?;
          if (valueDes == null) continue;
          result.result.replace(valueDes);
          break;
        case r'report_markdown':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reportMarkdown = valueDes;
          break;
        case r'current_report_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currentReportId = valueDes;
          break;
        case r'report':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AnalysisReportResponse),
          ) as AnalysisReportResponse?;
          if (valueDes == null) continue;
          result.report.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnalysisResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnalysisResponseBuilder();
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
