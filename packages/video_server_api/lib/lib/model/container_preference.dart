//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'container_preference.g.dart';

class ContainerPreference extends EnumClass {
  @BuiltValueEnumConst(wireName: r'mp4')
  static const ContainerPreference mp4 = _$mp4;
  @BuiltValueEnumConst(wireName: r'webm')
  static const ContainerPreference webm = _$webm;
  @BuiltValueEnumConst(wireName: r'source')
  static const ContainerPreference source_ = _$source_;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ContainerPreference unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<ContainerPreference> get serializer =>
      _$containerPreferenceSerializer;

  const ContainerPreference._(String name) : super(name);

  static BuiltSet<ContainerPreference> get values => _$values;
  static ContainerPreference valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ContainerPreferenceMixin = Object
    with _$ContainerPreferenceMixin;
