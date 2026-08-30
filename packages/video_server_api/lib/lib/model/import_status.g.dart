// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ImportStatus _$uploading = const ImportStatus._('uploading');
const ImportStatus _$verifying = const ImportStatus._('verifying');
const ImportStatus _$ready = const ImportStatus._('ready');
const ImportStatus _$failed = const ImportStatus._('failed');
const ImportStatus _$cancelled = const ImportStatus._('cancelled');
const ImportStatus _$expired = const ImportStatus._('expired');
const ImportStatus _$unknownDefaultOpenApi =
    const ImportStatus._('unknownDefaultOpenApi');

ImportStatus _$valueOf(String name) {
  switch (name) {
    case 'uploading':
      return _$uploading;
    case 'verifying':
      return _$verifying;
    case 'ready':
      return _$ready;
    case 'failed':
      return _$failed;
    case 'cancelled':
      return _$cancelled;
    case 'expired':
      return _$expired;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<ImportStatus> _$values =
    BuiltSet<ImportStatus>(const <ImportStatus>[
  _$uploading,
  _$verifying,
  _$ready,
  _$failed,
  _$cancelled,
  _$expired,
  _$unknownDefaultOpenApi,
]);

class _$ImportStatusMeta {
  const _$ImportStatusMeta();
  ImportStatus get uploading => _$uploading;
  ImportStatus get verifying => _$verifying;
  ImportStatus get ready => _$ready;
  ImportStatus get failed => _$failed;
  ImportStatus get cancelled => _$cancelled;
  ImportStatus get expired => _$expired;
  ImportStatus get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  ImportStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<ImportStatus> get values => _$values;
}

mixin _$ImportStatusMixin {
  // ignore: non_constant_identifier_names
  _$ImportStatusMeta get ImportStatus => const _$ImportStatusMeta();
}

Serializer<ImportStatus> _$importStatusSerializer = _$ImportStatusSerializer();

class _$ImportStatusSerializer implements PrimitiveSerializer<ImportStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'uploading': 'uploading',
    'verifying': 'verifying',
    'ready': 'ready',
    'failed': 'failed',
    'cancelled': 'cancelled',
    'expired': 'expired',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'uploading': 'uploading',
    'verifying': 'verifying',
    'ready': 'ready',
    'failed': 'failed',
    'cancelled': 'cancelled',
    'expired': 'expired',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ImportStatus];
  @override
  final String wireName = 'ImportStatus';

  @override
  Object serialize(Serializers serializers, ImportStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ImportStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ImportStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
