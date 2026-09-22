// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intent_history_item_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const IntentHistoryItemResponseNextActionEnum
    _$intentHistoryItemResponseNextActionEnum_none =
    const IntentHistoryItemResponseNextActionEnum._('none');
const IntentHistoryItemResponseNextActionEnum
    _$intentHistoryItemResponseNextActionEnum_unknownDefaultOpenApi =
    const IntentHistoryItemResponseNextActionEnum._('unknownDefaultOpenApi');

IntentHistoryItemResponseNextActionEnum
    _$intentHistoryItemResponseNextActionEnumValueOf(String name) {
  switch (name) {
    case 'none':
      return _$intentHistoryItemResponseNextActionEnum_none;
    case 'unknownDefaultOpenApi':
      return _$intentHistoryItemResponseNextActionEnum_unknownDefaultOpenApi;
    default:
      return _$intentHistoryItemResponseNextActionEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<IntentHistoryItemResponseNextActionEnum>
    _$intentHistoryItemResponseNextActionEnumValues = BuiltSet<
        IntentHistoryItemResponseNextActionEnum>(const <IntentHistoryItemResponseNextActionEnum>[
  _$intentHistoryItemResponseNextActionEnum_none,
  _$intentHistoryItemResponseNextActionEnum_unknownDefaultOpenApi,
]);

Serializer<IntentHistoryItemResponseNextActionEnum>
    _$intentHistoryItemResponseNextActionEnumSerializer =
    _$IntentHistoryItemResponseNextActionEnumSerializer();

class _$IntentHistoryItemResponseNextActionEnumSerializer
    implements PrimitiveSerializer<IntentHistoryItemResponseNextActionEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'none': 'none',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'none': 'none',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    IntentHistoryItemResponseNextActionEnum
  ];
  @override
  final String wireName = 'IntentHistoryItemResponseNextActionEnum';

  @override
  Object serialize(Serializers serializers,
          IntentHistoryItemResponseNextActionEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  IntentHistoryItemResponseNextActionEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      IntentHistoryItemResponseNextActionEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$IntentHistoryItemResponse extends IntentHistoryItemResponse {
  @override
  final String id;
  @override
  final int version;
  @override
  final IntentStatus status;
  @override
  final String? reasonCode;
  @override
  final IntentHistoryItemResponseNextActionEnum? nextAction;
  @override
  final DateTime? retryAt;
  @override
  final DateTime deadline;
  @override
  final String? inspectionId;
  @override
  final String? jobId;
  @override
  final DateTime createdAt;
  @override
  final String? title;

  factory _$IntentHistoryItemResponse(
          [void Function(IntentHistoryItemResponseBuilder)? updates]) =>
      (IntentHistoryItemResponseBuilder()..update(updates))._build();

  _$IntentHistoryItemResponse._(
      {required this.id,
      required this.version,
      required this.status,
      this.reasonCode,
      this.nextAction,
      this.retryAt,
      required this.deadline,
      this.inspectionId,
      this.jobId,
      required this.createdAt,
      this.title})
      : super._();
  @override
  IntentHistoryItemResponse rebuild(
          void Function(IntentHistoryItemResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IntentHistoryItemResponseBuilder toBuilder() =>
      IntentHistoryItemResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IntentHistoryItemResponse &&
        id == other.id &&
        version == other.version &&
        status == other.status &&
        reasonCode == other.reasonCode &&
        nextAction == other.nextAction &&
        retryAt == other.retryAt &&
        deadline == other.deadline &&
        inspectionId == other.inspectionId &&
        jobId == other.jobId &&
        createdAt == other.createdAt &&
        title == other.title;
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
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IntentHistoryItemResponse')
          ..add('id', id)
          ..add('version', version)
          ..add('status', status)
          ..add('reasonCode', reasonCode)
          ..add('nextAction', nextAction)
          ..add('retryAt', retryAt)
          ..add('deadline', deadline)
          ..add('inspectionId', inspectionId)
          ..add('jobId', jobId)
          ..add('createdAt', createdAt)
          ..add('title', title))
        .toString();
  }
}

class IntentHistoryItemResponseBuilder
    implements
        Builder<IntentHistoryItemResponse, IntentHistoryItemResponseBuilder> {
  _$IntentHistoryItemResponse? _$v;

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

  IntentHistoryItemResponseNextActionEnum? _nextAction;
  IntentHistoryItemResponseNextActionEnum? get nextAction => _$this._nextAction;
  set nextAction(IntentHistoryItemResponseNextActionEnum? nextAction) =>
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

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  IntentHistoryItemResponseBuilder() {
    IntentHistoryItemResponse._defaults(this);
  }

  IntentHistoryItemResponseBuilder get _$this {
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
      _createdAt = $v.createdAt;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IntentHistoryItemResponse other) {
    _$v = other as _$IntentHistoryItemResponse;
  }

  @override
  void update(void Function(IntentHistoryItemResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IntentHistoryItemResponse build() => _build();

  _$IntentHistoryItemResponse _build() {
    final _$result = _$v ??
        _$IntentHistoryItemResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'IntentHistoryItemResponse', 'id'),
          version: BuiltValueNullFieldError.checkNotNull(
              version, r'IntentHistoryItemResponse', 'version'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'IntentHistoryItemResponse', 'status'),
          reasonCode: reasonCode,
          nextAction: nextAction,
          retryAt: retryAt,
          deadline: BuiltValueNullFieldError.checkNotNull(
              deadline, r'IntentHistoryItemResponse', 'deadline'),
          inspectionId: inspectionId,
          jobId: jobId,
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'IntentHistoryItemResponse', 'createdAt'),
          title: title,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
