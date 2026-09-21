// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_managed_user_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseManagedUserResponse extends ApiResponseManagedUserResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final ManagedUserResponse data;

  factory _$ApiResponseManagedUserResponse(
          [void Function(ApiResponseManagedUserResponseBuilder)? updates]) =>
      (ApiResponseManagedUserResponseBuilder()..update(updates))._build();

  _$ApiResponseManagedUserResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseManagedUserResponse rebuild(
          void Function(ApiResponseManagedUserResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseManagedUserResponseBuilder toBuilder() =>
      ApiResponseManagedUserResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseManagedUserResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseManagedUserResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseManagedUserResponseBuilder
    implements
        Builder<ApiResponseManagedUserResponse,
            ApiResponseManagedUserResponseBuilder> {
  _$ApiResponseManagedUserResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ManagedUserResponseBuilder? _data;
  ManagedUserResponseBuilder get data =>
      _$this._data ??= ManagedUserResponseBuilder();
  set data(ManagedUserResponseBuilder? data) => _$this._data = data;

  ApiResponseManagedUserResponseBuilder() {
    ApiResponseManagedUserResponse._defaults(this);
  }

  ApiResponseManagedUserResponseBuilder get _$this {
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
  void replace(ApiResponseManagedUserResponse other) {
    _$v = other as _$ApiResponseManagedUserResponse;
  }

  @override
  void update(void Function(ApiResponseManagedUserResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseManagedUserResponse build() => _build();

  _$ApiResponseManagedUserResponse _build() {
    _$ApiResponseManagedUserResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseManagedUserResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseManagedUserResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseManagedUserResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseManagedUserResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
