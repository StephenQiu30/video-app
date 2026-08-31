// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_part_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UploadPartResponse extends UploadPartResponse {
  @override
  final int partNumber;
  @override
  final String url;

  factory _$UploadPartResponse(
          [void Function(UploadPartResponseBuilder)? updates]) =>
      (UploadPartResponseBuilder()..update(updates))._build();

  _$UploadPartResponse._({required this.partNumber, required this.url})
      : super._();
  @override
  UploadPartResponse rebuild(
          void Function(UploadPartResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UploadPartResponseBuilder toBuilder() =>
      UploadPartResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UploadPartResponse &&
        partNumber == other.partNumber &&
        url == other.url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, partNumber.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UploadPartResponse')
          ..add('partNumber', partNumber)
          ..add('url', url))
        .toString();
  }
}

class UploadPartResponseBuilder
    implements Builder<UploadPartResponse, UploadPartResponseBuilder> {
  _$UploadPartResponse? _$v;

  int? _partNumber;
  int? get partNumber => _$this._partNumber;
  set partNumber(int? partNumber) => _$this._partNumber = partNumber;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  UploadPartResponseBuilder() {
    UploadPartResponse._defaults(this);
  }

  UploadPartResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _partNumber = $v.partNumber;
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UploadPartResponse other) {
    _$v = other as _$UploadPartResponse;
  }

  @override
  void update(void Function(UploadPartResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UploadPartResponse build() => _build();

  _$UploadPartResponse _build() {
    final _$result = _$v ??
        _$UploadPartResponse._(
          partNumber: BuiltValueNullFieldError.checkNotNull(
              partNumber, r'UploadPartResponse', 'partNumber'),
          url: BuiltValueNullFieldError.checkNotNull(
              url, r'UploadPartResponse', 'url'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
