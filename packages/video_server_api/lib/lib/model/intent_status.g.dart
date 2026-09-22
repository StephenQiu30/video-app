// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intent_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const IntentStatus _$queued = const IntentStatus._('queued');
const IntentStatus _$preparing = const IntentStatus._('preparing');
const IntentStatus _$resolving = const IntentStatus._('resolving');
const IntentStatus _$retryWait = const IntentStatus._('retryWait');
const IntentStatus _$actionRequired = const IntentStatus._('actionRequired');
const IntentStatus _$ready = const IntentStatus._('ready');
const IntentStatus _$handedOff = const IntentStatus._('handedOff');
const IntentStatus _$cancelled = const IntentStatus._('cancelled');
const IntentStatus _$expired = const IntentStatus._('expired');
const IntentStatus _$failed = const IntentStatus._('failed');
const IntentStatus _$unknownDefaultOpenApi =
    const IntentStatus._('unknownDefaultOpenApi');

IntentStatus _$valueOf(String name) {
  switch (name) {
    case 'queued':
      return _$queued;
    case 'preparing':
      return _$preparing;
    case 'resolving':
      return _$resolving;
    case 'retryWait':
      return _$retryWait;
    case 'actionRequired':
      return _$actionRequired;
    case 'ready':
      return _$ready;
    case 'handedOff':
      return _$handedOff;
    case 'cancelled':
      return _$cancelled;
    case 'expired':
      return _$expired;
    case 'failed':
      return _$failed;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<IntentStatus> _$values =
    BuiltSet<IntentStatus>(const <IntentStatus>[
  _$queued,
  _$preparing,
  _$resolving,
  _$retryWait,
  _$actionRequired,
  _$ready,
  _$handedOff,
  _$cancelled,
  _$expired,
  _$failed,
  _$unknownDefaultOpenApi,
]);

class _$IntentStatusMeta {
  const _$IntentStatusMeta();
  IntentStatus get queued => _$queued;
  IntentStatus get preparing => _$preparing;
  IntentStatus get resolving => _$resolving;
  IntentStatus get retryWait => _$retryWait;
  IntentStatus get actionRequired => _$actionRequired;
  IntentStatus get ready => _$ready;
  IntentStatus get handedOff => _$handedOff;
  IntentStatus get cancelled => _$cancelled;
  IntentStatus get expired => _$expired;
  IntentStatus get failed => _$failed;
  IntentStatus get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  IntentStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<IntentStatus> get values => _$values;
}

mixin _$IntentStatusMixin {
  // ignore: non_constant_identifier_names
  _$IntentStatusMeta get IntentStatus => const _$IntentStatusMeta();
}

Serializer<IntentStatus> _$intentStatusSerializer = _$IntentStatusSerializer();

class _$IntentStatusSerializer implements PrimitiveSerializer<IntentStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'queued': 'queued',
    'preparing': 'preparing',
    'resolving': 'resolving',
    'retryWait': 'retry_wait',
    'actionRequired': 'action_required',
    'ready': 'ready',
    'handedOff': 'handed_off',
    'cancelled': 'cancelled',
    'expired': 'expired',
    'failed': 'failed',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'queued': 'queued',
    'preparing': 'preparing',
    'resolving': 'resolving',
    'retry_wait': 'retryWait',
    'action_required': 'actionRequired',
    'ready': 'ready',
    'handed_off': 'handedOff',
    'cancelled': 'cancelled',
    'expired': 'expired',
    'failed': 'failed',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[IntentStatus];
  @override
  final String wireName = 'IntentStatus';

  @override
  Object serialize(Serializers serializers, IntentStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  IntentStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      IntentStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
