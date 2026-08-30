//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'video_codec_family.g.dart';

class VideoCodecFamily extends EnumClass {
  @BuiltValueEnumConst(wireName: r'h264')
  static const VideoCodecFamily h264 = _$h264;
  @BuiltValueEnumConst(wireName: r'hevc')
  static const VideoCodecFamily hevc = _$hevc;
  @BuiltValueEnumConst(wireName: r'vp9')
  static const VideoCodecFamily vp9 = _$vp9;
  @BuiltValueEnumConst(wireName: r'av1')
  static const VideoCodecFamily av1 = _$av1;
  @BuiltValueEnumConst(wireName: r'other')
  static const VideoCodecFamily other = _$other;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const VideoCodecFamily unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<VideoCodecFamily> get serializer =>
      _$videoCodecFamilySerializer;

  const VideoCodecFamily._(String name) : super(name);

  static BuiltSet<VideoCodecFamily> get values => _$values;
  static VideoCodecFamily valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class VideoCodecFamilyMixin = Object with _$VideoCodecFamilyMixin;
