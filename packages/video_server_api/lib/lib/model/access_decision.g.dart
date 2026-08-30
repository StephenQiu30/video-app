// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_decision.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AccessDecision _$downloadable = const AccessDecision._('downloadable');
const AccessDecision _$playbackOnly = const AccessDecision._('playbackOnly');
const AccessDecision _$exportRequired =
    const AccessDecision._('exportRequired');
const AccessDecision _$blocked = const AccessDecision._('blocked');
const AccessDecision _$unsupported = const AccessDecision._('unsupported');
const AccessDecision _$unknownDefaultOpenApi =
    const AccessDecision._('unknownDefaultOpenApi');

AccessDecision _$valueOf(String name) {
  switch (name) {
    case 'downloadable':
      return _$downloadable;
    case 'playbackOnly':
      return _$playbackOnly;
    case 'exportRequired':
      return _$exportRequired;
    case 'blocked':
      return _$blocked;
    case 'unsupported':
      return _$unsupported;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<AccessDecision> _$values =
    BuiltSet<AccessDecision>(const <AccessDecision>[
  _$downloadable,
  _$playbackOnly,
  _$exportRequired,
  _$blocked,
  _$unsupported,
  _$unknownDefaultOpenApi,
]);

class _$AccessDecisionMeta {
  const _$AccessDecisionMeta();
  AccessDecision get downloadable => _$downloadable;
  AccessDecision get playbackOnly => _$playbackOnly;
  AccessDecision get exportRequired => _$exportRequired;
  AccessDecision get blocked => _$blocked;
  AccessDecision get unsupported => _$unsupported;
  AccessDecision get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  AccessDecision valueOf(String name) => _$valueOf(name);
  BuiltSet<AccessDecision> get values => _$values;
}

mixin _$AccessDecisionMixin {
  // ignore: non_constant_identifier_names
  _$AccessDecisionMeta get AccessDecision => const _$AccessDecisionMeta();
}

Serializer<AccessDecision> _$accessDecisionSerializer =
    _$AccessDecisionSerializer();

class _$AccessDecisionSerializer
    implements PrimitiveSerializer<AccessDecision> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'downloadable': 'downloadable',
    'playbackOnly': 'playback_only',
    'exportRequired': 'export_required',
    'blocked': 'blocked',
    'unsupported': 'unsupported',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'downloadable': 'downloadable',
    'playback_only': 'playbackOnly',
    'export_required': 'exportRequired',
    'blocked': 'blocked',
    'unsupported': 'unsupported',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[AccessDecision];
  @override
  final String wireName = 'AccessDecision';

  @override
  Object serialize(Serializers serializers, AccessDecision object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AccessDecision deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AccessDecision.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
