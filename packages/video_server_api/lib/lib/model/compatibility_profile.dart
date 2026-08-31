//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'compatibility_profile.g.dart';

class CompatibilityProfile extends EnumClass {
  @BuiltValueEnumConst(wireName: r'balanced')
  static const CompatibilityProfile balanced = _$balanced;
  @BuiltValueEnumConst(wireName: r'quality')
  static const CompatibilityProfile quality = _$quality;
  @BuiltValueEnumConst(wireName: r'smallest')
  static const CompatibilityProfile smallest = _$smallest;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const CompatibilityProfile unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<CompatibilityProfile> get serializer =>
      _$compatibilityProfileSerializer;

  const CompatibilityProfile._(String name) : super(name);

  static BuiltSet<CompatibilityProfile> get values => _$values;
  static CompatibilityProfile valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class CompatibilityProfileMixin = Object
    with _$CompatibilityProfileMixin;
