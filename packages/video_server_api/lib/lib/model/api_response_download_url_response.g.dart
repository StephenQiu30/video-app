// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_download_url_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseDownloadUrlResponse extends ApiResponseDownloadUrlResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final DownloadUrlResponse data;

  factory _$ApiResponseDownloadUrlResponse(
          [void Function(ApiResponseDownloadUrlResponseBuilder)? updates]) =>
      (ApiResponseDownloadUrlResponseBuilder()..update(updates))._build();

  _$ApiResponseDownloadUrlResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseDownloadUrlResponse rebuild(
          void Function(ApiResponseDownloadUrlResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseDownloadUrlResponseBuilder toBuilder() =>
      ApiResponseDownloadUrlResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseDownloadUrlResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseDownloadUrlResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseDownloadUrlResponseBuilder
    implements
        Builder<ApiResponseDownloadUrlResponse,
            ApiResponseDownloadUrlResponseBuilder> {
  _$ApiResponseDownloadUrlResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DownloadUrlResponseBuilder? _data;
  DownloadUrlResponseBuilder get data =>
      _$this._data ??= DownloadUrlResponseBuilder();
  set data(DownloadUrlResponseBuilder? data) => _$this._data = data;

  ApiResponseDownloadUrlResponseBuilder() {
    ApiResponseDownloadUrlResponse._defaults(this);
  }

  ApiResponseDownloadUrlResponseBuilder get _$this {
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
  void replace(ApiResponseDownloadUrlResponse other) {
    _$v = other as _$ApiResponseDownloadUrlResponse;
  }

  @override
  void update(void Function(ApiResponseDownloadUrlResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseDownloadUrlResponse build() => _build();

  _$ApiResponseDownloadUrlResponse _build() {
    _$ApiResponseDownloadUrlResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseDownloadUrlResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseDownloadUrlResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseDownloadUrlResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseDownloadUrlResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
