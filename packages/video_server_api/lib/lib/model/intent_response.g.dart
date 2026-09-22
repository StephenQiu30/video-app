// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intent_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const IntentResponseNextActionEnum _$intentResponseNextActionEnum_none =
    const IntentResponseNextActionEnum._('none');
const IntentResponseNextActionEnum
    _$intentResponseNextActionEnum_unknownDefaultOpenApi =
    const IntentResponseNextActionEnum._('unknownDefaultOpenApi');

IntentResponseNextActionEnum _$intentResponseNextActionEnumValueOf(
    String name) {
  switch (name) {
    case 'none':
      return _$intentResponseNextActionEnum_none;
    case 'unknownDefaultOpenApi':
      return _$intentResponseNextActionEnum_unknownDefaultOpenApi;
    default:
      return _$intentResponseNextActionEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<IntentResponseNextActionEnum>
    _$intentResponseNextActionEnumValues =
    BuiltSet<IntentResponseNextActionEnum>(const <IntentResponseNextActionEnum>[
  _$intentResponseNextActionEnum_none,
  _$intentResponseNextActionEnum_unknownDefaultOpenApi,
]);

Serializer<IntentResponseNextActionEnum>
    _$intentResponseNextActionEnumSerializer =
    _$IntentResponseNextActionEnumSerializer();

class _$IntentResponseNextActionEnumSerializer
    implements PrimitiveSerializer<IntentResponseNextActionEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'none': 'none',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'none': 'none',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[IntentResponseNextActionEnum];
  @override
  final String wireName = 'IntentResponseNextActionEnum';

  @override
  Object serialize(Serializers serializers, IntentResponseNextActionEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  IntentResponseNextActionEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      IntentResponseNextActionEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$IntentResponse extends IntentResponse {
  @override
  final String id;
  @override
  final int version;
  @override
  final IntentStatus status;
  @override
  final String? reasonCode;
  @override
  final IntentResponseNextActionEnum? nextAction;
  @override
  final DateTime? retryAt;
  @override
  final DateTime deadline;
  @override
  final String? inspectionId;
  @override
  final String? jobId;

  factory _$IntentResponse([void Function(IntentResponseBuilder)? updates]) =>
      (IntentResponseBuilder()..update(updates))._build();

  _$IntentResponse._(
      {required this.id,
      required this.version,
      required this.status,
      this.reasonCode,
      this.nextAction,
      this.retryAt,
      required this.deadline,
      this.inspectionId,
      this.jobId})
      : super._();
  @override
  IntentResponse rebuild(void Function(IntentResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IntentResponseBuilder toBuilder() => IntentResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IntentResponse &&
        id == other.id &&
        version == other.version &&
        status == other.status &&
        reasonCode == other.reasonCode &&
        nextAction == other.nextAction &&
        retryAt == other.retryAt &&
        deadline == other.deadline &&
        inspectionId == other.inspectionId &&
        jobId == other.jobId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, reasonCode.hashCode);
    _$hash = $jc(_$hash, nextAction.hashCode);
    _$hash = $jc(_$hash, retryAt.hashCode);
    _$hash = $jc(_$hash, deadline.hashCode);
    _$hash = $jc(_$hash, inspectionId.hashCode);
    _$hash = $jc(_$hash, jobId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IntentResponse')
          ..add('id', id)
          ..add('version', version)
          ..add('status', status)
          ..add('reasonCode', reasonCode)
          ..add('nextAction', nextAction)
          ..add('retryAt', retryAt)
          ..add('deadline', deadline)
          ..add('inspectionId', inspectionId)
          ..add('jobId', jobId))
        .toString();
  }
}

class IntentResponseBuilder
    implements Builder<IntentResponse, IntentResponseBuilder> {
  _$IntentResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _version;
  int? get version => _$this._version;
  set version(int? version) => _$this._version = version;

  IntentStatus? _status;
  IntentStatus? get status => _$this._status;
  set status(IntentStatus? status) => _$this._status = status;

  String? _reasonCode;
  String? get reasonCode => _$this._reasonCode;
  set reasonCode(String? reasonCode) => _$this._reasonCode = reasonCode;

  IntentResponseNextActionEnum? _nextAction;
  IntentResponseNextActionEnum? get nextAction => _$this._nextAction;
  set nextAction(IntentResponseNextActionEnum? nextAction) =>
      _$this._nextAction = nextAction;

  DateTime? _retryAt;
  DateTime? get retryAt => _$this._retryAt;
  set retryAt(DateTime? retryAt) => _$this._retryAt = retryAt;

  DateTime? _deadline;
  DateTime? get deadline => _$this._deadline;
  set deadline(DateTime? deadline) => _$this._deadline = deadline;

  String? _inspectionId;
  String? get inspectionId => _$this._inspectionId;
  set inspectionId(String? inspectionId) => _$this._inspectionId = inspectionId;

  String? _jobId;
  String? get jobId => _$this._jobId;
  set jobId(String? jobId) => _$this._jobId = jobId;

  IntentResponseBuilder() {
    IntentResponse._defaults(this);
  }

  IntentResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _version = $v.version;
      _status = $v.status;
      _reasonCode = $v.reasonCode;
      _nextAction = $v.nextAction;
      _retryAt = $v.retryAt;
      _deadline = $v.deadline;
      _inspectionId = $v.inspectionId;
      _jobId = $v.jobId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IntentResponse other) {
    _$v = other as _$IntentResponse;
  }

  @override
  void update(void Function(IntentResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IntentResponse build() => _build();

  _$IntentResponse _build() {
    final _$result = _$v ??
        _$IntentResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'IntentResponse', 'id'),
          version: BuiltValueNullFieldError.checkNotNull(
              version, r'IntentResponse', 'version'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'IntentResponse', 'status'),
          reasonCode: reasonCode,
          nextAction: nextAction,
          retryAt: retryAt,
          deadline: BuiltValueNullFieldError.checkNotNull(
              deadline, r'IntentResponse', 'deadline'),
          inspectionId: inspectionId,
          jobId: jobId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
