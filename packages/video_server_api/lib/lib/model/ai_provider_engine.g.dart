// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_provider_engine.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AiProviderEngine _$codex = const AiProviderEngine._('codex');
const AiProviderEngine _$claude = const AiProviderEngine._('claude');
const AiProviderEngine _$deepseek = const AiProviderEngine._('deepseek');
const AiProviderEngine _$unknownDefaultOpenApi =
    const AiProviderEngine._('unknownDefaultOpenApi');

AiProviderEngine _$valueOf(String name) {
  switch (name) {
    case 'codex':
      return _$codex;
    case 'claude':
      return _$claude;
    case 'deepseek':
      return _$deepseek;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<AiProviderEngine> _$values =
    BuiltSet<AiProviderEngine>(const <AiProviderEngine>[
  _$codex,
  _$claude,
  _$deepseek,
  _$unknownDefaultOpenApi,
]);

class _$AiProviderEngineMeta {
  const _$AiProviderEngineMeta();
  AiProviderEngine get codex => _$codex;
  AiProviderEngine get claude => _$claude;
  AiProviderEngine get deepseek => _$deepseek;
  AiProviderEngine get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  AiProviderEngine valueOf(String name) => _$valueOf(name);
  BuiltSet<AiProviderEngine> get values => _$values;
}

mixin _$AiProviderEngineMixin {
  // ignore: non_constant_identifier_names
  _$AiProviderEngineMeta get AiProviderEngine => const _$AiProviderEngineMeta();
}

Serializer<AiProviderEngine> _$aiProviderEngineSerializer =
    _$AiProviderEngineSerializer();

class _$AiProviderEngineSerializer
    implements PrimitiveSerializer<AiProviderEngine> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'codex': 'codex',
    'claude': 'claude',
    'deepseek': 'deepseek',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'codex': 'codex',
    'claude': 'claude',
    'deepseek': 'deepseek',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[AiProviderEngine];
  @override
  final String wireName = 'AiProviderEngine';

  @override
  Object serialize(Serializers serializers, AiProviderEngine object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AiProviderEngine deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AiProviderEngine.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
