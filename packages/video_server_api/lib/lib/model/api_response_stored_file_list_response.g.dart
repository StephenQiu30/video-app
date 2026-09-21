// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_stored_file_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseStoredFileListResponse
    extends ApiResponseStoredFileListResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final StoredFileListResponse data;

  factory _$ApiResponseStoredFileListResponse(
          [void Function(ApiResponseStoredFileListResponseBuilder)? updates]) =>
      (ApiResponseStoredFileListResponseBuilder()..update(updates))._build();

  _$ApiResponseStoredFileListResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseStoredFileListResponse rebuild(
          void Function(ApiResponseStoredFileListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseStoredFileListResponseBuilder toBuilder() =>
      ApiResponseStoredFileListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseStoredFileListResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseStoredFileListResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseStoredFileListResponseBuilder
    implements
        Builder<ApiResponseStoredFileListResponse,
            ApiResponseStoredFileListResponseBuilder> {
  _$ApiResponseStoredFileListResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  StoredFileListResponseBuilder? _data;
  StoredFileListResponseBuilder get data =>
      _$this._data ??= StoredFileListResponseBuilder();
  set data(StoredFileListResponseBuilder? data) => _$this._data = data;

  ApiResponseStoredFileListResponseBuilder() {
    ApiResponseStoredFileListResponse._defaults(this);
  }

  ApiResponseStoredFileListResponseBuilder get _$this {
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
  void replace(ApiResponseStoredFileListResponse other) {
    _$v = other as _$ApiResponseStoredFileListResponse;
  }

  @override
  void update(
      void Function(ApiResponseStoredFileListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseStoredFileListResponse build() => _build();

  _$ApiResponseStoredFileListResponse _build() {
    _$ApiResponseStoredFileListResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseStoredFileListResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseStoredFileListResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseStoredFileListResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseStoredFileListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
