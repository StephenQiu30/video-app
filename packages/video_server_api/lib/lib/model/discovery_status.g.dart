// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DiscoveryStatus _$ready = const DiscoveryStatus._('ready');
const DiscoveryStatus _$empty = const DiscoveryStatus._('empty');
const DiscoveryStatus _$unknownDefaultOpenApi =
    const DiscoveryStatus._('unknownDefaultOpenApi');

DiscoveryStatus _$valueOf(String name) {
  switch (name) {
    case 'ready':
      return _$ready;
    case 'empty':
      return _$empty;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<DiscoveryStatus> _$values =
    BuiltSet<DiscoveryStatus>(const <DiscoveryStatus>[
  _$ready,
  _$empty,
  _$unknownDefaultOpenApi,
]);

class _$DiscoveryStatusMeta {
  const _$DiscoveryStatusMeta();
  DiscoveryStatus get ready => _$ready;
  DiscoveryStatus get empty => _$empty;
  DiscoveryStatus get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  DiscoveryStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<DiscoveryStatus> get values => _$values;
}

mixin _$DiscoveryStatusMixin {
  // ignore: non_constant_identifier_names
  _$DiscoveryStatusMeta get DiscoveryStatus => const _$DiscoveryStatusMeta();
}

Serializer<DiscoveryStatus> _$discoveryStatusSerializer =
    _$DiscoveryStatusSerializer();

class _$DiscoveryStatusSerializer
    implements PrimitiveSerializer<DiscoveryStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ready': 'ready',
    'empty': 'empty',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ready': 'ready',
    'empty': 'empty',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[DiscoveryStatus];
  @override
  final String wireName = 'DiscoveryStatus';

  @override
  Object serialize(Serializers serializers, DiscoveryStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DiscoveryStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DiscoveryStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
