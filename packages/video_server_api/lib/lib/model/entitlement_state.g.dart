// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entitlement_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EntitlementState _$publicFree = const EntitlementState._('publicFree');
const EntitlementState _$officialDownloadGrant =
    const EntitlementState._('officialDownloadGrant');
const EntitlementState _$restricted = const EntitlementState._('restricted');
const EntitlementState _$unknown = const EntitlementState._('unknown');
const EntitlementState _$unknownDefaultOpenApi =
    const EntitlementState._('unknownDefaultOpenApi');

EntitlementState _$valueOf(String name) {
  switch (name) {
    case 'publicFree':
      return _$publicFree;
    case 'officialDownloadGrant':
      return _$officialDownloadGrant;
    case 'restricted':
      return _$restricted;
    case 'unknown':
      return _$unknown;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<EntitlementState> _$values =
    BuiltSet<EntitlementState>(const <EntitlementState>[
  _$publicFree,
  _$officialDownloadGrant,
  _$restricted,
  _$unknown,
  _$unknownDefaultOpenApi,
]);

class _$EntitlementStateMeta {
  const _$EntitlementStateMeta();
  EntitlementState get publicFree => _$publicFree;
  EntitlementState get officialDownloadGrant => _$officialDownloadGrant;
  EntitlementState get restricted => _$restricted;
  EntitlementState get unknown => _$unknown;
  EntitlementState get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  EntitlementState valueOf(String name) => _$valueOf(name);
  BuiltSet<EntitlementState> get values => _$values;
}

mixin _$EntitlementStateMixin {
  // ignore: non_constant_identifier_names
  _$EntitlementStateMeta get EntitlementState => const _$EntitlementStateMeta();
}

Serializer<EntitlementState> _$entitlementStateSerializer =
    _$EntitlementStateSerializer();

class _$EntitlementStateSerializer
    implements PrimitiveSerializer<EntitlementState> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'publicFree': 'public_free',
    'officialDownloadGrant': 'official_download_grant',
    'restricted': 'restricted',
    'unknown': 'unknown',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'public_free': 'publicFree',
    'official_download_grant': 'officialDownloadGrant',
    'restricted': 'restricted',
    'unknown': 'unknown',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[EntitlementState];
  @override
  final String wireName = 'EntitlementState';

  @override
  Object serialize(Serializers serializers, EntitlementState object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EntitlementState deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EntitlementState.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
