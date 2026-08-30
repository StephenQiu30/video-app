//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'audio_codec_family.g.dart';

class AudioCodecFamily extends EnumClass {
  @BuiltValueEnumConst(wireName: r'aac')
  static const AudioCodecFamily aac = _$aac;
  @BuiltValueEnumConst(wireName: r'opus')
  static const AudioCodecFamily opus = _$opus;
  @BuiltValueEnumConst(wireName: r'vorbis')
  static const AudioCodecFamily vorbis = _$vorbis;
  @BuiltValueEnumConst(wireName: r'other')
  static const AudioCodecFamily other = _$other;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const AudioCodecFamily unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<AudioCodecFamily> get serializer =>
      _$audioCodecFamilySerializer;

  const AudioCodecFamily._(String name) : super(name);

  static BuiltSet<AudioCodecFamily> get values => _$values;
  static AudioCodecFamily valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AudioCodecFamilyMixin = Object with _$AudioCodecFamilyMixin;
