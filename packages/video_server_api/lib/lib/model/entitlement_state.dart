//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'entitlement_state.g.dart';

class EntitlementState extends EnumClass {
  @BuiltValueEnumConst(wireName: r'public_free')
  static const EntitlementState publicFree = _$publicFree;
  @BuiltValueEnumConst(wireName: r'official_download_grant')
  static const EntitlementState officialDownloadGrant = _$officialDownloadGrant;
  @BuiltValueEnumConst(wireName: r'restricted')
  static const EntitlementState restricted = _$restricted;
  @BuiltValueEnumConst(wireName: r'unknown')
  static const EntitlementState unknown = _$unknown;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const EntitlementState unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<EntitlementState> get serializer =>
      _$entitlementStateSerializer;

  const EntitlementState._(String name) : super(name);

  static BuiltSet<EntitlementState> get values => _$values;
  static EntitlementState valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class EntitlementStateMixin = Object with _$EntitlementStateMixin;
