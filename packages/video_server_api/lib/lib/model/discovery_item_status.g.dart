// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_item_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DiscoveryItemStatus _$ready = const DiscoveryItemStatus._('ready');
const DiscoveryItemStatus _$identityUnverified =
    const DiscoveryItemStatus._('identityUnverified');
const DiscoveryItemStatus _$unknownDefaultOpenApi =
    const DiscoveryItemStatus._('unknownDefaultOpenApi');

DiscoveryItemStatus _$valueOf(String name) {
  switch (name) {
    case 'ready':
      return _$ready;
    case 'identityUnverified':
      return _$identityUnverified;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<DiscoveryItemStatus> _$values =
    BuiltSet<DiscoveryItemStatus>(const <DiscoveryItemStatus>[
  _$ready,
  _$identityUnverified,
  _$unknownDefaultOpenApi,
]);

class _$DiscoveryItemStatusMeta {
  const _$DiscoveryItemStatusMeta();
  DiscoveryItemStatus get ready => _$ready;
  DiscoveryItemStatus get identityUnverified => _$identityUnverified;
  DiscoveryItemStatus get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  DiscoveryItemStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<DiscoveryItemStatus> get values => _$values;
}

mixin _$DiscoveryItemStatusMixin {
  // ignore: non_constant_identifier_names
  _$DiscoveryItemStatusMeta get DiscoveryItemStatus =>
      const _$DiscoveryItemStatusMeta();
}

Serializer<DiscoveryItemStatus> _$discoveryItemStatusSerializer =
    _$DiscoveryItemStatusSerializer();

class _$DiscoveryItemStatusSerializer
    implements PrimitiveSerializer<DiscoveryItemStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ready': 'ready',
    'identityUnverified': 'identity_unverified',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ready': 'ready',
    'identity_unverified': 'identityUnverified',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[DiscoveryItemStatus];
  @override
  final String wireName = 'DiscoveryItemStatus';

  @override
  Object serialize(Serializers serializers, DiscoveryItemStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DiscoveryItemStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DiscoveryItemStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
