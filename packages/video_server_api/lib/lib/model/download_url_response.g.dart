// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_url_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DownloadUrlResponse extends DownloadUrlResponse {
  @override
  final String url;
  @override
  final DateTime expiresAt;
  @override
  final String filename;

  factory _$DownloadUrlResponse(
          [void Function(DownloadUrlResponseBuilder)? updates]) =>
      (DownloadUrlResponseBuilder()..update(updates))._build();

  _$DownloadUrlResponse._(
      {required this.url, required this.expiresAt, required this.filename})
      : super._();
  @override
  DownloadUrlResponse rebuild(
          void Function(DownloadUrlResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DownloadUrlResponseBuilder toBuilder() =>
      DownloadUrlResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DownloadUrlResponse &&
        url == other.url &&
        expiresAt == other.expiresAt &&
        filename == other.filename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jc(_$hash, filename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DownloadUrlResponse')
          ..add('url', url)
          ..add('expiresAt', expiresAt)
          ..add('filename', filename))
        .toString();
  }
}

class DownloadUrlResponseBuilder
    implements Builder<DownloadUrlResponse, DownloadUrlResponseBuilder> {
  _$DownloadUrlResponse? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  DateTime? _expiresAt;
  DateTime? get expiresAt => _$this._expiresAt;
  set expiresAt(DateTime? expiresAt) => _$this._expiresAt = expiresAt;

  String? _filename;
  String? get filename => _$this._filename;
  set filename(String? filename) => _$this._filename = filename;

  DownloadUrlResponseBuilder() {
    DownloadUrlResponse._defaults(this);
  }

  DownloadUrlResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _expiresAt = $v.expiresAt;
      _filename = $v.filename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DownloadUrlResponse other) {
    _$v = other as _$DownloadUrlResponse;
  }

  @override
  void update(void Function(DownloadUrlResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DownloadUrlResponse build() => _build();

  _$DownloadUrlResponse _build() {
    final _$result = _$v ??
        _$DownloadUrlResponse._(
          url: BuiltValueNullFieldError.checkNotNull(
              url, r'DownloadUrlResponse', 'url'),
          expiresAt: BuiltValueNullFieldError.checkNotNull(
              expiresAt, r'DownloadUrlResponse', 'expiresAt'),
          filename: BuiltValueNullFieldError.checkNotNull(
              filename, r'DownloadUrlResponse', 'filename'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
