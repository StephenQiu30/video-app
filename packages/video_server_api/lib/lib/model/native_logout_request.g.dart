// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'native_logout_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NativeLogoutRequest extends NativeLogoutRequest {
  @override
  final String refreshToken;

  factory _$NativeLogoutRequest(
          [void Function(NativeLogoutRequestBuilder)? updates]) =>
      (NativeLogoutRequestBuilder()..update(updates))._build();

  _$NativeLogoutRequest._({required this.refreshToken}) : super._();
  @override
  NativeLogoutRequest rebuild(
          void Function(NativeLogoutRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NativeLogoutRequestBuilder toBuilder() =>
      NativeLogoutRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NativeLogoutRequest && refreshToken == other.refreshToken;
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
    return (newBuiltValueToStringHelper(r'NativeLogoutRequest')
          ..add('refreshToken', refreshToken))
        .toString();
  }
}

class NativeLogoutRequestBuilder
    implements Builder<NativeLogoutRequest, NativeLogoutRequestBuilder> {
  _$NativeLogoutRequest? _$v;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  NativeLogoutRequestBuilder() {
    NativeLogoutRequest._defaults(this);
  }

  NativeLogoutRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _refreshToken = $v.refreshToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NativeLogoutRequest other) {
    _$v = other as _$NativeLogoutRequest;
  }

  @override
  void update(void Function(NativeLogoutRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NativeLogoutRequest build() => _build();

  _$NativeLogoutRequest _build() {
    final _$result = _$v ??
        _$NativeLogoutRequest._(
          refreshToken: BuiltValueNullFieldError.checkNotNull(
              refreshToken, r'NativeLogoutRequest', 'refreshToken'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
