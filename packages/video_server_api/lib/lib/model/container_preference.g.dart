// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container_preference.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ContainerPreference _$mp4 = const ContainerPreference._('mp4');
const ContainerPreference _$webm = const ContainerPreference._('webm');
const ContainerPreference _$source_ = const ContainerPreference._('source_');
const ContainerPreference _$unknownDefaultOpenApi =
    const ContainerPreference._('unknownDefaultOpenApi');

ContainerPreference _$valueOf(String name) {
  switch (name) {
    case 'mp4':
      return _$mp4;
    case 'webm':
      return _$webm;
    case 'source_':
      return _$source_;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<ContainerPreference> _$values =
    BuiltSet<ContainerPreference>(const <ContainerPreference>[
  _$mp4,
  _$webm,
  _$source_,
  _$unknownDefaultOpenApi,
]);

class _$ContainerPreferenceMeta {
  const _$ContainerPreferenceMeta();
  ContainerPreference get mp4 => _$mp4;
  ContainerPreference get webm => _$webm;
  ContainerPreference get source_ => _$source_;
  ContainerPreference get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  ContainerPreference valueOf(String name) => _$valueOf(name);
  BuiltSet<ContainerPreference> get values => _$values;
}

mixin _$ContainerPreferenceMixin {
  // ignore: non_constant_identifier_names
  _$ContainerPreferenceMeta get ContainerPreference =>
      const _$ContainerPreferenceMeta();
}

Serializer<ContainerPreference> _$containerPreferenceSerializer =
    _$ContainerPreferenceSerializer();

class _$ContainerPreferenceSerializer
    implements PrimitiveSerializer<ContainerPreference> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'mp4': 'mp4',
    'webm': 'webm',
    'source_': 'source',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'mp4': 'mp4',
    'webm': 'webm',
    'source': 'source_',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ContainerPreference];
  @override
  final String wireName = 'ContainerPreference';

  @override
  Object serialize(Serializers serializers, ContainerPreference object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ContainerPreference deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ContainerPreference.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
