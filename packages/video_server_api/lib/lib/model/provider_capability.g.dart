// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_capability.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProviderCapability _$singleVideo =
    const ProviderCapability._('singleVideo');
const ProviderCapability _$shortVideo =
    const ProviderCapability._('shortVideo');
const ProviderCapability _$clipOrVod = const ProviderCapability._('clipOrVod');
const ProviderCapability _$audioVideoSplit =
    const ProviderCapability._('audioVideoSplit');
const ProviderCapability _$subtitles = const ProviderCapability._('subtitles');
const ProviderCapability _$imageOrCarousel =
    const ProviderCapability._('imageOrCarousel');
const ProviderCapability _$live = const ProviderCapability._('live');
const ProviderCapability _$playlist = const ProviderCapability._('playlist');
const ProviderCapability _$unknownDefaultOpenApi =
    const ProviderCapability._('unknownDefaultOpenApi');

ProviderCapability _$valueOf(String name) {
  switch (name) {
    case 'singleVideo':
      return _$singleVideo;
    case 'shortVideo':
      return _$shortVideo;
    case 'clipOrVod':
      return _$clipOrVod;
    case 'audioVideoSplit':
      return _$audioVideoSplit;
    case 'subtitles':
      return _$subtitles;
    case 'imageOrCarousel':
      return _$imageOrCarousel;
    case 'live':
      return _$live;
    case 'playlist':
      return _$playlist;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<ProviderCapability> _$values =
    BuiltSet<ProviderCapability>(const <ProviderCapability>[
  _$singleVideo,
  _$shortVideo,
  _$clipOrVod,
  _$audioVideoSplit,
  _$subtitles,
  _$imageOrCarousel,
  _$live,
  _$playlist,
  _$unknownDefaultOpenApi,
]);

class _$ProviderCapabilityMeta {
  const _$ProviderCapabilityMeta();
  ProviderCapability get singleVideo => _$singleVideo;
  ProviderCapability get shortVideo => _$shortVideo;
  ProviderCapability get clipOrVod => _$clipOrVod;
  ProviderCapability get audioVideoSplit => _$audioVideoSplit;
  ProviderCapability get subtitles => _$subtitles;
  ProviderCapability get imageOrCarousel => _$imageOrCarousel;
  ProviderCapability get live => _$live;
  ProviderCapability get playlist => _$playlist;
  ProviderCapability get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  ProviderCapability valueOf(String name) => _$valueOf(name);
  BuiltSet<ProviderCapability> get values => _$values;
}

mixin _$ProviderCapabilityMixin {
  // ignore: non_constant_identifier_names
  _$ProviderCapabilityMeta get ProviderCapability =>
      const _$ProviderCapabilityMeta();
}

Serializer<ProviderCapability> _$providerCapabilitySerializer =
    _$ProviderCapabilitySerializer();

class _$ProviderCapabilitySerializer
    implements PrimitiveSerializer<ProviderCapability> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'singleVideo': 'single_video',
    'shortVideo': 'short_video',
    'clipOrVod': 'clip_or_vod',
    'audioVideoSplit': 'audio_video_split',
    'subtitles': 'subtitles',
    'imageOrCarousel': 'image_or_carousel',
    'live': 'live',
    'playlist': 'playlist',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'single_video': 'singleVideo',
    'short_video': 'shortVideo',
    'clip_or_vod': 'clipOrVod',
    'audio_video_split': 'audioVideoSplit',
    'subtitles': 'subtitles',
    'image_or_carousel': 'imageOrCarousel',
    'live': 'live',
    'playlist': 'playlist',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ProviderCapability];
  @override
  final String wireName = 'ProviderCapability';

  @override
  Object serialize(Serializers serializers, ProviderCapability object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ProviderCapability deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProviderCapability.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
