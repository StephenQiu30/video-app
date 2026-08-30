// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fps_bucket.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const FpsBucket _$fps30 = const FpsBucket._('fps30');
const FpsBucket _$fps60 = const FpsBucket._('fps60');
const FpsBucket _$above60 = const FpsBucket._('above60');
const FpsBucket _$unknownDefaultOpenApi =
    const FpsBucket._('unknownDefaultOpenApi');

FpsBucket _$valueOf(String name) {
  switch (name) {
    case 'fps30':
      return _$fps30;
    case 'fps60':
      return _$fps60;
    case 'above60':
      return _$above60;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<FpsBucket> _$values = BuiltSet<FpsBucket>(const <FpsBucket>[
  _$fps30,
  _$fps60,
  _$above60,
  _$unknownDefaultOpenApi,
]);

class _$FpsBucketMeta {
  const _$FpsBucketMeta();
  FpsBucket get fps30 => _$fps30;
  FpsBucket get fps60 => _$fps60;
  FpsBucket get above60 => _$above60;
  FpsBucket get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  FpsBucket valueOf(String name) => _$valueOf(name);
  BuiltSet<FpsBucket> get values => _$values;
}

mixin _$FpsBucketMixin {
  // ignore: non_constant_identifier_names
  _$FpsBucketMeta get FpsBucket => const _$FpsBucketMeta();
}

Serializer<FpsBucket> _$fpsBucketSerializer = _$FpsBucketSerializer();

class _$FpsBucketSerializer implements PrimitiveSerializer<FpsBucket> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'fps30': 'fps_30',
    'fps60': 'fps_60',
    'above60': 'above_60',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'fps_30': 'fps30',
    'fps_60': 'fps60',
    'above_60': 'above60',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[FpsBucket];
  @override
  final String wireName = 'FpsBucket';

  @override
  Object serialize(Serializers serializers, FpsBucket object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  FpsBucket deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FpsBucket.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
