//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_error_code.g.dart';

class AnalysisErrorCode extends EnumClass {
  @BuiltValueEnumConst(wireName: r'cancelled')
  static const AnalysisErrorCode cancelled = _$cancelled;
  @BuiltValueEnumConst(wireName: r'analysis_cli_unavailable')
  static const AnalysisErrorCode analysisCliUnavailable =
      _$analysisCliUnavailable;
  @BuiltValueEnumConst(wireName: r'analysis_cli_unsupported')
  static const AnalysisErrorCode analysisCliUnsupported =
      _$analysisCliUnsupported;
  @BuiltValueEnumConst(wireName: r'analysis_cli_not_authenticated')
  static const AnalysisErrorCode analysisCliNotAuthenticated =
      _$analysisCliNotAuthenticated;
  @BuiltValueEnumConst(wireName: r'analysis_sandbox_unavailable')
  static const AnalysisErrorCode analysisSandboxUnavailable =
      _$analysisSandboxUnavailable;
  @BuiltValueEnumConst(wireName: r'analysis_media_invalid')
  static const AnalysisErrorCode analysisMediaInvalid = _$analysisMediaInvalid;
  @BuiltValueEnumConst(wireName: r'analysis_provider_rate_limited')
  static const AnalysisErrorCode analysisProviderRateLimited =
      _$analysisProviderRateLimited;
  @BuiltValueEnumConst(wireName: r'analysis_provider_usage_limited')
  static const AnalysisErrorCode analysisProviderUsageLimited =
      _$analysisProviderUsageLimited;
  @BuiltValueEnumConst(wireName: r'analysis_cli_timeout')
  static const AnalysisErrorCode analysisCliTimeout = _$analysisCliTimeout;
  @BuiltValueEnumConst(wireName: r'analysis_cli_failed')
  static const AnalysisErrorCode analysisCliFailed = _$analysisCliFailed;
  @BuiltValueEnumConst(wireName: r'invalid_model_output')
  static const AnalysisErrorCode invalidModelOutput = _$invalidModelOutput;
  @BuiltValueEnumConst(wireName: r'analysis_resource_limit')
  static const AnalysisErrorCode analysisResourceLimit =
      _$analysisResourceLimit;
  @BuiltValueEnumConst(wireName: r'input_artifact_unavailable')
  static const AnalysisErrorCode inputArtifactUnavailable =
      _$inputArtifactUnavailable;
  @BuiltValueEnumConst(wireName: r'analysis_input_expired')
  static const AnalysisErrorCode analysisInputExpired = _$analysisInputExpired;
  @BuiltValueEnumConst(wireName: r'screenplay_output_incomplete')
  static const AnalysisErrorCode screenplayOutputIncomplete =
      _$screenplayOutputIncomplete;
  @BuiltValueEnumConst(wireName: r'analysis_report_unavailable')
  static const AnalysisErrorCode analysisReportUnavailable =
      _$analysisReportUnavailable;
  @BuiltValueEnumConst(wireName: r'internal_error')
  static const AnalysisErrorCode internalError = _$internalError;
  @BuiltValueEnumConst(wireName: r'worker_lost')
  static const AnalysisErrorCode workerLost = _$workerLost;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const AnalysisErrorCode unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<AnalysisErrorCode> get serializer =>
      _$analysisErrorCodeSerializer;

  const AnalysisErrorCode._(String name) : super(name);

  static BuiltSet<AnalysisErrorCode> get values => _$values;
  static AnalysisErrorCode valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AnalysisErrorCodeMixin = Object with _$AnalysisErrorCodeMixin;
