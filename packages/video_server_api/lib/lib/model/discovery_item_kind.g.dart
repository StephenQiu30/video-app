// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_item_kind.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DiscoveryItemKind _$officialAccountNative =
    const DiscoveryItemKind._('officialAccountNative');
const DiscoveryItemKind _$tencentVideo =
    const DiscoveryItemKind._('tencentVideo');
const DiscoveryItemKind _$wechatChannels =
    const DiscoveryItemKind._('wechatChannels');
const DiscoveryItemKind _$unknown = const DiscoveryItemKind._('unknown');
const DiscoveryItemKind _$unknownDefaultOpenApi =
    const DiscoveryItemKind._('unknownDefaultOpenApi');

DiscoveryItemKind _$valueOf(String name) {
  switch (name) {
    case 'officialAccountNative':
      return _$officialAccountNative;
    case 'tencentVideo':
      return _$tencentVideo;
    case 'wechatChannels':
      return _$wechatChannels;
    case 'unknown':
      return _$unknown;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<DiscoveryItemKind> _$values =
    BuiltSet<DiscoveryItemKind>(const <DiscoveryItemKind>[
  _$officialAccountNative,
  _$tencentVideo,
  _$wechatChannels,
  _$unknown,
  _$unknownDefaultOpenApi,
]);

class _$DiscoveryItemKindMeta {
  const _$DiscoveryItemKindMeta();
  DiscoveryItemKind get officialAccountNative => _$officialAccountNative;
  DiscoveryItemKind get tencentVideo => _$tencentVideo;
  DiscoveryItemKind get wechatChannels => _$wechatChannels;
  DiscoveryItemKind get unknown => _$unknown;
  DiscoveryItemKind get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  DiscoveryItemKind valueOf(String name) => _$valueOf(name);
  BuiltSet<DiscoveryItemKind> get values => _$values;
}

mixin _$DiscoveryItemKindMixin {
  // ignore: non_constant_identifier_names
  _$DiscoveryItemKindMeta get DiscoveryItemKind =>
      const _$DiscoveryItemKindMeta();
}

Serializer<DiscoveryItemKind> _$discoveryItemKindSerializer =
    _$DiscoveryItemKindSerializer();

class _$DiscoveryItemKindSerializer
    implements PrimitiveSerializer<DiscoveryItemKind> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'officialAccountNative': 'official_account_native',
    'tencentVideo': 'tencent_video',
    'wechatChannels': 'wechat_channels',
    'unknown': 'unknown',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'official_account_native': 'officialAccountNative',
    'tencent_video': 'tencentVideo',
    'wechat_channels': 'wechatChannels',
    'unknown': 'unknown',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[DiscoveryItemKind];
  @override
  final String wireName = 'DiscoveryItemKind';

  @override
  Object serialize(Serializers serializers, DiscoveryItemKind object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DiscoveryItemKind deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DiscoveryItemKind.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
