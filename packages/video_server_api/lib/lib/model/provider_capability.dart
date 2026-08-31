//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'provider_capability.g.dart';

class ProviderCapability extends EnumClass {
  @BuiltValueEnumConst(wireName: r'single_video')
  static const ProviderCapability singleVideo = _$singleVideo;
  @BuiltValueEnumConst(wireName: r'short_video')
  static const ProviderCapability shortVideo = _$shortVideo;
  @BuiltValueEnumConst(wireName: r'clip_or_vod')
  static const ProviderCapability clipOrVod = _$clipOrVod;
  @BuiltValueEnumConst(wireName: r'audio_video_split')
  static const ProviderCapability audioVideoSplit = _$audioVideoSplit;
  @BuiltValueEnumConst(wireName: r'subtitles')
  static const ProviderCapability subtitles = _$subtitles;
  @BuiltValueEnumConst(wireName: r'image_or_carousel')
  static const ProviderCapability imageOrCarousel = _$imageOrCarousel;
  @BuiltValueEnumConst(wireName: r'live')
  static const ProviderCapability live = _$live;
  @BuiltValueEnumConst(wireName: r'playlist')
  static const ProviderCapability playlist = _$playlist;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ProviderCapability unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<ProviderCapability> get serializer =>
      _$providerCapabilitySerializer;

  const ProviderCapability._(String name) : super(name);

  static BuiltSet<ProviderCapability> get values => _$values;
  static ProviderCapability valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ProviderCapabilityMixin = Object with _$ProviderCapabilityMixin;
