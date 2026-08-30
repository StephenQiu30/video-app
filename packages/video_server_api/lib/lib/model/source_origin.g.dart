// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_origin.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SourceOrigin _$publicUrl = const SourceOrigin._('publicUrl');
const SourceOrigin _$discoveredItem = const SourceOrigin._('discoveredItem');
const SourceOrigin _$officialAsset = const SourceOrigin._('officialAsset');
const SourceOrigin _$verifiedImport = const SourceOrigin._('verifiedImport');
const SourceOrigin _$unknownDefaultOpenApi =
    const SourceOrigin._('unknownDefaultOpenApi');

SourceOrigin _$valueOf(String name) {
  switch (name) {
    case 'publicUrl':
      return _$publicUrl;
    case 'discoveredItem':
      return _$discoveredItem;
    case 'officialAsset':
      return _$officialAsset;
    case 'verifiedImport':
      return _$verifiedImport;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<SourceOrigin> _$values =
    BuiltSet<SourceOrigin>(const <SourceOrigin>[
  _$publicUrl,
  _$discoveredItem,
  _$officialAsset,
  _$verifiedImport,
  _$unknownDefaultOpenApi,
]);

class _$SourceOriginMeta {
  const _$SourceOriginMeta();
  SourceOrigin get publicUrl => _$publicUrl;
  SourceOrigin get discoveredItem => _$discoveredItem;
  SourceOrigin get officialAsset => _$officialAsset;
  SourceOrigin get verifiedImport => _$verifiedImport;
  SourceOrigin get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  SourceOrigin valueOf(String name) => _$valueOf(name);
  BuiltSet<SourceOrigin> get values => _$values;
}

mixin _$SourceOriginMixin {
  // ignore: non_constant_identifier_names
  _$SourceOriginMeta get SourceOrigin => const _$SourceOriginMeta();
}

Serializer<SourceOrigin> _$sourceOriginSerializer = _$SourceOriginSerializer();

class _$SourceOriginSerializer implements PrimitiveSerializer<SourceOrigin> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'publicUrl': 'public_url',
    'discoveredItem': 'discovered_item',
    'officialAsset': 'official_asset',
    'verifiedImport': 'verified_import',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'public_url': 'publicUrl',
    'discovered_item': 'discoveredItem',
    'official_asset': 'officialAsset',
    'verified_import': 'verifiedImport',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[SourceOrigin];
  @override
  final String wireName = 'SourceOrigin';

  @override
  Object serialize(Serializers serializers, SourceOrigin object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SourceOrigin deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SourceOrigin.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
