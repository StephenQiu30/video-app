// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_result_contract.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AnalysisResultContract _$videoVisualAnalysis =
    const AnalysisResultContract._('videoVisualAnalysis');
const AnalysisResultContract _$videoArticle =
    const AnalysisResultContract._('videoArticle');
const AnalysisResultContract _$screenplayAnalysis =
    const AnalysisResultContract._('screenplayAnalysis');
const AnalysisResultContract _$screenplayRewrite =
    const AnalysisResultContract._('screenplayRewrite');
const AnalysisResultContract _$unknownDefaultOpenApi =
    const AnalysisResultContract._('unknownDefaultOpenApi');

AnalysisResultContract _$valueOf(String name) {
  switch (name) {
    case 'videoVisualAnalysis':
      return _$videoVisualAnalysis;
    case 'videoArticle':
      return _$videoArticle;
    case 'screenplayAnalysis':
      return _$screenplayAnalysis;
    case 'screenplayRewrite':
      return _$screenplayRewrite;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<AnalysisResultContract> _$values =
    BuiltSet<AnalysisResultContract>(const <AnalysisResultContract>[
  _$videoVisualAnalysis,
  _$videoArticle,
  _$screenplayAnalysis,
  _$screenplayRewrite,
  _$unknownDefaultOpenApi,
]);

class _$AnalysisResultContractMeta {
  const _$AnalysisResultContractMeta();
  AnalysisResultContract get videoVisualAnalysis => _$videoVisualAnalysis;
  AnalysisResultContract get videoArticle => _$videoArticle;
  AnalysisResultContract get screenplayAnalysis => _$screenplayAnalysis;
  AnalysisResultContract get screenplayRewrite => _$screenplayRewrite;
  AnalysisResultContract get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  AnalysisResultContract valueOf(String name) => _$valueOf(name);
  BuiltSet<AnalysisResultContract> get values => _$values;
}

mixin _$AnalysisResultContractMixin {
  // ignore: non_constant_identifier_names
  _$AnalysisResultContractMeta get AnalysisResultContract =>
      const _$AnalysisResultContractMeta();
}

Serializer<AnalysisResultContract> _$analysisResultContractSerializer =
    _$AnalysisResultContractSerializer();

class _$AnalysisResultContractSerializer
    implements PrimitiveSerializer<AnalysisResultContract> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'videoVisualAnalysis': 'video-visual-analysis',
    'videoArticle': 'video-article',
    'screenplayAnalysis': 'screenplay-analysis',
    'screenplayRewrite': 'screenplay-rewrite',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'video-visual-analysis': 'videoVisualAnalysis',
    'video-article': 'videoArticle',
    'screenplay-analysis': 'screenplayAnalysis',
    'screenplay-rewrite': 'screenplayRewrite',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[AnalysisResultContract];
  @override
  final String wireName = 'AnalysisResultContract';

  @override
  Object serialize(Serializers serializers, AnalysisResultContract object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AnalysisResultContract deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AnalysisResultContract.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
