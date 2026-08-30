// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_range.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DynamicRange _$sdr = const DynamicRange._('sdr');
const DynamicRange _$hdr = const DynamicRange._('hdr');
const DynamicRange _$unknownDefaultOpenApi =
    const DynamicRange._('unknownDefaultOpenApi');

DynamicRange _$valueOf(String name) {
  switch (name) {
    case 'sdr':
      return _$sdr;
    case 'hdr':
      return _$hdr;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<DynamicRange> _$values =
    BuiltSet<DynamicRange>(const <DynamicRange>[
  _$sdr,
  _$hdr,
  _$unknownDefaultOpenApi,
]);

class _$DynamicRangeMeta {
  const _$DynamicRangeMeta();
  DynamicRange get sdr => _$sdr;
  DynamicRange get hdr => _$hdr;
  DynamicRange get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  DynamicRange valueOf(String name) => _$valueOf(name);
  BuiltSet<DynamicRange> get values => _$values;
}

mixin _$DynamicRangeMixin {
  // ignore: non_constant_identifier_names
  _$DynamicRangeMeta get DynamicRange => const _$DynamicRangeMeta();
}

Serializer<DynamicRange> _$dynamicRangeSerializer = _$DynamicRangeSerializer();

class _$DynamicRangeSerializer implements PrimitiveSerializer<DynamicRange> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'sdr': 'sdr',
    'hdr': 'hdr',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'sdr': 'sdr',
    'hdr': 'hdr',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[DynamicRange];
  @override
  final String wireName = 'DynamicRange';

  @override
  Object serialize(Serializers serializers, DynamicRange object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DynamicRange deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DynamicRange.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
