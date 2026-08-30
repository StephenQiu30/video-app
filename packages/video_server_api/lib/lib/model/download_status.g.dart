// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DownloadStatus _$queued = const DownloadStatus._('queued');
const DownloadStatus _$running = const DownloadStatus._('running');
const DownloadStatus _$retryWait = const DownloadStatus._('retryWait');
const DownloadStatus _$succeeded = const DownloadStatus._('succeeded');
const DownloadStatus _$failed = const DownloadStatus._('failed');
const DownloadStatus _$cancelled = const DownloadStatus._('cancelled');
const DownloadStatus _$unknownDefaultOpenApi =
    const DownloadStatus._('unknownDefaultOpenApi');

DownloadStatus _$valueOf(String name) {
  switch (name) {
    case 'queued':
      return _$queued;
    case 'running':
      return _$running;
    case 'retryWait':
      return _$retryWait;
    case 'succeeded':
      return _$succeeded;
    case 'failed':
      return _$failed;
    case 'cancelled':
      return _$cancelled;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<DownloadStatus> _$values =
    BuiltSet<DownloadStatus>(const <DownloadStatus>[
  _$queued,
  _$running,
  _$retryWait,
  _$succeeded,
  _$failed,
  _$cancelled,
  _$unknownDefaultOpenApi,
]);

class _$DownloadStatusMeta {
  const _$DownloadStatusMeta();
  DownloadStatus get queued => _$queued;
  DownloadStatus get running => _$running;
  DownloadStatus get retryWait => _$retryWait;
  DownloadStatus get succeeded => _$succeeded;
  DownloadStatus get failed => _$failed;
  DownloadStatus get cancelled => _$cancelled;
  DownloadStatus get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  DownloadStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<DownloadStatus> get values => _$values;
}

mixin _$DownloadStatusMixin {
  // ignore: non_constant_identifier_names
  _$DownloadStatusMeta get DownloadStatus => const _$DownloadStatusMeta();
}

Serializer<DownloadStatus> _$downloadStatusSerializer =
    _$DownloadStatusSerializer();

class _$DownloadStatusSerializer
    implements PrimitiveSerializer<DownloadStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'queued': 'queued',
    'running': 'running',
    'retryWait': 'retry_wait',
    'succeeded': 'succeeded',
    'failed': 'failed',
    'cancelled': 'cancelled',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'queued': 'queued',
    'running': 'running',
    'retry_wait': 'retryWait',
    'succeeded': 'succeeded',
    'failed': 'failed',
    'cancelled': 'cancelled',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[DownloadStatus];
  @override
  final String wireName = 'DownloadStatus';

  @override
  Object serialize(Serializers serializers, DownloadStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DownloadStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DownloadStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
