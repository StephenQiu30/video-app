// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_stage.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AnalysisStage _$preparing = const AnalysisStage._('preparing');
const AnalysisStage _$analyzing = const AnalysisStage._('analyzing');
const AnalysisStage _$validating = const AnalysisStage._('validating');
const AnalysisStage _$publishing = const AnalysisStage._('publishing');
const AnalysisStage _$unknownDefaultOpenApi =
    const AnalysisStage._('unknownDefaultOpenApi');

AnalysisStage _$valueOf(String name) {
  switch (name) {
    case 'preparing':
      return _$preparing;
    case 'analyzing':
      return _$analyzing;
    case 'validating':
      return _$validating;
    case 'publishing':
      return _$publishing;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<AnalysisStage> _$values =
    BuiltSet<AnalysisStage>(const <AnalysisStage>[
  _$preparing,
  _$analyzing,
  _$validating,
  _$publishing,
  _$unknownDefaultOpenApi,
]);

class _$AnalysisStageMeta {
  const _$AnalysisStageMeta();
  AnalysisStage get preparing => _$preparing;
  AnalysisStage get analyzing => _$analyzing;
  AnalysisStage get validating => _$validating;
  AnalysisStage get publishing => _$publishing;
  AnalysisStage get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  AnalysisStage valueOf(String name) => _$valueOf(name);
  BuiltSet<AnalysisStage> get values => _$values;
}

mixin _$AnalysisStageMixin {
  // ignore: non_constant_identifier_names
  _$AnalysisStageMeta get AnalysisStage => const _$AnalysisStageMeta();
}

Serializer<AnalysisStage> _$analysisStageSerializer =
    _$AnalysisStageSerializer();

class _$AnalysisStageSerializer implements PrimitiveSerializer<AnalysisStage> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'preparing': 'preparing',
    'analyzing': 'analyzing',
    'validating': 'validating',
    'publishing': 'publishing',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'preparing': 'preparing',
    'analyzing': 'analyzing',
    'validating': 'validating',
    'publishing': 'publishing',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[AnalysisStage];
  @override
  final String wireName = 'AnalysisStage';

  @override
  Object serialize(Serializers serializers, AnalysisStage object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AnalysisStage deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AnalysisStage.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
