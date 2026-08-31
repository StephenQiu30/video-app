// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_input_kind.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AnalysisInputKind _$video = const AnalysisInputKind._('video');
const AnalysisInputKind _$screenplay = const AnalysisInputKind._('screenplay');
const AnalysisInputKind _$unknownDefaultOpenApi =
    const AnalysisInputKind._('unknownDefaultOpenApi');

AnalysisInputKind _$valueOf(String name) {
  switch (name) {
    case 'video':
      return _$video;
    case 'screenplay':
      return _$screenplay;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<AnalysisInputKind> _$values =
    BuiltSet<AnalysisInputKind>(const <AnalysisInputKind>[
  _$video,
  _$screenplay,
  _$unknownDefaultOpenApi,
]);

class _$AnalysisInputKindMeta {
  const _$AnalysisInputKindMeta();
  AnalysisInputKind get video => _$video;
  AnalysisInputKind get screenplay => _$screenplay;
  AnalysisInputKind get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  AnalysisInputKind valueOf(String name) => _$valueOf(name);
  BuiltSet<AnalysisInputKind> get values => _$values;
}

mixin _$AnalysisInputKindMixin {
  // ignore: non_constant_identifier_names
  _$AnalysisInputKindMeta get AnalysisInputKind =>
      const _$AnalysisInputKindMeta();
}

Serializer<AnalysisInputKind> _$analysisInputKindSerializer =
    _$AnalysisInputKindSerializer();

class _$AnalysisInputKindSerializer
    implements PrimitiveSerializer<AnalysisInputKind> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'video': 'video',
    'screenplay': 'screenplay',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'video': 'video',
    'screenplay': 'screenplay',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[AnalysisInputKind];
  @override
  final String wireName = 'AnalysisInputKind';

  @override
  Object serialize(Serializers serializers, AnalysisInputKind object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AnalysisInputKind deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AnalysisInputKind.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
