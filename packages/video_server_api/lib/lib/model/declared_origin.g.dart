// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'declared_origin.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DeclaredOrigin _$userFile = const DeclaredOrigin._('userFile');
const DeclaredOrigin _$wechatChannels =
    const DeclaredOrigin._('wechatChannels');
const DeclaredOrigin _$unknownDefaultOpenApi =
    const DeclaredOrigin._('unknownDefaultOpenApi');

DeclaredOrigin _$valueOf(String name) {
  switch (name) {
    case 'userFile':
      return _$userFile;
    case 'wechatChannels':
      return _$wechatChannels;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<DeclaredOrigin> _$values =
    BuiltSet<DeclaredOrigin>(const <DeclaredOrigin>[
  _$userFile,
  _$wechatChannels,
  _$unknownDefaultOpenApi,
]);

class _$DeclaredOriginMeta {
  const _$DeclaredOriginMeta();
  DeclaredOrigin get userFile => _$userFile;
  DeclaredOrigin get wechatChannels => _$wechatChannels;
  DeclaredOrigin get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  DeclaredOrigin valueOf(String name) => _$valueOf(name);
  BuiltSet<DeclaredOrigin> get values => _$values;
}

mixin _$DeclaredOriginMixin {
  // ignore: non_constant_identifier_names
  _$DeclaredOriginMeta get DeclaredOrigin => const _$DeclaredOriginMeta();
}

Serializer<DeclaredOrigin> _$declaredOriginSerializer =
    _$DeclaredOriginSerializer();

class _$DeclaredOriginSerializer
    implements PrimitiveSerializer<DeclaredOrigin> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'userFile': 'user_file',
    'wechatChannels': 'wechat_channels',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'user_file': 'userFile',
    'wechat_channels': 'wechatChannels',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[DeclaredOrigin];
  @override
  final String wireName = 'DeclaredOrigin';

  @override
  Object serialize(Serializers serializers, DeclaredOrigin object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DeclaredOrigin deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DeclaredOrigin.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
