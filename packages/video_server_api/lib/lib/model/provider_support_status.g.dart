// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_support_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProviderSupportStatus _$unknown =
    const ProviderSupportStatus._('unknown');
const ProviderSupportStatus _$verified =
    const ProviderSupportStatus._('verified');
const ProviderSupportStatus _$degraded =
    const ProviderSupportStatus._('degraded');
const ProviderSupportStatus _$accessRequired =
    const ProviderSupportStatus._('accessRequired');
const ProviderSupportStatus _$rateLimited =
    const ProviderSupportStatus._('rateLimited');
const ProviderSupportStatus _$blocked =
    const ProviderSupportStatus._('blocked');
const ProviderSupportStatus _$disabled =
    const ProviderSupportStatus._('disabled');
const ProviderSupportStatus _$unsupported =
    const ProviderSupportStatus._('unsupported');
const ProviderSupportStatus _$unknownDefaultOpenApi =
    const ProviderSupportStatus._('unknownDefaultOpenApi');

ProviderSupportStatus _$valueOf(String name) {
  switch (name) {
    case 'unknown':
      return _$unknown;
    case 'verified':
      return _$verified;
    case 'degraded':
      return _$degraded;
    case 'accessRequired':
      return _$accessRequired;
    case 'rateLimited':
      return _$rateLimited;
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

final BuiltSet<ProviderSupportStatus> _$values =
    BuiltSet<ProviderSupportStatus>(const <ProviderSupportStatus>[
  _$unknown,
  _$verified,
  _$degraded,
  _$accessRequired,
  _$rateLimited,
  _$blocked,
  _$disabled,
  _$unsupported,
  _$unknownDefaultOpenApi,
]);

class _$ProviderSupportStatusMeta {
  const _$ProviderSupportStatusMeta();
  ProviderSupportStatus get unknown => _$unknown;
  ProviderSupportStatus get verified => _$verified;
  ProviderSupportStatus get degraded => _$degraded;
  ProviderSupportStatus get accessRequired => _$accessRequired;
  ProviderSupportStatus get rateLimited => _$rateLimited;
  ProviderSupportStatus get blocked => _$blocked;
  ProviderSupportStatus get disabled => _$disabled;
  ProviderSupportStatus get unsupported => _$unsupported;
  ProviderSupportStatus get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  ProviderSupportStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<ProviderSupportStatus> get values => _$values;
}

mixin _$ProviderSupportStatusMixin {
  // ignore: non_constant_identifier_names
  _$ProviderSupportStatusMeta get ProviderSupportStatus =>
      const _$ProviderSupportStatusMeta();
}

Serializer<ProviderSupportStatus> _$providerSupportStatusSerializer =
    _$ProviderSupportStatusSerializer();

class _$ProviderSupportStatusSerializer
    implements PrimitiveSerializer<ProviderSupportStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'unknown': 'unknown',
    'verified': 'verified',
    'degraded': 'degraded',
    'accessRequired': 'access_required',
    'rateLimited': 'rate_limited',
    'blocked': 'blocked',
    'disabled': 'disabled',
    'unsupported': 'unsupported',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'unknown': 'unknown',
    'verified': 'verified',
    'degraded': 'degraded',
    'access_required': 'accessRequired',
    'rate_limited': 'rateLimited',
    'blocked': 'blocked',
    'disabled': 'disabled',
    'unsupported': 'unsupported',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ProviderSupportStatus];
  @override
  final String wireName = 'ProviderSupportStatus';

  @override
  Object serialize(Serializers serializers, ProviderSupportStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ProviderSupportStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProviderSupportStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
