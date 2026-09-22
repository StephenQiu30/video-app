// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_authorization_action.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProviderAuthorizationAction _$none =
    const ProviderAuthorizationAction._('none');
const ProviderAuthorizationAction _$browserSession =
    const ProviderAuthorizationAction._('browserSession');
const ProviderAuthorizationAction _$managedSession =
    const ProviderAuthorizationAction._('managedSession');
const ProviderAuthorizationAction _$unknownDefaultOpenApi =
    const ProviderAuthorizationAction._('unknownDefaultOpenApi');

ProviderAuthorizationAction _$valueOf(String name) {
  switch (name) {
    case 'none':
      return _$none;
    case 'browserSession':
      return _$browserSession;
    case 'managedSession':
      return _$managedSession;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<ProviderAuthorizationAction> _$values =
    BuiltSet<ProviderAuthorizationAction>(const <ProviderAuthorizationAction>[
  _$none,
  _$browserSession,
  _$managedSession,
  _$unknownDefaultOpenApi,
]);

class _$ProviderAuthorizationActionMeta {
  const _$ProviderAuthorizationActionMeta();
  ProviderAuthorizationAction get none => _$none;
  ProviderAuthorizationAction get browserSession => _$browserSession;
  ProviderAuthorizationAction get managedSession => _$managedSession;
  ProviderAuthorizationAction get unknownDefaultOpenApi =>
      _$unknownDefaultOpenApi;
  ProviderAuthorizationAction valueOf(String name) => _$valueOf(name);
  BuiltSet<ProviderAuthorizationAction> get values => _$values;
}

mixin _$ProviderAuthorizationActionMixin {
  // ignore: non_constant_identifier_names
  _$ProviderAuthorizationActionMeta get ProviderAuthorizationAction =>
      const _$ProviderAuthorizationActionMeta();
}

Serializer<ProviderAuthorizationAction>
    _$providerAuthorizationActionSerializer =
    _$ProviderAuthorizationActionSerializer();

class _$ProviderAuthorizationActionSerializer
    implements PrimitiveSerializer<ProviderAuthorizationAction> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'none': 'none',
    'browserSession': 'browser_session',
    'managedSession': 'managed_session',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'none': 'none',
    'browser_session': 'browserSession',
    'managed_session': 'managedSession',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ProviderAuthorizationAction];
  @override
  final String wireName = 'ProviderAuthorizationAction';

  @override
  Object serialize(Serializers serializers, ProviderAuthorizationAction object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ProviderAuthorizationAction deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProviderAuthorizationAction.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
