// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_import_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MediaImportResponse extends MediaImportResponse {
  @override
  final String id;
  @override
  final String downloadId;
  @override
  final ImportSourceFormat sourceFormat;
  @override
  final String displayName;
  @override
  final int declaredSizeBytes;
  @override
  final ImportStatus status;
  @override
  final int attempt;
  @override
  final ImportErrorCode? errorCode;
  @override
  final int version;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? finishedAt;
  @override
  final DeclaredOrigin declaredOrigin;

  factory _$MediaImportResponse(
          [void Function(MediaImportResponseBuilder)? updates]) =>
      (MediaImportResponseBuilder()..update(updates))._build();

  _$MediaImportResponse._(
      {required this.id,
      required this.downloadId,
      required this.sourceFormat,
      required this.displayName,
      required this.declaredSizeBytes,
      required this.status,
      required this.attempt,
      this.errorCode,
      required this.version,
      required this.createdAt,
      required this.updatedAt,
      this.finishedAt,
      required this.declaredOrigin})
      : super._();
  @override
  MediaImportResponse rebuild(
          void Function(MediaImportResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MediaImportResponseBuilder toBuilder() =>
      MediaImportResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MediaImportResponse &&
        id == other.id &&
        downloadId == other.downloadId &&
        sourceFormat == other.sourceFormat &&
        displayName == other.displayName &&
        declaredSizeBytes == other.declaredSizeBytes &&
        status == other.status &&
        attempt == other.attempt &&
        errorCode == other.errorCode &&
        version == other.version &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        finishedAt == other.finishedAt &&
        declaredOrigin == other.declaredOrigin;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, downloadId.hashCode);
    _$hash = $jc(_$hash, sourceFormat.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, declaredSizeBytes.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, attempt.hashCode);
    _$hash = $jc(_$hash, errorCode.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, finishedAt.hashCode);
    _$hash = $jc(_$hash, declaredOrigin.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MediaImportResponse')
          ..add('id', id)
          ..add('downloadId', downloadId)
          ..add('sourceFormat', sourceFormat)
          ..add('displayName', displayName)
          ..add('declaredSizeBytes', declaredSizeBytes)
          ..add('status', status)
          ..add('attempt', attempt)
          ..add('errorCode', errorCode)
          ..add('version', version)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('finishedAt', finishedAt)
          ..add('declaredOrigin', declaredOrigin))
        .toString();
  }
}

class MediaImportResponseBuilder
    implements Builder<MediaImportResponse, MediaImportResponseBuilder> {
  _$MediaImportResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadId;
  String? get downloadId => _$this._downloadId;
  set downloadId(String? downloadId) => _$this._downloadId = downloadId;

  ImportSourceFormat? _sourceFormat;
  ImportSourceFormat? get sourceFormat => _$this._sourceFormat;
  set sourceFormat(ImportSourceFormat? sourceFormat) =>
      _$this._sourceFormat = sourceFormat;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  int? _declaredSizeBytes;
  int? get declaredSizeBytes => _$this._declaredSizeBytes;
  set declaredSizeBytes(int? declaredSizeBytes) =>
      _$this._declaredSizeBytes = declaredSizeBytes;

  ImportStatus? _status;
  ImportStatus? get status => _$this._status;
  set status(ImportStatus? status) => _$this._status = status;

  int? _attempt;
  int? get attempt => _$this._attempt;
  set attempt(int? attempt) => _$this._attempt = attempt;

  ImportErrorCode? _errorCode;
  ImportErrorCode? get errorCode => _$this._errorCode;
  set errorCode(ImportErrorCode? errorCode) => _$this._errorCode = errorCode;

  int? _version;
  int? get version => _$this._version;
  set version(int? version) => _$this._version = version;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  DateTime? _finishedAt;
  DateTime? get finishedAt => _$this._finishedAt;
  set finishedAt(DateTime? finishedAt) => _$this._finishedAt = finishedAt;

  DeclaredOrigin? _declaredOrigin;
  DeclaredOrigin? get declaredOrigin => _$this._declaredOrigin;
  set declaredOrigin(DeclaredOrigin? declaredOrigin) =>
      _$this._declaredOrigin = declaredOrigin;

  MediaImportResponseBuilder() {
    MediaImportResponse._defaults(this);
  }

  MediaImportResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _downloadId = $v.downloadId;
      _sourceFormat = $v.sourceFormat;
      _displayName = $v.displayName;
      _declaredSizeBytes = $v.declaredSizeBytes;
      _status = $v.status;
      _attempt = $v.attempt;
      _errorCode = $v.errorCode;
      _version = $v.version;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _finishedAt = $v.finishedAt;
      _declaredOrigin = $v.declaredOrigin;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MediaImportResponse other) {
    _$v = other as _$MediaImportResponse;
  }

  @override
  void update(void Function(MediaImportResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MediaImportResponse build() => _build();

  _$MediaImportResponse _build() {
    final _$result = _$v ??
        _$MediaImportResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'MediaImportResponse', 'id'),
          downloadId: BuiltValueNullFieldError.checkNotNull(
              downloadId, r'MediaImportResponse', 'downloadId'),
          sourceFormat: BuiltValueNullFieldError.checkNotNull(
              sourceFormat, r'MediaImportResponse', 'sourceFormat'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'MediaImportResponse', 'displayName'),
          declaredSizeBytes: BuiltValueNullFieldError.checkNotNull(
              declaredSizeBytes, r'MediaImportResponse', 'declaredSizeBytes'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'MediaImportResponse', 'status'),
          attempt: BuiltValueNullFieldError.checkNotNull(
              attempt, r'MediaImportResponse', 'attempt'),
          errorCode: errorCode,
          version: BuiltValueNullFieldError.checkNotNull(
              version, r'MediaImportResponse', 'version'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'MediaImportResponse', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'MediaImportResponse', 'updatedAt'),
          finishedAt: finishedAt,
          declaredOrigin: BuiltValueNullFieldError.checkNotNull(
              declaredOrigin, r'MediaImportResponse', 'declaredOrigin'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
