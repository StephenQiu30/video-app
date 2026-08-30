// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_codec_family.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AudioCodecFamily _$aac = const AudioCodecFamily._('aac');
const AudioCodecFamily _$opus = const AudioCodecFamily._('opus');
const AudioCodecFamily _$vorbis = const AudioCodecFamily._('vorbis');
const AudioCodecFamily _$other = const AudioCodecFamily._('other');
const AudioCodecFamily _$unknownDefaultOpenApi =
    const AudioCodecFamily._('unknownDefaultOpenApi');

AudioCodecFamily _$valueOf(String name) {
  switch (name) {
    case 'aac':
      return _$aac;
    case 'opus':
      return _$opus;
    case 'vorbis':
      return _$vorbis;
    case 'other':
      return _$other;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<AudioCodecFamily> _$values =
    BuiltSet<AudioCodecFamily>(const <AudioCodecFamily>[
  _$aac,
  _$opus,
  _$vorbis,
  _$other,
  _$unknownDefaultOpenApi,
]);

class _$AudioCodecFamilyMeta {
  const _$AudioCodecFamilyMeta();
  AudioCodecFamily get aac => _$aac;
  AudioCodecFamily get opus => _$opus;
  AudioCodecFamily get vorbis => _$vorbis;
  AudioCodecFamily get other => _$other;
  AudioCodecFamily get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  AudioCodecFamily valueOf(String name) => _$valueOf(name);
  BuiltSet<AudioCodecFamily> get values => _$values;
}

mixin _$AudioCodecFamilyMixin {
  // ignore: non_constant_identifier_names
  _$AudioCodecFamilyMeta get AudioCodecFamily => const _$AudioCodecFamilyMeta();
}

Serializer<AudioCodecFamily> _$audioCodecFamilySerializer =
    _$AudioCodecFamilySerializer();

class _$AudioCodecFamilySerializer
    implements PrimitiveSerializer<AudioCodecFamily> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'aac': 'aac',
    'opus': 'opus',
    'vorbis': 'vorbis',
    'other': 'other',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'aac': 'aac',
    'opus': 'opus',
    'vorbis': 'vorbis',
    'other': 'other',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[AudioCodecFamily];
  @override
  final String wireName = 'AudioCodecFamily';

  @override
  Object serialize(Serializers serializers, AudioCodecFamily object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AudioCodecFamily deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AudioCodecFamily.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
