//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'discovery_decision_hint.g.dart';

class DiscoveryDecisionHint extends EnumClass {
  @BuiltValueEnumConst(wireName: r'candidate')
  static const DiscoveryDecisionHint candidate = _$candidate;
  @BuiltValueEnumConst(wireName: r'export_required')
  static const DiscoveryDecisionHint exportRequired = _$exportRequired;
  @BuiltValueEnumConst(wireName: r'unsupported')
  static const DiscoveryDecisionHint unsupported = _$unsupported;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DiscoveryDecisionHint unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<DiscoveryDecisionHint> get serializer =>
      _$discoveryDecisionHintSerializer;

  const DiscoveryDecisionHint._(String name) : super(name);

  static BuiltSet<DiscoveryDecisionHint> get values => _$values;
  static DiscoveryDecisionHint valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DiscoveryDecisionHintMixin = Object
    with _$DiscoveryDecisionHintMixin;
