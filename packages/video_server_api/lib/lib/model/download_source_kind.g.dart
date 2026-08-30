// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_source_kind.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DownloadSourceKind _$remoteProvider =
    const DownloadSourceKind._('remoteProvider');
const DownloadSourceKind _$browserImport =
    const DownloadSourceKind._('browserImport');
const DownloadSourceKind _$unknownDefaultOpenApi =
    const DownloadSourceKind._('unknownDefaultOpenApi');

DownloadSourceKind _$valueOf(String name) {
  switch (name) {
    case 'remoteProvider':
      return _$remoteProvider;
    case 'browserImport':
      return _$browserImport;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<DownloadSourceKind> _$values =
    BuiltSet<DownloadSourceKind>(const <DownloadSourceKind>[
  _$remoteProvider,
  _$browserImport,
  _$unknownDefaultOpenApi,
]);

class _$DownloadSourceKindMeta {
  const _$DownloadSourceKindMeta();
  DownloadSourceKind get remoteProvider => _$remoteProvider;
  DownloadSourceKind get browserImport => _$browserImport;
  DownloadSourceKind get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  DownloadSourceKind valueOf(String name) => _$valueOf(name);
  BuiltSet<DownloadSourceKind> get values => _$values;
}

mixin _$DownloadSourceKindMixin {
  // ignore: non_constant_identifier_names
  _$DownloadSourceKindMeta get DownloadSourceKind =>
      const _$DownloadSourceKindMeta();
}

Serializer<DownloadSourceKind> _$downloadSourceKindSerializer =
    _$DownloadSourceKindSerializer();

class _$DownloadSourceKindSerializer
    implements PrimitiveSerializer<DownloadSourceKind> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'remoteProvider': 'remote_provider',
    'browserImport': 'browser_import',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'remote_provider': 'remoteProvider',
    'browser_import': 'browserImport',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[DownloadSourceKind];
  @override
  final String wireName = 'DownloadSourceKind';

  @override
  Object serialize(Serializers serializers, DownloadSourceKind object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DownloadSourceKind deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DownloadSourceKind.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
