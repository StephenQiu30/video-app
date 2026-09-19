// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_access_policy.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProviderAccessPolicy _$public = const ProviderAccessPolicy._('public');
const ProviderAccessPolicy _$publicSession =
    const ProviderAccessPolicy._('publicSession');
const ProviderAccessPolicy _$operatorPublic =
    const ProviderAccessPolicy._('operatorPublic');
const ProviderAccessPolicy _$personalEntitled =
    const ProviderAccessPolicy._('personalEntitled');
const ProviderAccessPolicy _$unknownDefaultOpenApi =
    const ProviderAccessPolicy._('unknownDefaultOpenApi');

ProviderAccessPolicy _$valueOf(String name) {
  switch (name) {
    case 'public':
      return _$public;
    case 'publicSession':
      return _$publicSession;
    case 'operatorPublic':
      return _$operatorPublic;
    case 'personalEntitled':
      return _$personalEntitled;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<ProviderAccessPolicy> _$values =
    BuiltSet<ProviderAccessPolicy>(const <ProviderAccessPolicy>[
  _$public,
  _$publicSession,
  _$operatorPublic,
  _$personalEntitled,
  _$unknownDefaultOpenApi,
]);

class _$ProviderAccessPolicyMeta {
  const _$ProviderAccessPolicyMeta();
  ProviderAccessPolicy get public => _$public;
  ProviderAccessPolicy get publicSession => _$publicSession;
  ProviderAccessPolicy get operatorPublic => _$operatorPublic;
  ProviderAccessPolicy get personalEntitled => _$personalEntitled;
  ProviderAccessPolicy get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  ProviderAccessPolicy valueOf(String name) => _$valueOf(name);
  BuiltSet<ProviderAccessPolicy> get values => _$values;
}

mixin _$ProviderAccessPolicyMixin {
  // ignore: non_constant_identifier_names
  _$ProviderAccessPolicyMeta get ProviderAccessPolicy =>
      const _$ProviderAccessPolicyMeta();
}

Serializer<ProviderAccessPolicy> _$providerAccessPolicySerializer =
    _$ProviderAccessPolicySerializer();

class _$ProviderAccessPolicySerializer
    implements PrimitiveSerializer<ProviderAccessPolicy> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'public': 'public',
    'publicSession': 'public_session',
    'operatorPublic': 'operator_public',
    'personalEntitled': 'personal_entitled',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'public': 'public',
    'public_session': 'publicSession',
    'operator_public': 'operatorPublic',
    'personal_entitled': 'personalEntitled',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ProviderAccessPolicy];
  @override
  final String wireName = 'ProviderAccessPolicy';

  @override
  Object serialize(Serializers serializers, ProviderAccessPolicy object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ProviderAccessPolicy deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProviderAccessPolicy.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
