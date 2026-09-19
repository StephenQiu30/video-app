//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'provider_evidence_state.g.dart';

class ProviderEvidenceState extends EnumClass {
  @BuiltValueEnumConst(wireName: r'missing')
  static const ProviderEvidenceState missing = _$missing;
  @BuiltValueEnumConst(wireName: r'stale')
  static const ProviderEvidenceState stale = _$stale;
  @BuiltValueEnumConst(wireName: r'fresh')
  static const ProviderEvidenceState fresh = _$fresh;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ProviderEvidenceState unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<ProviderEvidenceState> get serializer =>
      _$providerEvidenceStateSerializer;

  const ProviderEvidenceState._(String name) : super(name);

  static BuiltSet<ProviderEvidenceState> get values => _$values;
  static ProviderEvidenceState valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ProviderEvidenceStateMixin = Object
    with _$ProviderEvidenceStateMixin;
