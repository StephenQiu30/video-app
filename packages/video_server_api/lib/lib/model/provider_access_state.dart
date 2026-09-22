//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'provider_access_state.g.dart';

class ProviderAccessState extends EnumClass {
  /// User-facing access state projected from support and runtime evidence.
  @BuiltValueEnumConst(wireName: r'public_probe')
  static const ProviderAccessState publicProbe = _$publicProbe;

  /// User-facing access state projected from support and runtime evidence.
  @BuiltValueEnumConst(wireName: r'public_ready')
  static const ProviderAccessState publicReady = _$publicReady;

  /// User-facing access state projected from support and runtime evidence.
  @BuiltValueEnumConst(wireName: r'guest_probe')
  static const ProviderAccessState guestProbe = _$guestProbe;

  /// User-facing access state projected from support and runtime evidence.
  @BuiltValueEnumConst(wireName: r'guest_ready')
  static const ProviderAccessState guestReady = _$guestReady;

  /// User-facing access state projected from support and runtime evidence.
  @BuiltValueEnumConst(wireName: r'authorization_required')
  static const ProviderAccessState authorizationRequired =
      _$authorizationRequired;

  /// User-facing access state projected from support and runtime evidence.
  @BuiltValueEnumConst(wireName: r'operator_probe')
  static const ProviderAccessState operatorProbe = _$operatorProbe;

  /// User-facing access state projected from support and runtime evidence.
  @BuiltValueEnumConst(wireName: r'operator_ready')
  static const ProviderAccessState operatorReady = _$operatorReady;

  /// User-facing access state projected from support and runtime evidence.
  @BuiltValueEnumConst(wireName: r'degraded')
  static const ProviderAccessState degraded = _$degraded;

  /// User-facing access state projected from support and runtime evidence.
  @BuiltValueEnumConst(wireName: r'blocked')
  static const ProviderAccessState blocked = _$blocked;

  /// User-facing access state projected from support and runtime evidence.
  @BuiltValueEnumConst(wireName: r'disabled')
  static const ProviderAccessState disabled = _$disabled;

  /// User-facing access state projected from support and runtime evidence.
  @BuiltValueEnumConst(wireName: r'unsupported')
  static const ProviderAccessState unsupported = _$unsupported;

  /// User-facing access state projected from support and runtime evidence.
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ProviderAccessState unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<ProviderAccessState> get serializer =>
      _$providerAccessStateSerializer;

  const ProviderAccessState._(String name) : super(name);

  static BuiltSet<ProviderAccessState> get values => _$values;
  static ProviderAccessState valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ProviderAccessStateMixin = Object
    with _$ProviderAccessStateMixin;
