// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'execution_mode.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ExecutionMode _$providerRunner = const ExecutionMode._('providerRunner');
const ExecutionMode _$articleNative = const ExecutionMode._('articleNative');
const ExecutionMode _$officialConnector =
    const ExecutionMode._('officialConnector');
const ExecutionMode _$verifiedImport = const ExecutionMode._('verifiedImport');
const ExecutionMode _$unknownDefaultOpenApi =
    const ExecutionMode._('unknownDefaultOpenApi');

ExecutionMode _$valueOf(String name) {
  switch (name) {
    case 'providerRunner':
      return _$providerRunner;
    case 'articleNative':
      return _$articleNative;
    case 'officialConnector':
      return _$officialConnector;
    case 'verifiedImport':
      return _$verifiedImport;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<ExecutionMode> _$values =
    BuiltSet<ExecutionMode>(const <ExecutionMode>[
  _$providerRunner,
  _$articleNative,
  _$officialConnector,
  _$verifiedImport,
  _$unknownDefaultOpenApi,
]);

class _$ExecutionModeMeta {
  const _$ExecutionModeMeta();
  ExecutionMode get providerRunner => _$providerRunner;
  ExecutionMode get articleNative => _$articleNative;
  ExecutionMode get officialConnector => _$officialConnector;
  ExecutionMode get verifiedImport => _$verifiedImport;
  ExecutionMode get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  ExecutionMode valueOf(String name) => _$valueOf(name);
  BuiltSet<ExecutionMode> get values => _$values;
}

mixin _$ExecutionModeMixin {
  // ignore: non_constant_identifier_names
  _$ExecutionModeMeta get ExecutionMode => const _$ExecutionModeMeta();
}

Serializer<ExecutionMode> _$executionModeSerializer =
    _$ExecutionModeSerializer();

class _$ExecutionModeSerializer implements PrimitiveSerializer<ExecutionMode> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'providerRunner': 'provider_runner',
    'articleNative': 'article_native',
    'officialConnector': 'official_connector',
    'verifiedImport': 'verified_import',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'provider_runner': 'providerRunner',
    'article_native': 'articleNative',
    'official_connector': 'officialConnector',
    'verified_import': 'verifiedImport',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ExecutionMode];
  @override
  final String wireName = 'ExecutionMode';

  @override
  Object serialize(Serializers serializers, ExecutionMode object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ExecutionMode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ExecutionMode.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
