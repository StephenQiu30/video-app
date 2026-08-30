// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compatibility_profile.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CompatibilityProfile _$balanced =
    const CompatibilityProfile._('balanced');
const CompatibilityProfile _$quality = const CompatibilityProfile._('quality');
const CompatibilityProfile _$smallest =
    const CompatibilityProfile._('smallest');
const CompatibilityProfile _$unknownDefaultOpenApi =
    const CompatibilityProfile._('unknownDefaultOpenApi');

CompatibilityProfile _$valueOf(String name) {
  switch (name) {
    case 'balanced':
      return _$balanced;
    case 'quality':
      return _$quality;
    case 'smallest':
      return _$smallest;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<CompatibilityProfile> _$values =
    BuiltSet<CompatibilityProfile>(const <CompatibilityProfile>[
  _$balanced,
  _$quality,
  _$smallest,
  _$unknownDefaultOpenApi,
]);

class _$CompatibilityProfileMeta {
  const _$CompatibilityProfileMeta();
  CompatibilityProfile get balanced => _$balanced;
  CompatibilityProfile get quality => _$quality;
  CompatibilityProfile get smallest => _$smallest;
  CompatibilityProfile get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  CompatibilityProfile valueOf(String name) => _$valueOf(name);
  BuiltSet<CompatibilityProfile> get values => _$values;
}

mixin _$CompatibilityProfileMixin {
  // ignore: non_constant_identifier_names
  _$CompatibilityProfileMeta get CompatibilityProfile =>
      const _$CompatibilityProfileMeta();
}

Serializer<CompatibilityProfile> _$compatibilityProfileSerializer =
    _$CompatibilityProfileSerializer();

class _$CompatibilityProfileSerializer
    implements PrimitiveSerializer<CompatibilityProfile> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'balanced': 'balanced',
    'quality': 'quality',
    'smallest': 'smallest',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'balanced': 'balanced',
    'quality': 'quality',
    'smallest': 'smallest',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[CompatibilityProfile];
  @override
  final String wireName = 'CompatibilityProfile';

  @override
  Object serialize(Serializers serializers, CompatibilityProfile object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CompatibilityProfile deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CompatibilityProfile.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
