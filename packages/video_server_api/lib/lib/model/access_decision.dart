//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'access_decision.g.dart';

class AccessDecision extends EnumClass {
  @BuiltValueEnumConst(wireName: r'downloadable')
  static const AccessDecision downloadable = _$downloadable;
  @BuiltValueEnumConst(wireName: r'playback_only')
  static const AccessDecision playbackOnly = _$playbackOnly;
  @BuiltValueEnumConst(wireName: r'export_required')
  static const AccessDecision exportRequired = _$exportRequired;
  @BuiltValueEnumConst(wireName: r'blocked')
  static const AccessDecision blocked = _$blocked;
  @BuiltValueEnumConst(wireName: r'unsupported')
  static const AccessDecision unsupported = _$unsupported;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const AccessDecision unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<AccessDecision> get serializer =>
      _$accessDecisionSerializer;

  const AccessDecision._(String name) : super(name);

  static BuiltSet<AccessDecision> get values => _$values;
  static AccessDecision valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AccessDecisionMixin = Object with _$AccessDecisionMixin;
