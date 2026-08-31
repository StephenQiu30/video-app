// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_import_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MediaImportRequest extends MediaImportRequest {
  @override
  final String fileName;
  @override
  final int declaredSizeBytes;
  @override
  final String declaredSha256;
  @override
  final bool rightsAccepted;
  @override
  final DeclaredOrigin? declaredOrigin;

  factory _$MediaImportRequest(
          [void Function(MediaImportRequestBuilder)? updates]) =>
      (MediaImportRequestBuilder()..update(updates))._build();

  _$MediaImportRequest._(
      {required this.fileName,
      required this.declaredSizeBytes,
      required this.declaredSha256,
      required this.rightsAccepted,
      this.declaredOrigin})
      : super._();
  @override
  MediaImportRequest rebuild(
          void Function(MediaImportRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MediaImportRequestBuilder toBuilder() =>
      MediaImportRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MediaImportRequest &&
        fileName == other.fileName &&
        declaredSizeBytes == other.declaredSizeBytes &&
        declaredSha256 == other.declaredSha256 &&
        rightsAccepted == other.rightsAccepted &&
        declaredOrigin == other.declaredOrigin;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fileName.hashCode);
    _$hash = $jc(_$hash, declaredSizeBytes.hashCode);
    _$hash = $jc(_$hash, declaredSha256.hashCode);
    _$hash = $jc(_$hash, rightsAccepted.hashCode);
    _$hash = $jc(_$hash, declaredOrigin.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MediaImportRequest')
          ..add('fileName', fileName)
          ..add('declaredSizeBytes', declaredSizeBytes)
          ..add('declaredSha256', declaredSha256)
          ..add('rightsAccepted', rightsAccepted)
          ..add('declaredOrigin', declaredOrigin))
        .toString();
  }
}

class MediaImportRequestBuilder
    implements Builder<MediaImportRequest, MediaImportRequestBuilder> {
  _$MediaImportRequest? _$v;

  String? _fileName;
  String? get fileName => _$this._fileName;
  set fileName(String? fileName) => _$this._fileName = fileName;

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

  DeclaredOrigin? _declaredOrigin;
  DeclaredOrigin? get declaredOrigin => _$this._declaredOrigin;
  set declaredOrigin(DeclaredOrigin? declaredOrigin) =>
      _$this._declaredOrigin = declaredOrigin;

  MediaImportRequestBuilder() {
    MediaImportRequest._defaults(this);
  }

  MediaImportRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fileName = $v.fileName;
      _declaredSizeBytes = $v.declaredSizeBytes;
      _declaredSha256 = $v.declaredSha256;
      _rightsAccepted = $v.rightsAccepted;
      _declaredOrigin = $v.declaredOrigin;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MediaImportRequest other) {
    _$v = other as _$MediaImportRequest;
  }

  @override
  void update(void Function(MediaImportRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MediaImportRequest build() => _build();

  _$MediaImportRequest _build() {
    final _$result = _$v ??
        _$MediaImportRequest._(
          fileName: BuiltValueNullFieldError.checkNotNull(
              fileName, r'MediaImportRequest', 'fileName'),
          declaredSizeBytes: BuiltValueNullFieldError.checkNotNull(
              declaredSizeBytes, r'MediaImportRequest', 'declaredSizeBytes'),
          declaredSha256: BuiltValueNullFieldError.checkNotNull(
              declaredSha256, r'MediaImportRequest', 'declaredSha256'),
          rightsAccepted: BuiltValueNullFieldError.checkNotNull(
              rightsAccepted, r'MediaImportRequest', 'rightsAccepted'),
          declaredOrigin: declaredOrigin,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
