// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_import_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DocumentImportResponse extends DocumentImportResponse {
  @override
  final String id;
  @override
  final DocumentSourceFormat sourceFormat;
  @override
  final String originalFilename;
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

  factory _$DocumentImportResponse(
          [void Function(DocumentImportResponseBuilder)? updates]) =>
      (DocumentImportResponseBuilder()..update(updates))._build();

  _$DocumentImportResponse._(
      {required this.id,
      required this.sourceFormat,
      required this.originalFilename,
      required this.declaredSizeBytes,
      required this.status,
      required this.attempt,
      this.errorCode,
      required this.version,
      required this.createdAt,
      required this.updatedAt,
      this.finishedAt})
      : super._();
  @override
  DocumentImportResponse rebuild(
          void Function(DocumentImportResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DocumentImportResponseBuilder toBuilder() =>
      DocumentImportResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DocumentImportResponse &&
        id == other.id &&
        sourceFormat == other.sourceFormat &&
        originalFilename == other.originalFilename &&
        declaredSizeBytes == other.declaredSizeBytes &&
        status == other.status &&
        attempt == other.attempt &&
        errorCode == other.errorCode &&
        version == other.version &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        finishedAt == other.finishedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, sourceFormat.hashCode);
    _$hash = $jc(_$hash, originalFilename.hashCode);
    _$hash = $jc(_$hash, declaredSizeBytes.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, attempt.hashCode);
    _$hash = $jc(_$hash, errorCode.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, finishedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DocumentImportResponse')
          ..add('id', id)
          ..add('sourceFormat', sourceFormat)
          ..add('originalFilename', originalFilename)
          ..add('declaredSizeBytes', declaredSizeBytes)
          ..add('status', status)
          ..add('attempt', attempt)
          ..add('errorCode', errorCode)
          ..add('version', version)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('finishedAt', finishedAt))
        .toString();
  }
}

class DocumentImportResponseBuilder
    implements Builder<DocumentImportResponse, DocumentImportResponseBuilder> {
  _$DocumentImportResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DocumentSourceFormat? _sourceFormat;
  DocumentSourceFormat? get sourceFormat => _$this._sourceFormat;
  set sourceFormat(DocumentSourceFormat? sourceFormat) =>
      _$this._sourceFormat = sourceFormat;

  String? _originalFilename;
  String? get originalFilename => _$this._originalFilename;
  set originalFilename(String? originalFilename) =>
      _$this._originalFilename = originalFilename;

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

  DocumentImportResponseBuilder() {
    DocumentImportResponse._defaults(this);
  }

  DocumentImportResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _sourceFormat = $v.sourceFormat;
      _originalFilename = $v.originalFilename;
      _declaredSizeBytes = $v.declaredSizeBytes;
      _status = $v.status;
      _attempt = $v.attempt;
      _errorCode = $v.errorCode;
      _version = $v.version;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _finishedAt = $v.finishedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DocumentImportResponse other) {
    _$v = other as _$DocumentImportResponse;
  }

  @override
  void update(void Function(DocumentImportResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DocumentImportResponse build() => _build();

  _$DocumentImportResponse _build() {
    final _$result = _$v ??
        _$DocumentImportResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'DocumentImportResponse', 'id'),
          sourceFormat: BuiltValueNullFieldError.checkNotNull(
              sourceFormat, r'DocumentImportResponse', 'sourceFormat'),
          originalFilename: BuiltValueNullFieldError.checkNotNull(
              originalFilename, r'DocumentImportResponse', 'originalFilename'),
          declaredSizeBytes: BuiltValueNullFieldError.checkNotNull(
              declaredSizeBytes,
              r'DocumentImportResponse',
              'declaredSizeBytes'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'DocumentImportResponse', 'status'),
          attempt: BuiltValueNullFieldError.checkNotNull(
              attempt, r'DocumentImportResponse', 'attempt'),
          errorCode: errorCode,
          version: BuiltValueNullFieldError.checkNotNull(
              version, r'DocumentImportResponse', 'version'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'DocumentImportResponse', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'DocumentImportResponse', 'updatedAt'),
          finishedAt: finishedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
