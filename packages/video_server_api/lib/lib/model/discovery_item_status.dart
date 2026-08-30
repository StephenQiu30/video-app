//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'discovery_item_status.g.dart';

class DiscoveryItemStatus extends EnumClass {
  @BuiltValueEnumConst(wireName: r'ready')
  static const DiscoveryItemStatus ready = _$ready;
  @BuiltValueEnumConst(wireName: r'identity_unverified')
  static const DiscoveryItemStatus identityUnverified = _$identityUnverified;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DiscoveryItemStatus unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<DiscoveryItemStatus> get serializer =>
      _$discoveryItemStatusSerializer;

  const DiscoveryItemStatus._(String name) : super(name);

  static BuiltSet<DiscoveryItemStatus> get values => _$values;
  static DiscoveryItemStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DiscoveryItemStatusMixin = Object
    with _$DiscoveryItemStatusMixin;
