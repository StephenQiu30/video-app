// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const IdentityState _$verified = const IdentityState._('verified');
const IdentityState _$ambiguous = const IdentityState._('ambiguous');
const IdentityState _$unknown = const IdentityState._('unknown');
const IdentityState _$unknownDefaultOpenApi =
    const IdentityState._('unknownDefaultOpenApi');

IdentityState _$valueOf(String name) {
  switch (name) {
    case 'verified':
      return _$verified;
    case 'ambiguous':
      return _$ambiguous;
    case 'unknown':
      return _$unknown;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<IdentityState> _$values =
    BuiltSet<IdentityState>(const <IdentityState>[
  _$verified,
  _$ambiguous,
  _$unknown,
  _$unknownDefaultOpenApi,
]);

class _$IdentityStateMeta {
  const _$IdentityStateMeta();
  IdentityState get verified => _$verified;
  IdentityState get ambiguous => _$ambiguous;
  IdentityState get unknown => _$unknown;
  IdentityState get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  IdentityState valueOf(String name) => _$valueOf(name);
  BuiltSet<IdentityState> get values => _$values;
}

mixin _$IdentityStateMixin {
  // ignore: non_constant_identifier_names
  _$IdentityStateMeta get IdentityState => const _$IdentityStateMeta();
}

Serializer<IdentityState> _$identityStateSerializer =
    _$IdentityStateSerializer();

class _$IdentityStateSerializer implements PrimitiveSerializer<IdentityState> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'verified': 'verified',
    'ambiguous': 'ambiguous',
    'unknown': 'unknown',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'verified': 'verified',
    'ambiguous': 'ambiguous',
    'unknown': 'unknown',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[IdentityState];
  @override
  final String wireName = 'IdentityState';

  @override
  Object serialize(Serializers serializers, IdentityState object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  IdentityState deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      IdentityState.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
