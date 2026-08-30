// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_decision_hint.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DiscoveryDecisionHint _$candidate =
    const DiscoveryDecisionHint._('candidate');
const DiscoveryDecisionHint _$exportRequired =
    const DiscoveryDecisionHint._('exportRequired');
const DiscoveryDecisionHint _$unsupported =
    const DiscoveryDecisionHint._('unsupported');
const DiscoveryDecisionHint _$unknownDefaultOpenApi =
    const DiscoveryDecisionHint._('unknownDefaultOpenApi');

DiscoveryDecisionHint _$valueOf(String name) {
  switch (name) {
    case 'candidate':
      return _$candidate;
    case 'exportRequired':
      return _$exportRequired;
    case 'unsupported':
      return _$unsupported;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<DiscoveryDecisionHint> _$values =
    BuiltSet<DiscoveryDecisionHint>(const <DiscoveryDecisionHint>[
  _$candidate,
  _$exportRequired,
  _$unsupported,
  _$unknownDefaultOpenApi,
]);

class _$DiscoveryDecisionHintMeta {
  const _$DiscoveryDecisionHintMeta();
  DiscoveryDecisionHint get candidate => _$candidate;
  DiscoveryDecisionHint get exportRequired => _$exportRequired;
  DiscoveryDecisionHint get unsupported => _$unsupported;
  DiscoveryDecisionHint get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  DiscoveryDecisionHint valueOf(String name) => _$valueOf(name);
  BuiltSet<DiscoveryDecisionHint> get values => _$values;
}

mixin _$DiscoveryDecisionHintMixin {
  // ignore: non_constant_identifier_names
  _$DiscoveryDecisionHintMeta get DiscoveryDecisionHint =>
      const _$DiscoveryDecisionHintMeta();
}

Serializer<DiscoveryDecisionHint> _$discoveryDecisionHintSerializer =
    _$DiscoveryDecisionHintSerializer();

class _$DiscoveryDecisionHintSerializer
    implements PrimitiveSerializer<DiscoveryDecisionHint> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'candidate': 'candidate',
    'exportRequired': 'export_required',
    'unsupported': 'unsupported',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'candidate': 'candidate',
    'export_required': 'exportRequired',
    'unsupported': 'unsupported',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[DiscoveryDecisionHint];
  @override
  final String wireName = 'DiscoveryDecisionHint';

  @override
  Object serialize(Serializers serializers, DiscoveryDecisionHint object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DiscoveryDecisionHint deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DiscoveryDecisionHint.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
