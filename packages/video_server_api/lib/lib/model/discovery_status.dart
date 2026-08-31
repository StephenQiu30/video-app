//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'discovery_status.g.dart';

class DiscoveryStatus extends EnumClass {
  @BuiltValueEnumConst(wireName: r'ready')
  static const DiscoveryStatus ready = _$ready;
  @BuiltValueEnumConst(wireName: r'empty')
  static const DiscoveryStatus empty = _$empty;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DiscoveryStatus unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<DiscoveryStatus> get serializer =>
      _$discoveryStatusSerializer;

  const DiscoveryStatus._(String name) : super(name);

  static BuiltSet<DiscoveryStatus> get values => _$values;
  static DiscoveryStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DiscoveryStatusMixin = Object with _$DiscoveryStatusMixin;
