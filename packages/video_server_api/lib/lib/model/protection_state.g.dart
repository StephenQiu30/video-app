// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protection_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProtectionState _$clear = const ProtectionState._('clear');
const ProtectionState _$encrypted = const ProtectionState._('encrypted');
const ProtectionState _$drm = const ProtectionState._('drm');
const ProtectionState _$unknown = const ProtectionState._('unknown');
const ProtectionState _$unknownDefaultOpenApi =
    const ProtectionState._('unknownDefaultOpenApi');

ProtectionState _$valueOf(String name) {
  switch (name) {
    case 'clear':
      return _$clear;
    case 'encrypted':
      return _$encrypted;
    case 'drm':
      return _$drm;
    case 'unknown':
      return _$unknown;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<ProtectionState> _$values =
    BuiltSet<ProtectionState>(const <ProtectionState>[
  _$clear,
  _$encrypted,
  _$drm,
  _$unknown,
  _$unknownDefaultOpenApi,
]);

class _$ProtectionStateMeta {
  const _$ProtectionStateMeta();
  ProtectionState get clear => _$clear;
  ProtectionState get encrypted => _$encrypted;
  ProtectionState get drm => _$drm;
  ProtectionState get unknown => _$unknown;
  ProtectionState get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  ProtectionState valueOf(String name) => _$valueOf(name);
  BuiltSet<ProtectionState> get values => _$values;
}

mixin _$ProtectionStateMixin {
  // ignore: non_constant_identifier_names
  _$ProtectionStateMeta get ProtectionState => const _$ProtectionStateMeta();
}

Serializer<ProtectionState> _$protectionStateSerializer =
    _$ProtectionStateSerializer();

class _$ProtectionStateSerializer
    implements PrimitiveSerializer<ProtectionState> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'clear': 'clear',
    'encrypted': 'encrypted',
    'drm': 'drm',
    'unknown': 'unknown',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'clear': 'clear',
    'encrypted': 'encrypted',
    'drm': 'drm',
    'unknown': 'unknown',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ProtectionState];
  @override
  final String wireName = 'ProtectionState';

  @override
  Object serialize(Serializers serializers, ProtectionState object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ProtectionState deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProtectionState.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
