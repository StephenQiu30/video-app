// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_storage_cleanup_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseStorageCleanupResponse
    extends ApiResponseStorageCleanupResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final StorageCleanupResponse data;

  factory _$ApiResponseStorageCleanupResponse(
          [void Function(ApiResponseStorageCleanupResponseBuilder)? updates]) =>
      (ApiResponseStorageCleanupResponseBuilder()..update(updates))._build();

  _$ApiResponseStorageCleanupResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseStorageCleanupResponse rebuild(
          void Function(ApiResponseStorageCleanupResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseStorageCleanupResponseBuilder toBuilder() =>
      ApiResponseStorageCleanupResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseStorageCleanupResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseStorageCleanupResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseStorageCleanupResponseBuilder
    implements
        Builder<ApiResponseStorageCleanupResponse,
            ApiResponseStorageCleanupResponseBuilder> {
  _$ApiResponseStorageCleanupResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  StorageCleanupResponseBuilder? _data;
  StorageCleanupResponseBuilder get data =>
      _$this._data ??= StorageCleanupResponseBuilder();
  set data(StorageCleanupResponseBuilder? data) => _$this._data = data;

  ApiResponseStorageCleanupResponseBuilder() {
    ApiResponseStorageCleanupResponse._defaults(this);
  }

  ApiResponseStorageCleanupResponseBuilder get _$this {
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
  void replace(ApiResponseStorageCleanupResponse other) {
    _$v = other as _$ApiResponseStorageCleanupResponse;
  }

  @override
  void update(
      void Function(ApiResponseStorageCleanupResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseStorageCleanupResponse build() => _build();

  _$ApiResponseStorageCleanupResponse _build() {
    _$ApiResponseStorageCleanupResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseStorageCleanupResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseStorageCleanupResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseStorageCleanupResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseStorageCleanupResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
