// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DocumentResponse extends DocumentResponse {
  @override
  final String id;
  @override
  final String title;
  @override
  final String originalFilename;
  @override
  final DocumentSourceFormat sourceFormat;
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
  final String? detectedLanguage;
  @override
  final int? sceneCount;
  @override
  final int? characterCount;
  @override
  final BuiltList<String> qualityWarnings;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? finishedAt;

  factory _$DocumentResponse(
          [void Function(DocumentResponseBuilder)? updates]) =>
      (DocumentResponseBuilder()..update(updates))._build();

  _$DocumentResponse._(
      {required this.id,
      required this.title,
      required this.originalFilename,
      required this.sourceFormat,
      required this.declaredSizeBytes,
      required this.status,
      required this.attempt,
      this.errorCode,
      required this.version,
      this.detectedLanguage,
      this.sceneCount,
      this.characterCount,
      required this.qualityWarnings,
      required this.createdAt,
      required this.updatedAt,
      this.finishedAt})
      : super._();
  @override
  DocumentResponse rebuild(void Function(DocumentResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DocumentResponseBuilder toBuilder() =>
      DocumentResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DocumentResponse &&
        id == other.id &&
        title == other.title &&
        originalFilename == other.originalFilename &&
        sourceFormat == other.sourceFormat &&
        declaredSizeBytes == other.declaredSizeBytes &&
        status == other.status &&
        attempt == other.attempt &&
        errorCode == other.errorCode &&
        version == other.version &&
        detectedLanguage == other.detectedLanguage &&
        sceneCount == other.sceneCount &&
        characterCount == other.characterCount &&
        qualityWarnings == other.qualityWarnings &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        finishedAt == other.finishedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, originalFilename.hashCode);
    _$hash = $jc(_$hash, sourceFormat.hashCode);
    _$hash = $jc(_$hash, declaredSizeBytes.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, attempt.hashCode);
    _$hash = $jc(_$hash, errorCode.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, detectedLanguage.hashCode);
    _$hash = $jc(_$hash, sceneCount.hashCode);
    _$hash = $jc(_$hash, characterCount.hashCode);
    _$hash = $jc(_$hash, qualityWarnings.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, finishedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DocumentResponse')
          ..add('id', id)
          ..add('title', title)
          ..add('originalFilename', originalFilename)
          ..add('sourceFormat', sourceFormat)
          ..add('declaredSizeBytes', declaredSizeBytes)
          ..add('status', status)
          ..add('attempt', attempt)
          ..add('errorCode', errorCode)
          ..add('version', version)
          ..add('detectedLanguage', detectedLanguage)
          ..add('sceneCount', sceneCount)
          ..add('characterCount', characterCount)
          ..add('qualityWarnings', qualityWarnings)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('finishedAt', finishedAt))
        .toString();
  }
}

class DocumentResponseBuilder
    implements Builder<DocumentResponse, DocumentResponseBuilder> {
  _$DocumentResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _originalFilename;
  String? get originalFilename => _$this._originalFilename;
  set originalFilename(String? originalFilename) =>
      _$this._originalFilename = originalFilename;

  DocumentSourceFormat? _sourceFormat;
  DocumentSourceFormat? get sourceFormat => _$this._sourceFormat;
  set sourceFormat(DocumentSourceFormat? sourceFormat) =>
      _$this._sourceFormat = sourceFormat;

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

  String? _detectedLanguage;
  String? get detectedLanguage => _$this._detectedLanguage;
  set detectedLanguage(String? detectedLanguage) =>
      _$this._detectedLanguage = detectedLanguage;

  int? _sceneCount;
  int? get sceneCount => _$this._sceneCount;
  set sceneCount(int? sceneCount) => _$this._sceneCount = sceneCount;

  int? _characterCount;
  int? get characterCount => _$this._characterCount;
  set characterCount(int? characterCount) =>
      _$this._characterCount = characterCount;

  ListBuilder<String>? _qualityWarnings;
  ListBuilder<String> get qualityWarnings =>
      _$this._qualityWarnings ??= ListBuilder<String>();
  set qualityWarnings(ListBuilder<String>? qualityWarnings) =>
      _$this._qualityWarnings = qualityWarnings;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  DateTime? _finishedAt;
  DateTime? get finishedAt => _$this._finishedAt;
  set finishedAt(DateTime? finishedAt) => _$this._finishedAt = finishedAt;

  DocumentResponseBuilder() {
    DocumentResponse._defaults(this);
  }

  DocumentResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _originalFilename = $v.originalFilename;
      _sourceFormat = $v.sourceFormat;
      _declaredSizeBytes = $v.declaredSizeBytes;
      _status = $v.status;
      _attempt = $v.attempt;
      _errorCode = $v.errorCode;
      _version = $v.version;
      _detectedLanguage = $v.detectedLanguage;
      _sceneCount = $v.sceneCount;
      _characterCount = $v.characterCount;
      _qualityWarnings = $v.qualityWarnings.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _finishedAt = $v.finishedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DocumentResponse other) {
    _$v = other as _$DocumentResponse;
  }

  @override
  void update(void Function(DocumentResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DocumentResponse build() => _build();

  _$DocumentResponse _build() {
    _$DocumentResponse _$result;
    try {
      _$result = _$v ??
          _$DocumentResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'DocumentResponse', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'DocumentResponse', 'title'),
            originalFilename: BuiltValueNullFieldError.checkNotNull(
                originalFilename, r'DocumentResponse', 'originalFilename'),
            sourceFormat: BuiltValueNullFieldError.checkNotNull(
                sourceFormat, r'DocumentResponse', 'sourceFormat'),
            declaredSizeBytes: BuiltValueNullFieldError.checkNotNull(
                declaredSizeBytes, r'DocumentResponse', 'declaredSizeBytes'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'DocumentResponse', 'status'),
            attempt: BuiltValueNullFieldError.checkNotNull(
                attempt, r'DocumentResponse', 'attempt'),
            errorCode: errorCode,
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'DocumentResponse', 'version'),
            detectedLanguage: detectedLanguage,
            sceneCount: sceneCount,
            characterCount: characterCount,
            qualityWarnings: qualityWarnings.build(),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'DocumentResponse', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'DocumentResponse', 'updatedAt'),
            finishedAt: finishedAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'qualityWarnings';
        qualityWarnings.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DocumentResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
