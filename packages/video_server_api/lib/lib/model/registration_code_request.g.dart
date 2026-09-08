// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_code_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegistrationCodeRequest extends RegistrationCodeRequest {
  @override
  final String email;

  factory _$RegistrationCodeRequest(
          [void Function(RegistrationCodeRequestBuilder)? updates]) =>
      (RegistrationCodeRequestBuilder()..update(updates))._build();

  _$RegistrationCodeRequest._({required this.email}) : super._();
  @override
  RegistrationCodeRequest rebuild(
          void Function(RegistrationCodeRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegistrationCodeRequestBuilder toBuilder() =>
      RegistrationCodeRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegistrationCodeRequest && email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegistrationCodeRequest')
          ..add('email', email))
        .toString();
  }
}

class RegistrationCodeRequestBuilder
    implements
        Builder<RegistrationCodeRequest, RegistrationCodeRequestBuilder> {
  _$RegistrationCodeRequest? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  RegistrationCodeRequestBuilder() {
    RegistrationCodeRequest._defaults(this);
  }

  RegistrationCodeRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegistrationCodeRequest other) {
    _$v = other as _$RegistrationCodeRequest;
  }

  @override
  void update(void Function(RegistrationCodeRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegistrationCodeRequest build() => _build();

  _$RegistrationCodeRequest _build() {
    final _$result = _$v ??
        _$RegistrationCodeRequest._(
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'RegistrationCodeRequest', 'email'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
