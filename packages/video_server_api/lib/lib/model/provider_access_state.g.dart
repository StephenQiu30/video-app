// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_access_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProviderAccessState _$publicProbe =
    const ProviderAccessState._('publicProbe');
const ProviderAccessState _$publicReady =
    const ProviderAccessState._('publicReady');
const ProviderAccessState _$guestProbe =
    const ProviderAccessState._('guestProbe');
const ProviderAccessState _$guestReady =
    const ProviderAccessState._('guestReady');
const ProviderAccessState _$authorizationRequired =
    const ProviderAccessState._('authorizationRequired');
const ProviderAccessState _$operatorProbe =
    const ProviderAccessState._('operatorProbe');
const ProviderAccessState _$operatorReady =
    const ProviderAccessState._('operatorReady');
const ProviderAccessState _$degraded = const ProviderAccessState._('degraded');
const ProviderAccessState _$blocked = const ProviderAccessState._('blocked');
const ProviderAccessState _$disabled = const ProviderAccessState._('disabled');
const ProviderAccessState _$unsupported =
    const ProviderAccessState._('unsupported');
const ProviderAccessState _$unknownDefaultOpenApi =
    const ProviderAccessState._('unknownDefaultOpenApi');

ProviderAccessState _$valueOf(String name) {
  switch (name) {
    case 'publicProbe':
      return _$publicProbe;
    case 'publicReady':
      return _$publicReady;
    case 'guestProbe':
      return _$guestProbe;
    case 'guestReady':
      return _$guestReady;
    case 'authorizationRequired':
      return _$authorizationRequired;
    case 'operatorProbe':
      return _$operatorProbe;
    case 'operatorReady':
      return _$operatorReady;
    case 'degraded':
      return _$degraded;
    case 'blocked':
      return _$blocked;
    case 'disabled':
      return _$disabled;
    case 'unsupported':
      return _$unsupported;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<ProviderAccessState> _$values =
    BuiltSet<ProviderAccessState>(const <ProviderAccessState>[
  _$publicProbe,
  _$publicReady,
  _$guestProbe,
  _$guestReady,
  _$authorizationRequired,
  _$operatorProbe,
  _$operatorReady,
  _$degraded,
  _$blocked,
  _$disabled,
  _$unsupported,
  _$unknownDefaultOpenApi,
]);

class _$ProviderAccessStateMeta {
  const _$ProviderAccessStateMeta();
  ProviderAccessState get publicProbe => _$publicProbe;
  ProviderAccessState get publicReady => _$publicReady;
  ProviderAccessState get guestProbe => _$guestProbe;
  ProviderAccessState get guestReady => _$guestReady;
  ProviderAccessState get authorizationRequired => _$authorizationRequired;
  ProviderAccessState get operatorProbe => _$operatorProbe;
  ProviderAccessState get operatorReady => _$operatorReady;
  ProviderAccessState get degraded => _$degraded;
  ProviderAccessState get blocked => _$blocked;
  ProviderAccessState get disabled => _$disabled;
  ProviderAccessState get unsupported => _$unsupported;
  ProviderAccessState get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  ProviderAccessState valueOf(String name) => _$valueOf(name);
  BuiltSet<ProviderAccessState> get values => _$values;
}

mixin _$ProviderAccessStateMixin {
  // ignore: non_constant_identifier_names
  _$ProviderAccessStateMeta get ProviderAccessState =>
      const _$ProviderAccessStateMeta();
}

Serializer<ProviderAccessState> _$providerAccessStateSerializer =
    _$ProviderAccessStateSerializer();

class _$ProviderAccessStateSerializer
    implements PrimitiveSerializer<ProviderAccessState> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'publicProbe': 'public_probe',
    'publicReady': 'public_ready',
    'guestProbe': 'guest_probe',
    'guestReady': 'guest_ready',
    'authorizationRequired': 'authorization_required',
    'operatorProbe': 'operator_probe',
    'operatorReady': 'operator_ready',
    'degraded': 'degraded',
    'blocked': 'blocked',
    'disabled': 'disabled',
    'unsupported': 'unsupported',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'public_probe': 'publicProbe',
    'public_ready': 'publicReady',
    'guest_probe': 'guestProbe',
    'guest_ready': 'guestReady',
    'authorization_required': 'authorizationRequired',
    'operator_probe': 'operatorProbe',
    'operator_ready': 'operatorReady',
    'degraded': 'degraded',
    'blocked': 'blocked',
    'disabled': 'disabled',
    'unsupported': 'unsupported',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ProviderAccessState];
  @override
  final String wireName = 'ProviderAccessState';

  @override
  Object serialize(Serializers serializers, ProviderAccessState object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ProviderAccessState deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProviderAccessState.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
