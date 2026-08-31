//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'identity_state.g.dart';

class IdentityState extends EnumClass {
  @BuiltValueEnumConst(wireName: r'verified')
  static const IdentityState verified = _$verified;
  @BuiltValueEnumConst(wireName: r'ambiguous')
  static const IdentityState ambiguous = _$ambiguous;
  @BuiltValueEnumConst(wireName: r'unknown')
  static const IdentityState unknown = _$unknown;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const IdentityState unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<IdentityState> get serializer => _$identityStateSerializer;

  const IdentityState._(String name) : super(name);

  static BuiltSet<IdentityState> get values => _$values;
  static IdentityState valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class IdentityStateMixin = Object with _$IdentityStateMixin;
