// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_password_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EmailPasswordRequest extends EmailPasswordRequest {
  @override
  final String email;
  @override
  final String password;

  factory _$EmailPasswordRequest(
          [void Function(EmailPasswordRequestBuilder)? updates]) =>
      (EmailPasswordRequestBuilder()..update(updates))._build();

  _$EmailPasswordRequest._({required this.email, required this.password})
      : super._();
  @override
  EmailPasswordRequest rebuild(
          void Function(EmailPasswordRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmailPasswordRequestBuilder toBuilder() =>
      EmailPasswordRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmailPasswordRequest &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EmailPasswordRequest')
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class EmailPasswordRequestBuilder
    implements Builder<EmailPasswordRequest, EmailPasswordRequestBuilder> {
  _$EmailPasswordRequest? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  EmailPasswordRequestBuilder() {
    EmailPasswordRequest._defaults(this);
  }

  EmailPasswordRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EmailPasswordRequest other) {
    _$v = other as _$EmailPasswordRequest;
  }

  @override
  void update(void Function(EmailPasswordRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EmailPasswordRequest build() => _build();

  _$EmailPasswordRequest _build() {
    final _$result = _$v ??
        _$EmailPasswordRequest._(
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'EmailPasswordRequest', 'email'),
          password: BuiltValueNullFieldError.checkNotNull(
              password, r'EmailPasswordRequest', 'password'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
