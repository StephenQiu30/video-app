// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_import_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DocumentImportRequest extends DocumentImportRequest {
  @override
  final String fileName;
  @override
  final DocumentSourceFormat sourceFormat;
  @override
  final int declaredSizeBytes;
  @override
  final String declaredSha256;
  @override
  final bool rightsAccepted;

  factory _$DocumentImportRequest(
          [void Function(DocumentImportRequestBuilder)? updates]) =>
      (DocumentImportRequestBuilder()..update(updates))._build();

  _$DocumentImportRequest._(
      {required this.fileName,
      required this.sourceFormat,
      required this.declaredSizeBytes,
      required this.declaredSha256,
      required this.rightsAccepted})
      : super._();
  @override
  DocumentImportRequest rebuild(
          void Function(DocumentImportRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DocumentImportRequestBuilder toBuilder() =>
      DocumentImportRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DocumentImportRequest &&
        fileName == other.fileName &&
        sourceFormat == other.sourceFormat &&
        declaredSizeBytes == other.declaredSizeBytes &&
        declaredSha256 == other.declaredSha256 &&
        rightsAccepted == other.rightsAccepted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fileName.hashCode);
    _$hash = $jc(_$hash, sourceFormat.hashCode);
    _$hash = $jc(_$hash, declaredSizeBytes.hashCode);
    _$hash = $jc(_$hash, declaredSha256.hashCode);
    _$hash = $jc(_$hash, rightsAccepted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DocumentImportRequest')
          ..add('fileName', fileName)
          ..add('sourceFormat', sourceFormat)
          ..add('declaredSizeBytes', declaredSizeBytes)
          ..add('declaredSha256', declaredSha256)
          ..add('rightsAccepted', rightsAccepted))
        .toString();
  }
}

class DocumentImportRequestBuilder
    implements Builder<DocumentImportRequest, DocumentImportRequestBuilder> {
  _$DocumentImportRequest? _$v;

  String? _fileName;
  String? get fileName => _$this._fileName;
  set fileName(String? fileName) => _$this._fileName = fileName;

  DocumentSourceFormat? _sourceFormat;
  DocumentSourceFormat? get sourceFormat => _$this._sourceFormat;
  set sourceFormat(DocumentSourceFormat? sourceFormat) =>
      _$this._sourceFormat = sourceFormat;

  int? _declaredSizeBytes;
  int? get declaredSizeBytes => _$this._declaredSizeBytes;
  set declaredSizeBytes(int? declaredSizeBytes) =>
      _$this._declaredSizeBytes = declaredSizeBytes;

  String? _declaredSha256;
  String? get declaredSha256 => _$this._declaredSha256;
  set declaredSha256(String? declaredSha256) =>
      _$this._declaredSha256 = declaredSha256;

  bool? _rightsAccepted;
  bool? get rightsAccepted => _$this._rightsAccepted;
  set rightsAccepted(bool? rightsAccepted) =>
      _$this._rightsAccepted = rightsAccepted;

  DocumentImportRequestBuilder() {
    DocumentImportRequest._defaults(this);
  }

  DocumentImportRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fileName = $v.fileName;
      _sourceFormat = $v.sourceFormat;
      _declaredSizeBytes = $v.declaredSizeBytes;
      _declaredSha256 = $v.declaredSha256;
      _rightsAccepted = $v.rightsAccepted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DocumentImportRequest other) {
    _$v = other as _$DocumentImportRequest;
  }

  @override
  void update(void Function(DocumentImportRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DocumentImportRequest build() => _build();

  _$DocumentImportRequest _build() {
    final _$result = _$v ??
        _$DocumentImportRequest._(
          fileName: BuiltValueNullFieldError.checkNotNull(
              fileName, r'DocumentImportRequest', 'fileName'),
          sourceFormat: BuiltValueNullFieldError.checkNotNull(
              sourceFormat, r'DocumentImportRequest', 'sourceFormat'),
          declaredSizeBytes: BuiltValueNullFieldError.checkNotNull(
              declaredSizeBytes, r'DocumentImportRequest', 'declaredSizeBytes'),
          declaredSha256: BuiltValueNullFieldError.checkNotNull(
              declaredSha256, r'DocumentImportRequest', 'declaredSha256'),
          rightsAccepted: BuiltValueNullFieldError.checkNotNull(
              rightsAccepted, r'DocumentImportRequest', 'rightsAccepted'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
