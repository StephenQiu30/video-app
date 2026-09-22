//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'provider_access_mode.g.dart';

class ProviderAccessMode extends EnumClass {
  /// Privilege boundary for one provider operation.  GUEST may use automatically maintained visitor material but has no account entitlement. OPERATOR_MANAGED is the only account-bearing mode.
  @BuiltValueEnumConst(wireName: r'anonymous')
  static const ProviderAccessMode anonymous = _$anonymous;

  /// Privilege boundary for one provider operation.  GUEST may use automatically maintained visitor material but has no account entitlement. OPERATOR_MANAGED is the only account-bearing mode.
  @BuiltValueEnumConst(wireName: r'guest')
  static const ProviderAccessMode guest = _$guest;

  /// Privilege boundary for one provider operation.  GUEST may use automatically maintained visitor material but has no account entitlement. OPERATOR_MANAGED is the only account-bearing mode.
  @BuiltValueEnumConst(wireName: r'operator_managed')
  static const ProviderAccessMode operatorManaged = _$operatorManaged;

  /// Privilege boundary for one provider operation.  GUEST may use automatically maintained visitor material but has no account entitlement. OPERATOR_MANAGED is the only account-bearing mode.
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ProviderAccessMode unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<ProviderAccessMode> get serializer =>
      _$providerAccessModeSerializer;

  const ProviderAccessMode._(String name) : super(name);

  static BuiltSet<ProviderAccessMode> get values => _$values;
  static ProviderAccessMode valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ProviderAccessModeMixin = Object with _$ProviderAccessModeMixin;
