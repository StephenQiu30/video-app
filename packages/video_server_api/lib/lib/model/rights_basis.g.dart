// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rights_basis.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RightsBasis _$publicAccess = const RightsBasis._('publicAccess');
const RightsBasis _$ownerAuthorizedExport =
    const RightsBasis._('ownerAuthorizedExport');
const RightsBasis _$officialAssetGrant =
    const RightsBasis._('officialAssetGrant');
const RightsBasis _$userProvided = const RightsBasis._('userProvided');
const RightsBasis _$unknownDefaultOpenApi =
    const RightsBasis._('unknownDefaultOpenApi');

RightsBasis _$valueOf(String name) {
  switch (name) {
    case 'publicAccess':
      return _$publicAccess;
    case 'ownerAuthorizedExport':
      return _$ownerAuthorizedExport;
    case 'officialAssetGrant':
      return _$officialAssetGrant;
    case 'userProvided':
      return _$userProvided;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<RightsBasis> _$values =
    BuiltSet<RightsBasis>(const <RightsBasis>[
  _$publicAccess,
  _$ownerAuthorizedExport,
  _$officialAssetGrant,
  _$userProvided,
  _$unknownDefaultOpenApi,
]);

class _$RightsBasisMeta {
  const _$RightsBasisMeta();
  RightsBasis get publicAccess => _$publicAccess;
  RightsBasis get ownerAuthorizedExport => _$ownerAuthorizedExport;
  RightsBasis get officialAssetGrant => _$officialAssetGrant;
  RightsBasis get userProvided => _$userProvided;
  RightsBasis get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  RightsBasis valueOf(String name) => _$valueOf(name);
  BuiltSet<RightsBasis> get values => _$values;
}

mixin _$RightsBasisMixin {
  // ignore: non_constant_identifier_names
  _$RightsBasisMeta get RightsBasis => const _$RightsBasisMeta();
}

Serializer<RightsBasis> _$rightsBasisSerializer = _$RightsBasisSerializer();

class _$RightsBasisSerializer implements PrimitiveSerializer<RightsBasis> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'publicAccess': 'public_access',
    'ownerAuthorizedExport': 'owner_authorized_export',
    'officialAssetGrant': 'official_asset_grant',
    'userProvided': 'user_provided',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'public_access': 'publicAccess',
    'owner_authorized_export': 'ownerAuthorizedExport',
    'official_asset_grant': 'officialAssetGrant',
    'user_provided': 'userProvided',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[RightsBasis];
  @override
  final String wireName = 'RightsBasis';

  @override
  Object serialize(Serializers serializers, RightsBasis object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  RightsBasis deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      RightsBasis.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
