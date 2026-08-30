// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_access_mode.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProviderAccessMode _$anonymous = const ProviderAccessMode._('anonymous');
const ProviderAccessMode _$operatorManaged =
    const ProviderAccessMode._('operatorManaged');
const ProviderAccessMode _$unknownDefaultOpenApi =
    const ProviderAccessMode._('unknownDefaultOpenApi');

ProviderAccessMode _$valueOf(String name) {
  switch (name) {
    case 'anonymous':
      return _$anonymous;
    case 'operatorManaged':
      return _$operatorManaged;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<ProviderAccessMode> _$values =
    BuiltSet<ProviderAccessMode>(const <ProviderAccessMode>[
  _$anonymous,
  _$operatorManaged,
  _$unknownDefaultOpenApi,
]);

class _$ProviderAccessModeMeta {
  const _$ProviderAccessModeMeta();
  ProviderAccessMode get anonymous => _$anonymous;
  ProviderAccessMode get operatorManaged => _$operatorManaged;
  ProviderAccessMode get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  ProviderAccessMode valueOf(String name) => _$valueOf(name);
  BuiltSet<ProviderAccessMode> get values => _$values;
}

mixin _$ProviderAccessModeMixin {
  // ignore: non_constant_identifier_names
  _$ProviderAccessModeMeta get ProviderAccessMode =>
      const _$ProviderAccessModeMeta();
}

Serializer<ProviderAccessMode> _$providerAccessModeSerializer =
    _$ProviderAccessModeSerializer();

class _$ProviderAccessModeSerializer
    implements PrimitiveSerializer<ProviderAccessMode> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'anonymous': 'anonymous',
    'operatorManaged': 'operator_managed',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'anonymous': 'anonymous',
    'operator_managed': 'operatorManaged',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ProviderAccessMode];
  @override
  final String wireName = 'ProviderAccessMode';

  @override
  Object serialize(Serializers serializers, ProviderAccessMode object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ProviderAccessMode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProviderAccessMode.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
