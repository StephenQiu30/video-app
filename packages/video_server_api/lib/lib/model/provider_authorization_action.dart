//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'provider_authorization_action.g.dart';

class ProviderAuthorizationAction extends EnumClass {
  /// Coarse, non-secret recovery action exposed by the Provider API.
  @BuiltValueEnumConst(wireName: r'none')
  static const ProviderAuthorizationAction none = _$none;

  /// Coarse, non-secret recovery action exposed by the Provider API.
  @BuiltValueEnumConst(wireName: r'browser_session')
  static const ProviderAuthorizationAction browserSession = _$browserSession;

  /// Coarse, non-secret recovery action exposed by the Provider API.
  @BuiltValueEnumConst(wireName: r'managed_session')
  static const ProviderAuthorizationAction managedSession = _$managedSession;

  /// Coarse, non-secret recovery action exposed by the Provider API.
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ProviderAuthorizationAction unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<ProviderAuthorizationAction> get serializer =>
      _$providerAuthorizationActionSerializer;

  const ProviderAuthorizationAction._(String name) : super(name);

  static BuiltSet<ProviderAuthorizationAction> get values => _$values;
  static ProviderAuthorizationAction valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ProviderAuthorizationActionMixin = Object
    with _$ProviderAuthorizationActionMixin;
