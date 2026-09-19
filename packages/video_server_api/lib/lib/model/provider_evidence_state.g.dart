// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_evidence_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProviderEvidenceState _$missing =
    const ProviderEvidenceState._('missing');
const ProviderEvidenceState _$stale = const ProviderEvidenceState._('stale');
const ProviderEvidenceState _$fresh = const ProviderEvidenceState._('fresh');
const ProviderEvidenceState _$unknownDefaultOpenApi =
    const ProviderEvidenceState._('unknownDefaultOpenApi');

ProviderEvidenceState _$valueOf(String name) {
  switch (name) {
    case 'missing':
      return _$missing;
    case 'stale':
      return _$stale;
    case 'fresh':
      return _$fresh;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<ProviderEvidenceState> _$values =
    BuiltSet<ProviderEvidenceState>(const <ProviderEvidenceState>[
  _$missing,
  _$stale,
  _$fresh,
  _$unknownDefaultOpenApi,
]);

class _$ProviderEvidenceStateMeta {
  const _$ProviderEvidenceStateMeta();
  ProviderEvidenceState get missing => _$missing;
  ProviderEvidenceState get stale => _$stale;
  ProviderEvidenceState get fresh => _$fresh;
  ProviderEvidenceState get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  ProviderEvidenceState valueOf(String name) => _$valueOf(name);
  BuiltSet<ProviderEvidenceState> get values => _$values;
}

mixin _$ProviderEvidenceStateMixin {
  // ignore: non_constant_identifier_names
  _$ProviderEvidenceStateMeta get ProviderEvidenceState =>
      const _$ProviderEvidenceStateMeta();
}

Serializer<ProviderEvidenceState> _$providerEvidenceStateSerializer =
    _$ProviderEvidenceStateSerializer();

class _$ProviderEvidenceStateSerializer
    implements PrimitiveSerializer<ProviderEvidenceState> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'missing': 'missing',
    'stale': 'stale',
    'fresh': 'fresh',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'missing': 'missing',
    'stale': 'stale',
    'fresh': 'fresh',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ProviderEvidenceState];
  @override
  final String wireName = 'ProviderEvidenceState';

  @override
  Object serialize(Serializers serializers, ProviderEvidenceState object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ProviderEvidenceState deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProviderEvidenceState.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
