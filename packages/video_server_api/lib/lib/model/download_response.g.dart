// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DownloadResponse extends DownloadResponse {
  @override
  final String id;
  @override
  final String? inspectionId;
  @override
  final String? formatId;
  @override
  final DownloadSourceKind sourceKind;
  @override
  final String sourceLabel;
  @override
  final DownloadStatus status;
  @override
  final DownloadStage? stage;
  @override
  final int progress;
  @override
  final int attempt;
  @override
  final int version;
  @override
  final DownloadErrorCode? errorCode;
  @override
  final String? errorMessage;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? finishedAt;
  @override
  final bool fileAvailable;
  @override
  final String? title;
  @override
  final String? extractorKey;
  @override
  final int? durationSeconds;
  @override
  final MediaKind mediaKind;
  @override
  final int assetCount;
  @override
  final String? thumbnailUrl;
  @override
  final SemanticPlanResponse? format;

  factory _$DownloadResponse(
          [void Function(DownloadResponseBuilder)? updates]) =>
      (DownloadResponseBuilder()..update(updates))._build();

  _$DownloadResponse._(
      {required this.id,
      this.inspectionId,
      this.formatId,
      required this.sourceKind,
      required this.sourceLabel,
      required this.status,
      this.stage,
      required this.progress,
      required this.attempt,
      required this.version,
      this.errorCode,
      this.errorMessage,
      required this.createdAt,
      required this.updatedAt,
      this.finishedAt,
      required this.fileAvailable,
      this.title,
      this.extractorKey,
      this.durationSeconds,
      required this.mediaKind,
      required this.assetCount,
      this.thumbnailUrl,
      this.format})
      : super._();
  @override
  DownloadResponse rebuild(void Function(DownloadResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DownloadResponseBuilder toBuilder() =>
      DownloadResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DownloadResponse &&
        id == other.id &&
        inspectionId == other.inspectionId &&
        formatId == other.formatId &&
        sourceKind == other.sourceKind &&
        sourceLabel == other.sourceLabel &&
        status == other.status &&
        stage == other.stage &&
        progress == other.progress &&
        attempt == other.attempt &&
        version == other.version &&
        errorCode == other.errorCode &&
        errorMessage == other.errorMessage &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        finishedAt == other.finishedAt &&
        fileAvailable == other.fileAvailable &&
        title == other.title &&
        extractorKey == other.extractorKey &&
        durationSeconds == other.durationSeconds &&
        mediaKind == other.mediaKind &&
        assetCount == other.assetCount &&
        thumbnailUrl == other.thumbnailUrl &&
        format == other.format;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, inspectionId.hashCode);
    _$hash = $jc(_$hash, formatId.hashCode);
    _$hash = $jc(_$hash, sourceKind.hashCode);
    _$hash = $jc(_$hash, sourceLabel.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, stage.hashCode);
    _$hash = $jc(_$hash, progress.hashCode);
    _$hash = $jc(_$hash, attempt.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, errorCode.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, finishedAt.hashCode);
    _$hash = $jc(_$hash, fileAvailable.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, extractorKey.hashCode);
    _$hash = $jc(_$hash, durationSeconds.hashCode);
    _$hash = $jc(_$hash, mediaKind.hashCode);
    _$hash = $jc(_$hash, assetCount.hashCode);
    _$hash = $jc(_$hash, thumbnailUrl.hashCode);
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DownloadResponse')
          ..add('id', id)
          ..add('inspectionId', inspectionId)
          ..add('formatId', formatId)
          ..add('sourceKind', sourceKind)
          ..add('sourceLabel', sourceLabel)
          ..add('status', status)
          ..add('stage', stage)
          ..add('progress', progress)
          ..add('attempt', attempt)
          ..add('version', version)
          ..add('errorCode', errorCode)
          ..add('errorMessage', errorMessage)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('finishedAt', finishedAt)
          ..add('fileAvailable', fileAvailable)
          ..add('title', title)
          ..add('extractorKey', extractorKey)
          ..add('durationSeconds', durationSeconds)
          ..add('mediaKind', mediaKind)
          ..add('assetCount', assetCount)
          ..add('thumbnailUrl', thumbnailUrl)
          ..add('format', format))
        .toString();
  }
}

class DownloadResponseBuilder
    implements Builder<DownloadResponse, DownloadResponseBuilder> {
  _$DownloadResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _inspectionId;
  String? get inspectionId => _$this._inspectionId;
  set inspectionId(String? inspectionId) => _$this._inspectionId = inspectionId;

  String? _formatId;
  String? get formatId => _$this._formatId;
  set formatId(String? formatId) => _$this._formatId = formatId;

  DownloadSourceKind? _sourceKind;
  DownloadSourceKind? get sourceKind => _$this._sourceKind;
  set sourceKind(DownloadSourceKind? sourceKind) =>
      _$this._sourceKind = sourceKind;

  String? _sourceLabel;
  String? get sourceLabel => _$this._sourceLabel;
  set sourceLabel(String? sourceLabel) => _$this._sourceLabel = sourceLabel;

  DownloadStatus? _status;
  DownloadStatus? get status => _$this._status;
  set status(DownloadStatus? status) => _$this._status = status;

  DownloadStage? _stage;
  DownloadStage? get stage => _$this._stage;
  set stage(DownloadStage? stage) => _$this._stage = stage;

  int? _progress;
  int? get progress => _$this._progress;
  set progress(int? progress) => _$this._progress = progress;

  int? _attempt;
  int? get attempt => _$this._attempt;
  set attempt(int? attempt) => _$this._attempt = attempt;

  int? _version;
  int? get version => _$this._version;
  set version(int? version) => _$this._version = version;

  DownloadErrorCode? _errorCode;
  DownloadErrorCode? get errorCode => _$this._errorCode;
  set errorCode(DownloadErrorCode? errorCode) => _$this._errorCode = errorCode;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  DateTime? _finishedAt;
  DateTime? get finishedAt => _$this._finishedAt;
  set finishedAt(DateTime? finishedAt) => _$this._finishedAt = finishedAt;

  bool? _fileAvailable;
  bool? get fileAvailable => _$this._fileAvailable;
  set fileAvailable(bool? fileAvailable) =>
      _$this._fileAvailable = fileAvailable;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _extractorKey;
  String? get extractorKey => _$this._extractorKey;
  set extractorKey(String? extractorKey) => _$this._extractorKey = extractorKey;

  int? _durationSeconds;
  int? get durationSeconds => _$this._durationSeconds;
  set durationSeconds(int? durationSeconds) =>
      _$this._durationSeconds = durationSeconds;

  MediaKind? _mediaKind;
  MediaKind? get mediaKind => _$this._mediaKind;
  set mediaKind(MediaKind? mediaKind) => _$this._mediaKind = mediaKind;

  int? _assetCount;
  int? get assetCount => _$this._assetCount;
  set assetCount(int? assetCount) => _$this._assetCount = assetCount;

  String? _thumbnailUrl;
  String? get thumbnailUrl => _$this._thumbnailUrl;
  set thumbnailUrl(String? thumbnailUrl) => _$this._thumbnailUrl = thumbnailUrl;

  SemanticPlanResponseBuilder? _format;
  SemanticPlanResponseBuilder get format =>
      _$this._format ??= SemanticPlanResponseBuilder();
  set format(SemanticPlanResponseBuilder? format) => _$this._format = format;

  DownloadResponseBuilder() {
    DownloadResponse._defaults(this);
  }

  DownloadResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _inspectionId = $v.inspectionId;
      _formatId = $v.formatId;
      _sourceKind = $v.sourceKind;
      _sourceLabel = $v.sourceLabel;
      _status = $v.status;
      _stage = $v.stage;
      _progress = $v.progress;
      _attempt = $v.attempt;
      _version = $v.version;
      _errorCode = $v.errorCode;
      _errorMessage = $v.errorMessage;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _finishedAt = $v.finishedAt;
      _fileAvailable = $v.fileAvailable;
      _title = $v.title;
      _extractorKey = $v.extractorKey;
      _durationSeconds = $v.durationSeconds;
      _mediaKind = $v.mediaKind;
      _assetCount = $v.assetCount;
      _thumbnailUrl = $v.thumbnailUrl;
      _format = $v.format?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DownloadResponse other) {
    _$v = other as _$DownloadResponse;
  }

  @override
  void update(void Function(DownloadResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DownloadResponse build() => _build();

  _$DownloadResponse _build() {
    _$DownloadResponse _$result;
    try {
      _$result = _$v ??
          _$DownloadResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'DownloadResponse', 'id'),
            inspectionId: inspectionId,
            formatId: formatId,
            sourceKind: BuiltValueNullFieldError.checkNotNull(
                sourceKind, r'DownloadResponse', 'sourceKind'),
            sourceLabel: BuiltValueNullFieldError.checkNotNull(
                sourceLabel, r'DownloadResponse', 'sourceLabel'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'DownloadResponse', 'status'),
            stage: stage,
            progress: BuiltValueNullFieldError.checkNotNull(
                progress, r'DownloadResponse', 'progress'),
            attempt: BuiltValueNullFieldError.checkNotNull(
                attempt, r'DownloadResponse', 'attempt'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'DownloadResponse', 'version'),
            errorCode: errorCode,
            errorMessage: errorMessage,
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'DownloadResponse', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'DownloadResponse', 'updatedAt'),
            finishedAt: finishedAt,
            fileAvailable: BuiltValueNullFieldError.checkNotNull(
                fileAvailable, r'DownloadResponse', 'fileAvailable'),
            title: title,
            extractorKey: extractorKey,
            durationSeconds: durationSeconds,
            mediaKind: BuiltValueNullFieldError.checkNotNull(
                mediaKind, r'DownloadResponse', 'mediaKind'),
            assetCount: BuiltValueNullFieldError.checkNotNull(
                assetCount, r'DownloadResponse', 'assetCount'),
            thumbnailUrl: thumbnailUrl,
            format: _format?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'format';
        _format?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DownloadResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
