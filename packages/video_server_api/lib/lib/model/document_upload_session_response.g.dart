// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_upload_session_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DocumentUploadSessionResponse extends DocumentUploadSessionResponse {
  @override
  final String resourceId;
  @override
  final int attempt;
  @override
  final int partSizeBytes;
  @override
  final int partCount;
  @override
  final int maxConcurrency;
  @override
  final DateTime expiresAt;
  @override
  final BuiltList<UploadPartResponse> parts;

  factory _$DocumentUploadSessionResponse(
          [void Function(DocumentUploadSessionResponseBuilder)? updates]) =>
      (DocumentUploadSessionResponseBuilder()..update(updates))._build();

  _$DocumentUploadSessionResponse._(
      {required this.resourceId,
      required this.attempt,
      required this.partSizeBytes,
      required this.partCount,
      required this.maxConcurrency,
      required this.expiresAt,
      required this.parts})
      : super._();
  @override
  DocumentUploadSessionResponse rebuild(
          void Function(DocumentUploadSessionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DocumentUploadSessionResponseBuilder toBuilder() =>
      DocumentUploadSessionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DocumentUploadSessionResponse &&
        resourceId == other.resourceId &&
        attempt == other.attempt &&
        partSizeBytes == other.partSizeBytes &&
        partCount == other.partCount &&
        maxConcurrency == other.maxConcurrency &&
        expiresAt == other.expiresAt &&
        parts == other.parts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, resourceId.hashCode);
    _$hash = $jc(_$hash, attempt.hashCode);
    _$hash = $jc(_$hash, partSizeBytes.hashCode);
    _$hash = $jc(_$hash, partCount.hashCode);
    _$hash = $jc(_$hash, maxConcurrency.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jc(_$hash, parts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DocumentUploadSessionResponse')
          ..add('resourceId', resourceId)
          ..add('attempt', attempt)
          ..add('partSizeBytes', partSizeBytes)
          ..add('partCount', partCount)
          ..add('maxConcurrency', maxConcurrency)
          ..add('expiresAt', expiresAt)
          ..add('parts', parts))
        .toString();
  }
}

class DocumentUploadSessionResponseBuilder
    implements
        Builder<DocumentUploadSessionResponse,
            DocumentUploadSessionResponseBuilder> {
  _$DocumentUploadSessionResponse? _$v;

  String? _resourceId;
  String? get resourceId => _$this._resourceId;
  set resourceId(String? resourceId) => _$this._resourceId = resourceId;

  int? _attempt;
  int? get attempt => _$this._attempt;
  set attempt(int? attempt) => _$this._attempt = attempt;

  int? _partSizeBytes;
  int? get partSizeBytes => _$this._partSizeBytes;
  set partSizeBytes(int? partSizeBytes) =>
      _$this._partSizeBytes = partSizeBytes;

  int? _partCount;
  int? get partCount => _$this._partCount;
  set partCount(int? partCount) => _$this._partCount = partCount;

  int? _maxConcurrency;
  int? get maxConcurrency => _$this._maxConcurrency;
  set maxConcurrency(int? maxConcurrency) =>
      _$this._maxConcurrency = maxConcurrency;

  DateTime? _expiresAt;
  DateTime? get expiresAt => _$this._expiresAt;
  set expiresAt(DateTime? expiresAt) => _$this._expiresAt = expiresAt;

  ListBuilder<UploadPartResponse>? _parts;
  ListBuilder<UploadPartResponse> get parts =>
      _$this._parts ??= ListBuilder<UploadPartResponse>();
  set parts(ListBuilder<UploadPartResponse>? parts) => _$this._parts = parts;

  DocumentUploadSessionResponseBuilder() {
    DocumentUploadSessionResponse._defaults(this);
  }

  DocumentUploadSessionResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _resourceId = $v.resourceId;
      _attempt = $v.attempt;
      _partSizeBytes = $v.partSizeBytes;
      _partCount = $v.partCount;
      _maxConcurrency = $v.maxConcurrency;
      _expiresAt = $v.expiresAt;
      _parts = $v.parts.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DocumentUploadSessionResponse other) {
    _$v = other as _$DocumentUploadSessionResponse;
  }

  @override
  void update(void Function(DocumentUploadSessionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DocumentUploadSessionResponse build() => _build();

  _$DocumentUploadSessionResponse _build() {
    _$DocumentUploadSessionResponse _$result;
    try {
      _$result = _$v ??
          _$DocumentUploadSessionResponse._(
            resourceId: BuiltValueNullFieldError.checkNotNull(
                resourceId, r'DocumentUploadSessionResponse', 'resourceId'),
            attempt: BuiltValueNullFieldError.checkNotNull(
                attempt, r'DocumentUploadSessionResponse', 'attempt'),
            partSizeBytes: BuiltValueNullFieldError.checkNotNull(partSizeBytes,
                r'DocumentUploadSessionResponse', 'partSizeBytes'),
            partCount: BuiltValueNullFieldError.checkNotNull(
                partCount, r'DocumentUploadSessionResponse', 'partCount'),
            maxConcurrency: BuiltValueNullFieldError.checkNotNull(
                maxConcurrency,
                r'DocumentUploadSessionResponse',
                'maxConcurrency'),
            expiresAt: BuiltValueNullFieldError.checkNotNull(
                expiresAt, r'DocumentUploadSessionResponse', 'expiresAt'),
            parts: parts.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'parts';
        parts.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DocumentUploadSessionResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
