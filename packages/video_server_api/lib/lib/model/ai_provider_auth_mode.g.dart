// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_provider_auth_mode.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AiProviderAuthMode _$hostLogin = const AiProviderAuthMode._('hostLogin');
const AiProviderAuthMode _$apiKey = const AiProviderAuthMode._('apiKey');
const AiProviderAuthMode _$unknownDefaultOpenApi =
    const AiProviderAuthMode._('unknownDefaultOpenApi');

AiProviderAuthMode _$valueOf(String name) {
  switch (name) {
    case 'hostLogin':
      return _$hostLogin;
    case 'apiKey':
      return _$apiKey;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<AiProviderAuthMode> _$values =
    BuiltSet<AiProviderAuthMode>(const <AiProviderAuthMode>[
  _$hostLogin,
  _$apiKey,
  _$unknownDefaultOpenApi,
]);

class _$AiProviderAuthModeMeta {
  const _$AiProviderAuthModeMeta();
  AiProviderAuthMode get hostLogin => _$hostLogin;
  AiProviderAuthMode get apiKey => _$apiKey;
  AiProviderAuthMode get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  AiProviderAuthMode valueOf(String name) => _$valueOf(name);
  BuiltSet<AiProviderAuthMode> get values => _$values;
}

mixin _$AiProviderAuthModeMixin {
  // ignore: non_constant_identifier_names
  _$AiProviderAuthModeMeta get AiProviderAuthMode =>
      const _$AiProviderAuthModeMeta();
}

Serializer<AiProviderAuthMode> _$aiProviderAuthModeSerializer =
    _$AiProviderAuthModeSerializer();

class _$AiProviderAuthModeSerializer
    implements PrimitiveSerializer<AiProviderAuthMode> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'hostLogin': 'host_login',
    'apiKey': 'api_key',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'host_login': 'hostLogin',
    'api_key': 'apiKey',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[AiProviderAuthMode];
  @override
  final String wireName = 'AiProviderAuthMode';

  @override
  Object serialize(Serializers serializers, AiProviderAuthMode object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AiProviderAuthMode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AiProviderAuthMode.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
