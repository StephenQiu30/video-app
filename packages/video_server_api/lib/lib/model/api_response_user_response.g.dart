// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_user_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseUserResponse extends ApiResponseUserResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final UserResponse data;

  factory _$ApiResponseUserResponse(
          [void Function(ApiResponseUserResponseBuilder)? updates]) =>
      (ApiResponseUserResponseBuilder()..update(updates))._build();

  _$ApiResponseUserResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseUserResponse rebuild(
          void Function(ApiResponseUserResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseUserResponseBuilder toBuilder() =>
      ApiResponseUserResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseUserResponse &&
        code == other.code &&
        message == other.message &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiResponseUserResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseUserResponseBuilder
    implements
        Builder<ApiResponseUserResponse, ApiResponseUserResponseBuilder> {
  _$ApiResponseUserResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  UserResponseBuilder? _data;
  UserResponseBuilder get data => _$this._data ??= UserResponseBuilder();
  set data(UserResponseBuilder? data) => _$this._data = data;

  ApiResponseUserResponseBuilder() {
    ApiResponseUserResponse._defaults(this);
  }

  ApiResponseUserResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiResponseUserResponse other) {
    _$v = other as _$ApiResponseUserResponse;
  }

  @override
  void update(void Function(ApiResponseUserResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseUserResponse build() => _build();

  _$ApiResponseUserResponse _build() {
    _$ApiResponseUserResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseUserResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseUserResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseUserResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseUserResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
