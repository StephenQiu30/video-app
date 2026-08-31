// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AnalysisStatus _$queued = const AnalysisStatus._('queued');
const AnalysisStatus _$running = const AnalysisStatus._('running');
const AnalysisStatus _$retryWait = const AnalysisStatus._('retryWait');
const AnalysisStatus _$succeeded = const AnalysisStatus._('succeeded');
const AnalysisStatus _$failed = const AnalysisStatus._('failed');
const AnalysisStatus _$cancelled = const AnalysisStatus._('cancelled');
const AnalysisStatus _$unknownDefaultOpenApi =
    const AnalysisStatus._('unknownDefaultOpenApi');

AnalysisStatus _$valueOf(String name) {
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

final BuiltSet<AnalysisStatus> _$values =
    BuiltSet<AnalysisStatus>(const <AnalysisStatus>[
  _$queued,
  _$running,
  _$retryWait,
  _$succeeded,
  _$failed,
  _$cancelled,
  _$unknownDefaultOpenApi,
]);

class _$AnalysisStatusMeta {
  const _$AnalysisStatusMeta();
  AnalysisStatus get queued => _$queued;
  AnalysisStatus get running => _$running;
  AnalysisStatus get retryWait => _$retryWait;
  AnalysisStatus get succeeded => _$succeeded;
  AnalysisStatus get failed => _$failed;
  AnalysisStatus get cancelled => _$cancelled;
  AnalysisStatus get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  AnalysisStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<AnalysisStatus> get values => _$values;
}

mixin _$AnalysisStatusMixin {
  // ignore: non_constant_identifier_names
  _$AnalysisStatusMeta get AnalysisStatus => const _$AnalysisStatusMeta();
}

Serializer<AnalysisStatus> _$analysisStatusSerializer =
    _$AnalysisStatusSerializer();

class _$AnalysisStatusSerializer
    implements PrimitiveSerializer<AnalysisStatus> {
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
  final Iterable<Type> types = const <Type>[AnalysisStatus];
  @override
  final String wireName = 'AnalysisStatus';

  @override
  Object serialize(Serializers serializers, AnalysisStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AnalysisStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AnalysisStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
