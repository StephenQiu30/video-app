// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_download_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseDownloadResponse extends ApiResponseDownloadResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final DownloadResponse data;

  factory _$ApiResponseDownloadResponse(
          [void Function(ApiResponseDownloadResponseBuilder)? updates]) =>
      (ApiResponseDownloadResponseBuilder()..update(updates))._build();

  _$ApiResponseDownloadResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseDownloadResponse rebuild(
          void Function(ApiResponseDownloadResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseDownloadResponseBuilder toBuilder() =>
      ApiResponseDownloadResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseDownloadResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseDownloadResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseDownloadResponseBuilder
    implements
        Builder<ApiResponseDownloadResponse,
            ApiResponseDownloadResponseBuilder> {
  _$ApiResponseDownloadResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DownloadResponseBuilder? _data;
  DownloadResponseBuilder get data =>
      _$this._data ??= DownloadResponseBuilder();
  set data(DownloadResponseBuilder? data) => _$this._data = data;

  ApiResponseDownloadResponseBuilder() {
    ApiResponseDownloadResponse._defaults(this);
  }

  ApiResponseDownloadResponseBuilder get _$this {
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
  void replace(ApiResponseDownloadResponse other) {
    _$v = other as _$ApiResponseDownloadResponse;
  }

  @override
  void update(void Function(ApiResponseDownloadResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseDownloadResponse build() => _build();

  _$ApiResponseDownloadResponse _build() {
    _$ApiResponseDownloadResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseDownloadResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseDownloadResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseDownloadResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseDownloadResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
