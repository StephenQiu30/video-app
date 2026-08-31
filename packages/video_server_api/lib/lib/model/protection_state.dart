//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'protection_state.g.dart';

class ProtectionState extends EnumClass {
  @BuiltValueEnumConst(wireName: r'clear')
  static const ProtectionState clear = _$clear;
  @BuiltValueEnumConst(wireName: r'encrypted')
  static const ProtectionState encrypted = _$encrypted;
  @BuiltValueEnumConst(wireName: r'drm')
  static const ProtectionState drm = _$drm;
  @BuiltValueEnumConst(wireName: r'unknown')
  static const ProtectionState unknown = _$unknown;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ProtectionState unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<ProtectionState> get serializer =>
      _$protectionStateSerializer;

  const ProtectionState._(String name) : super(name);

  static BuiltSet<ProtectionState> get values => _$values;
  static ProtectionState valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ProtectionStateMixin = Object with _$ProtectionStateMixin;
