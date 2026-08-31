//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analysis_input_kind.g.dart';

class AnalysisInputKind extends EnumClass {
  @BuiltValueEnumConst(wireName: r'video')
  static const AnalysisInputKind video = _$video;
  @BuiltValueEnumConst(wireName: r'screenplay')
  static const AnalysisInputKind screenplay = _$screenplay;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const AnalysisInputKind unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<AnalysisInputKind> get serializer =>
      _$analysisInputKindSerializer;

  const AnalysisInputKind._(String name) : super(name);

  static BuiltSet<AnalysisInputKind> get values => _$values;
  static AnalysisInputKind valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AnalysisInputKindMixin = Object with _$AnalysisInputKindMixin;
