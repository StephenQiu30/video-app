// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_codec_family.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const VideoCodecFamily _$h264 = const VideoCodecFamily._('h264');
const VideoCodecFamily _$hevc = const VideoCodecFamily._('hevc');
const VideoCodecFamily _$vp9 = const VideoCodecFamily._('vp9');
const VideoCodecFamily _$av1 = const VideoCodecFamily._('av1');
const VideoCodecFamily _$other = const VideoCodecFamily._('other');
const VideoCodecFamily _$unknownDefaultOpenApi =
    const VideoCodecFamily._('unknownDefaultOpenApi');

VideoCodecFamily _$valueOf(String name) {
  switch (name) {
    case 'h264':
      return _$h264;
    case 'hevc':
      return _$hevc;
    case 'vp9':
      return _$vp9;
    case 'av1':
      return _$av1;
    case 'other':
      return _$other;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<VideoCodecFamily> _$values =
    BuiltSet<VideoCodecFamily>(const <VideoCodecFamily>[
  _$h264,
  _$hevc,
  _$vp9,
  _$av1,
  _$other,
  _$unknownDefaultOpenApi,
]);

class _$VideoCodecFamilyMeta {
  const _$VideoCodecFamilyMeta();
  VideoCodecFamily get h264 => _$h264;
  VideoCodecFamily get hevc => _$hevc;
  VideoCodecFamily get vp9 => _$vp9;
  VideoCodecFamily get av1 => _$av1;
  VideoCodecFamily get other => _$other;
  VideoCodecFamily get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  VideoCodecFamily valueOf(String name) => _$valueOf(name);
  BuiltSet<VideoCodecFamily> get values => _$values;
}

mixin _$VideoCodecFamilyMixin {
  // ignore: non_constant_identifier_names
  _$VideoCodecFamilyMeta get VideoCodecFamily => const _$VideoCodecFamilyMeta();
}

Serializer<VideoCodecFamily> _$videoCodecFamilySerializer =
    _$VideoCodecFamilySerializer();

class _$VideoCodecFamilySerializer
    implements PrimitiveSerializer<VideoCodecFamily> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'h264': 'h264',
    'hevc': 'hevc',
    'vp9': 'vp9',
    'av1': 'av1',
    'other': 'other',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'h264': 'h264',
    'hevc': 'hevc',
    'vp9': 'vp9',
    'av1': 'av1',
    'other': 'other',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[VideoCodecFamily];
  @override
  final String wireName = 'VideoCodecFamily';

  @override
  Object serialize(Serializers serializers, VideoCodecFamily object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  VideoCodecFamily deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      VideoCodecFamily.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
