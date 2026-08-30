//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dynamic_range.g.dart';

class DynamicRange extends EnumClass {
  @BuiltValueEnumConst(wireName: r'sdr')
  static const DynamicRange sdr = _$sdr;
  @BuiltValueEnumConst(wireName: r'hdr')
  static const DynamicRange hdr = _$hdr;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DynamicRange unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<DynamicRange> get serializer => _$dynamicRangeSerializer;

  const DynamicRange._(String name) : super(name);

  static BuiltSet<DynamicRange> get values => _$values;
  static DynamicRange valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DynamicRangeMixin = Object with _$DynamicRangeMixin;
