//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'discovery_item_kind.g.dart';

class DiscoveryItemKind extends EnumClass {
  @BuiltValueEnumConst(wireName: r'official_account_native')
  static const DiscoveryItemKind officialAccountNative =
      _$officialAccountNative;
  @BuiltValueEnumConst(wireName: r'tencent_video')
  static const DiscoveryItemKind tencentVideo = _$tencentVideo;
  @BuiltValueEnumConst(wireName: r'wechat_channels')
  static const DiscoveryItemKind wechatChannels = _$wechatChannels;
  @BuiltValueEnumConst(wireName: r'unknown')
  static const DiscoveryItemKind unknown = _$unknown;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DiscoveryItemKind unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<DiscoveryItemKind> get serializer =>
      _$discoveryItemKindSerializer;

  const DiscoveryItemKind._(String name) : super(name);

  static BuiltSet<DiscoveryItemKind> get values => _$values;
  static DiscoveryItemKind valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DiscoveryItemKindMixin = Object with _$DiscoveryItemKindMixin;
