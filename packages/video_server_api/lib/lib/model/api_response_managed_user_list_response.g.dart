// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_managed_user_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseManagedUserListResponse
    extends ApiResponseManagedUserListResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final ManagedUserListResponse data;

  factory _$ApiResponseManagedUserListResponse(
          [void Function(ApiResponseManagedUserListResponseBuilder)?
              updates]) =>
      (ApiResponseManagedUserListResponseBuilder()..update(updates))._build();

  _$ApiResponseManagedUserListResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseManagedUserListResponse rebuild(
          void Function(ApiResponseManagedUserListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseManagedUserListResponseBuilder toBuilder() =>
      ApiResponseManagedUserListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseManagedUserListResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseManagedUserListResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseManagedUserListResponseBuilder
    implements
        Builder<ApiResponseManagedUserListResponse,
            ApiResponseManagedUserListResponseBuilder> {
  _$ApiResponseManagedUserListResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ManagedUserListResponseBuilder? _data;
  ManagedUserListResponseBuilder get data =>
      _$this._data ??= ManagedUserListResponseBuilder();
  set data(ManagedUserListResponseBuilder? data) => _$this._data = data;

  ApiResponseManagedUserListResponseBuilder() {
    ApiResponseManagedUserListResponse._defaults(this);
  }

  ApiResponseManagedUserListResponseBuilder get _$this {
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
  void replace(ApiResponseManagedUserListResponse other) {
    _$v = other as _$ApiResponseManagedUserListResponse;
  }

  @override
  void update(
      void Function(ApiResponseManagedUserListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseManagedUserListResponse build() => _build();

  _$ApiResponseManagedUserListResponse _build() {
    _$ApiResponseManagedUserListResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseManagedUserListResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseManagedUserListResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseManagedUserListResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseManagedUserListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
