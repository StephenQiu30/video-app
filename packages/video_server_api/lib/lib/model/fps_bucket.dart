//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'fps_bucket.g.dart';

class FpsBucket extends EnumClass {
  @BuiltValueEnumConst(wireName: r'fps_30')
  static const FpsBucket fps30 = _$fps30;
  @BuiltValueEnumConst(wireName: r'fps_60')
  static const FpsBucket fps60 = _$fps60;
  @BuiltValueEnumConst(wireName: r'above_60')
  static const FpsBucket above60 = _$above60;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const FpsBucket unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<FpsBucket> get serializer => _$fpsBucketSerializer;

  const FpsBucket._(String name) : super(name);

  static BuiltSet<FpsBucket> get values => _$values;
  static FpsBucket valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class FpsBucketMixin = Object with _$FpsBucketMixin;
