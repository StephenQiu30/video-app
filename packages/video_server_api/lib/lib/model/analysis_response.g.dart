// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnalysisResponse extends AnalysisResponse {
  @override
  final String id;
  @override
  final String runId;
  @override
  final int runNo;
  @override
  final String runTrigger;
  @override
  final int version;
  @override
  final String skillId;
  @override
  final String outputLanguage;
  @override
  final AnalysisInputKind inputKind;
  @override
  final AnalysisResultContract resultContract;
  @override
  final AnalysisStatus status;
  @override
  final AnalysisStage? stage;
  @override
  final int progress;
  @override
  final int attempt;
  @override
  final AnalysisErrorCode? errorCode;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? finishedAt;
  @override
  final AnalysisResponseResult? result;
  @override
  final String? reportMarkdown;
  @override
  final String? currentReportId;
  @override
  final AnalysisReportResponse? report;

  factory _$AnalysisResponse(
          [void Function(AnalysisResponseBuilder)? updates]) =>
      (AnalysisResponseBuilder()..update(updates))._build();

  _$AnalysisResponse._(
      {required this.id,
      required this.runId,
      required this.runNo,
      required this.runTrigger,
      required this.version,
      required this.skillId,
      required this.outputLanguage,
      required this.inputKind,
      required this.resultContract,
      required this.status,
      this.stage,
      required this.progress,
      required this.attempt,
      this.errorCode,
      required this.createdAt,
      required this.updatedAt,
      this.finishedAt,
      this.result,
      this.reportMarkdown,
      this.currentReportId,
      this.report})
      : super._();
  @override
  AnalysisResponse rebuild(void Function(AnalysisResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalysisResponseBuilder toBuilder() =>
      AnalysisResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalysisResponse &&
        id == other.id &&
        runId == other.runId &&
        runNo == other.runNo &&
        runTrigger == other.runTrigger &&
        version == other.version &&
        skillId == other.skillId &&
        outputLanguage == other.outputLanguage &&
        inputKind == other.inputKind &&
        resultContract == other.resultContract &&
        status == other.status &&
        stage == other.stage &&
        progress == other.progress &&
        attempt == other.attempt &&
        errorCode == other.errorCode &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        finishedAt == other.finishedAt &&
        result == other.result &&
        reportMarkdown == other.reportMarkdown &&
        currentReportId == other.currentReportId &&
        report == other.report;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, runId.hashCode);
    _$hash = $jc(_$hash, runNo.hashCode);
    _$hash = $jc(_$hash, runTrigger.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, skillId.hashCode);
    _$hash = $jc(_$hash, outputLanguage.hashCode);
    _$hash = $jc(_$hash, inputKind.hashCode);
    _$hash = $jc(_$hash, resultContract.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, stage.hashCode);
    _$hash = $jc(_$hash, progress.hashCode);
    _$hash = $jc(_$hash, attempt.hashCode);
    _$hash = $jc(_$hash, errorCode.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, finishedAt.hashCode);
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jc(_$hash, reportMarkdown.hashCode);
    _$hash = $jc(_$hash, currentReportId.hashCode);
    _$hash = $jc(_$hash, report.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnalysisResponse')
          ..add('id', id)
          ..add('runId', runId)
          ..add('runNo', runNo)
          ..add('runTrigger', runTrigger)
          ..add('version', version)
          ..add('skillId', skillId)
          ..add('outputLanguage', outputLanguage)
          ..add('inputKind', inputKind)
          ..add('resultContract', resultContract)
          ..add('status', status)
          ..add('stage', stage)
          ..add('progress', progress)
          ..add('attempt', attempt)
          ..add('errorCode', errorCode)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('finishedAt', finishedAt)
          ..add('result', result)
          ..add('reportMarkdown', reportMarkdown)
          ..add('currentReportId', currentReportId)
          ..add('report', report))
        .toString();
  }
}

class AnalysisResponseBuilder
    implements Builder<AnalysisResponse, AnalysisResponseBuilder> {
  _$AnalysisResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _runId;
  String? get runId => _$this._runId;
  set runId(String? runId) => _$this._runId = runId;

  int? _runNo;
  int? get runNo => _$this._runNo;
  set runNo(int? runNo) => _$this._runNo = runNo;

  String? _runTrigger;
  String? get runTrigger => _$this._runTrigger;
  set runTrigger(String? runTrigger) => _$this._runTrigger = runTrigger;

  int? _version;
  int? get version => _$this._version;
  set version(int? version) => _$this._version = version;

  String? _skillId;
  String? get skillId => _$this._skillId;
  set skillId(String? skillId) => _$this._skillId = skillId;

  String? _outputLanguage;
  String? get outputLanguage => _$this._outputLanguage;
  set outputLanguage(String? outputLanguage) =>
      _$this._outputLanguage = outputLanguage;

  AnalysisInputKind? _inputKind;
  AnalysisInputKind? get inputKind => _$this._inputKind;
  set inputKind(AnalysisInputKind? inputKind) => _$this._inputKind = inputKind;

  AnalysisResultContract? _resultContract;
  AnalysisResultContract? get resultContract => _$this._resultContract;
  set resultContract(AnalysisResultContract? resultContract) =>
      _$this._resultContract = resultContract;

  AnalysisStatus? _status;
  AnalysisStatus? get status => _$this._status;
  set status(AnalysisStatus? status) => _$this._status = status;

  AnalysisStage? _stage;
  AnalysisStage? get stage => _$this._stage;
  set stage(AnalysisStage? stage) => _$this._stage = stage;

  int? _progress;
  int? get progress => _$this._progress;
  set progress(int? progress) => _$this._progress = progress;

  int? _attempt;
  int? get attempt => _$this._attempt;
  set attempt(int? attempt) => _$this._attempt = attempt;

  AnalysisErrorCode? _errorCode;
  AnalysisErrorCode? get errorCode => _$this._errorCode;
  set errorCode(AnalysisErrorCode? errorCode) => _$this._errorCode = errorCode;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  DateTime? _finishedAt;
  DateTime? get finishedAt => _$this._finishedAt;
  set finishedAt(DateTime? finishedAt) => _$this._finishedAt = finishedAt;

  AnalysisResponseResultBuilder? _result;
  AnalysisResponseResultBuilder get result =>
      _$this._result ??= AnalysisResponseResultBuilder();
  set result(AnalysisResponseResultBuilder? result) => _$this._result = result;

  String? _reportMarkdown;
  String? get reportMarkdown => _$this._reportMarkdown;
  set reportMarkdown(String? reportMarkdown) =>
      _$this._reportMarkdown = reportMarkdown;

  String? _currentReportId;
  String? get currentReportId => _$this._currentReportId;
  set currentReportId(String? currentReportId) =>
      _$this._currentReportId = currentReportId;

  AnalysisReportResponseBuilder? _report;
  AnalysisReportResponseBuilder get report =>
      _$this._report ??= AnalysisReportResponseBuilder();
  set report(AnalysisReportResponseBuilder? report) => _$this._report = report;

  AnalysisResponseBuilder() {
    AnalysisResponse._defaults(this);
  }

  AnalysisResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _runId = $v.runId;
      _runNo = $v.runNo;
      _runTrigger = $v.runTrigger;
      _version = $v.version;
      _skillId = $v.skillId;
      _outputLanguage = $v.outputLanguage;
      _inputKind = $v.inputKind;
      _resultContract = $v.resultContract;
      _status = $v.status;
      _stage = $v.stage;
      _progress = $v.progress;
      _attempt = $v.attempt;
      _errorCode = $v.errorCode;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _finishedAt = $v.finishedAt;
      _result = $v.result?.toBuilder();
      _reportMarkdown = $v.reportMarkdown;
      _currentReportId = $v.currentReportId;
      _report = $v.report?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalysisResponse other) {
    _$v = other as _$AnalysisResponse;
  }

  @override
  void update(void Function(AnalysisResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalysisResponse build() => _build();

  _$AnalysisResponse _build() {
    _$AnalysisResponse _$result;
    try {
      _$result = _$v ??
          _$AnalysisResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AnalysisResponse', 'id'),
            runId: BuiltValueNullFieldError.checkNotNull(
                runId, r'AnalysisResponse', 'runId'),
            runNo: BuiltValueNullFieldError.checkNotNull(
                runNo, r'AnalysisResponse', 'runNo'),
            runTrigger: BuiltValueNullFieldError.checkNotNull(
                runTrigger, r'AnalysisResponse', 'runTrigger'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'AnalysisResponse', 'version'),
            skillId: BuiltValueNullFieldError.checkNotNull(
                skillId, r'AnalysisResponse', 'skillId'),
            outputLanguage: BuiltValueNullFieldError.checkNotNull(
                outputLanguage, r'AnalysisResponse', 'outputLanguage'),
            inputKind: BuiltValueNullFieldError.checkNotNull(
                inputKind, r'AnalysisResponse', 'inputKind'),
            resultContract: BuiltValueNullFieldError.checkNotNull(
                resultContract, r'AnalysisResponse', 'resultContract'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AnalysisResponse', 'status'),
            stage: stage,
            progress: BuiltValueNullFieldError.checkNotNull(
                progress, r'AnalysisResponse', 'progress'),
            attempt: BuiltValueNullFieldError.checkNotNull(
                attempt, r'AnalysisResponse', 'attempt'),
            errorCode: errorCode,
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'AnalysisResponse', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'AnalysisResponse', 'updatedAt'),
            finishedAt: finishedAt,
            result: _result?.build(),
            reportMarkdown: reportMarkdown,
            currentReportId: currentReportId,
            report: _report?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'result';
        _result?.build();

        _$failedField = 'report';
        _report?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AnalysisResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
