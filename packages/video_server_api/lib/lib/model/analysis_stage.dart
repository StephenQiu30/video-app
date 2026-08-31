//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_stage.g.dart';

class AnalysisStage extends EnumClass {
  @BuiltValueEnumConst(wireName: r'preparing')
  static const AnalysisStage preparing = _$preparing;
  @BuiltValueEnumConst(wireName: r'analyzing')
  static const AnalysisStage analyzing = _$analyzing;
  @BuiltValueEnumConst(wireName: r'validating')
  static const AnalysisStage validating = _$validating;
  @BuiltValueEnumConst(wireName: r'publishing')
  static const AnalysisStage publishing = _$publishing;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const AnalysisStage unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<AnalysisStage> get serializer => _$analysisStageSerializer;

  const AnalysisStage._(String name) : super(name);

  static BuiltSet<AnalysisStage> get values => _$values;
  static AnalysisStage valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AnalysisStageMixin = Object with _$AnalysisStageMixin;
