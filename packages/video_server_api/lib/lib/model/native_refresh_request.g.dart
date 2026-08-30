// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'native_refresh_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NativeRefreshRequest extends NativeRefreshRequest {
  @override
  final String refreshToken;

  factory _$NativeRefreshRequest(
          [void Function(NativeRefreshRequestBuilder)? updates]) =>
      (NativeRefreshRequestBuilder()..update(updates))._build();

  _$NativeRefreshRequest._({required this.refreshToken}) : super._();
  @override
  NativeRefreshRequest rebuild(
          void Function(NativeRefreshRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NativeRefreshRequestBuilder toBuilder() =>
      NativeRefreshRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NativeRefreshRequest && refreshToken == other.refreshToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NativeRefreshRequest')
          ..add('refreshToken', refreshToken))
        .toString();
  }
}

class NativeRefreshRequestBuilder
    implements Builder<NativeRefreshRequest, NativeRefreshRequestBuilder> {
  _$NativeRefreshRequest? _$v;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  NativeRefreshRequestBuilder() {
    NativeRefreshRequest._defaults(this);
  }

  NativeRefreshRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _refreshToken = $v.refreshToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NativeRefreshRequest other) {
    _$v = other as _$NativeRefreshRequest;
  }

  @override
  void update(void Function(NativeRefreshRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NativeRefreshRequest build() => _build();

  _$NativeRefreshRequest _build() {
    final _$result = _$v ??
        _$NativeRefreshRequest._(
          refreshToken: BuiltValueNullFieldError.checkNotNull(
              refreshToken, r'NativeRefreshRequest', 'refreshToken'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
