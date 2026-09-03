// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_kind.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const MediaKind _$video = const MediaKind._('video');
const MediaKind _$imageGallery = const MediaKind._('imageGallery');
const MediaKind _$videoCollection = const MediaKind._('videoCollection');
const MediaKind _$unknownDefaultOpenApi =
    const MediaKind._('unknownDefaultOpenApi');

MediaKind _$valueOf(String name) {
  switch (name) {
    case 'video':
      return _$video;
    case 'imageGallery':
      return _$imageGallery;
    case 'videoCollection':
      return _$videoCollection;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<MediaKind> _$values = BuiltSet<MediaKind>(const <MediaKind>[
  _$video,
  _$imageGallery,
  _$videoCollection,
  _$unknownDefaultOpenApi,
]);

class _$MediaKindMeta {
  const _$MediaKindMeta();
  MediaKind get video => _$video;
  MediaKind get imageGallery => _$imageGallery;
  MediaKind get videoCollection => _$videoCollection;
  MediaKind get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  MediaKind valueOf(String name) => _$valueOf(name);
  BuiltSet<MediaKind> get values => _$values;
}

mixin _$MediaKindMixin {
  // ignore: non_constant_identifier_names
  _$MediaKindMeta get MediaKind => const _$MediaKindMeta();
}

Serializer<MediaKind> _$mediaKindSerializer = _$MediaKindSerializer();

class _$MediaKindSerializer implements PrimitiveSerializer<MediaKind> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'video': 'video',
    'imageGallery': 'image_gallery',
    'videoCollection': 'video_collection',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'video': 'video',
    'image_gallery': 'imageGallery',
    'video_collection': 'videoCollection',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[MediaKind];
  @override
  final String wireName = 'MediaKind';

  @override
  Object serialize(Serializers serializers, MediaKind object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  MediaKind deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      MediaKind.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
