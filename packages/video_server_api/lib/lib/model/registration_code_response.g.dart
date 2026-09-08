// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_code_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegistrationCodeResponse extends RegistrationCodeResponse {
  @override
  final bool? emailSent;
  @override
  final int? expiresInSeconds;
  @override
  final int? retryAfterSeconds;

  factory _$RegistrationCodeResponse(
          [void Function(RegistrationCodeResponseBuilder)? updates]) =>
      (RegistrationCodeResponseBuilder()..update(updates))._build();

  _$RegistrationCodeResponse._(
      {this.emailSent, this.expiresInSeconds, this.retryAfterSeconds})
      : super._();
  @override
  RegistrationCodeResponse rebuild(
          void Function(RegistrationCodeResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegistrationCodeResponseBuilder toBuilder() =>
      RegistrationCodeResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegistrationCodeResponse &&
        emailSent == other.emailSent &&
        expiresInSeconds == other.expiresInSeconds &&
        retryAfterSeconds == other.retryAfterSeconds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, emailSent.hashCode);
    _$hash = $jc(_$hash, expiresInSeconds.hashCode);
    _$hash = $jc(_$hash, retryAfterSeconds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegistrationCodeResponse')
          ..add('emailSent', emailSent)
          ..add('expiresInSeconds', expiresInSeconds)
          ..add('retryAfterSeconds', retryAfterSeconds))
        .toString();
  }
}

class RegistrationCodeResponseBuilder
    implements
        Builder<RegistrationCodeResponse, RegistrationCodeResponseBuilder> {
  _$RegistrationCodeResponse? _$v;

  bool? _emailSent;
  bool? get emailSent => _$this._emailSent;
  set emailSent(bool? emailSent) => _$this._emailSent = emailSent;

  int? _expiresInSeconds;
  int? get expiresInSeconds => _$this._expiresInSeconds;
  set expiresInSeconds(int? expiresInSeconds) =>
      _$this._expiresInSeconds = expiresInSeconds;

  int? _retryAfterSeconds;
  int? get retryAfterSeconds => _$this._retryAfterSeconds;
  set retryAfterSeconds(int? retryAfterSeconds) =>
      _$this._retryAfterSeconds = retryAfterSeconds;

  RegistrationCodeResponseBuilder() {
    RegistrationCodeResponse._defaults(this);
  }

  RegistrationCodeResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _emailSent = $v.emailSent;
      _expiresInSeconds = $v.expiresInSeconds;
      _retryAfterSeconds = $v.retryAfterSeconds;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegistrationCodeResponse other) {
    _$v = other as _$RegistrationCodeResponse;
  }

  @override
  void update(void Function(RegistrationCodeResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegistrationCodeResponse build() => _build();

  _$RegistrationCodeResponse _build() {
    final _$result = _$v ??
        _$RegistrationCodeResponse._(
          emailSent: emailSent,
          expiresInSeconds: expiresInSeconds,
          retryAfterSeconds: retryAfterSeconds,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
