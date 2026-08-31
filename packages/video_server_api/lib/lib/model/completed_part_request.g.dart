// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_part_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CompletedPartRequest extends CompletedPartRequest {
  @override
  final int partNumber;
  @override
  final String etag;

  factory _$CompletedPartRequest(
          [void Function(CompletedPartRequestBuilder)? updates]) =>
      (CompletedPartRequestBuilder()..update(updates))._build();

  _$CompletedPartRequest._({required this.partNumber, required this.etag})
      : super._();
  @override
  CompletedPartRequest rebuild(
          void Function(CompletedPartRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompletedPartRequestBuilder toBuilder() =>
      CompletedPartRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompletedPartRequest &&
        partNumber == other.partNumber &&
        etag == other.etag;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, partNumber.hashCode);
    _$hash = $jc(_$hash, etag.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompletedPartRequest')
          ..add('partNumber', partNumber)
          ..add('etag', etag))
        .toString();
  }
}

class CompletedPartRequestBuilder
    implements Builder<CompletedPartRequest, CompletedPartRequestBuilder> {
  _$CompletedPartRequest? _$v;

  int? _partNumber;
  int? get partNumber => _$this._partNumber;
  set partNumber(int? partNumber) => _$this._partNumber = partNumber;

  String? _etag;
  String? get etag => _$this._etag;
  set etag(String? etag) => _$this._etag = etag;

  CompletedPartRequestBuilder() {
    CompletedPartRequest._defaults(this);
  }

  CompletedPartRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _partNumber = $v.partNumber;
      _etag = $v.etag;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompletedPartRequest other) {
    _$v = other as _$CompletedPartRequest;
  }

  @override
  void update(void Function(CompletedPartRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompletedPartRequest build() => _build();

  _$CompletedPartRequest _build() {
    final _$result = _$v ??
        _$CompletedPartRequest._(
          partNumber: BuiltValueNullFieldError.checkNotNull(
              partNumber, r'CompletedPartRequest', 'partNumber'),
          etag: BuiltValueNullFieldError.checkNotNull(
              etag, r'CompletedPartRequest', 'etag'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
