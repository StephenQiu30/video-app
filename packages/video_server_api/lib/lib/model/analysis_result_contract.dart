//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_result_contract.g.dart';

class AnalysisResultContract extends EnumClass {
  @BuiltValueEnumConst(wireName: r'video-visual-analysis')
  static const AnalysisResultContract videoVisualAnalysis =
      _$videoVisualAnalysis;
  @BuiltValueEnumConst(wireName: r'video-article')
  static const AnalysisResultContract videoArticle = _$videoArticle;
  @BuiltValueEnumConst(wireName: r'screenplay-analysis')
  static const AnalysisResultContract screenplayAnalysis = _$screenplayAnalysis;
  @BuiltValueEnumConst(wireName: r'screenplay-rewrite')
  static const AnalysisResultContract screenplayRewrite = _$screenplayRewrite;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const AnalysisResultContract unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<AnalysisResultContract> get serializer =>
      _$analysisResultContractSerializer;

  const AnalysisResultContract._(String name) : super(name);

  static BuiltSet<AnalysisResultContract> get values => _$values;
  static AnalysisResultContract valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AnalysisResultContractMixin = Object
    with _$AnalysisResultContractMixin;
