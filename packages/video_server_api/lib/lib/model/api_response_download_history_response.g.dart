// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_download_history_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseDownloadHistoryResponse
    extends ApiResponseDownloadHistoryResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final DownloadHistoryResponse data;

  factory _$ApiResponseDownloadHistoryResponse(
          [void Function(ApiResponseDownloadHistoryResponseBuilder)?
              updates]) =>
      (ApiResponseDownloadHistoryResponseBuilder()..update(updates))._build();

  _$ApiResponseDownloadHistoryResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseDownloadHistoryResponse rebuild(
          void Function(ApiResponseDownloadHistoryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseDownloadHistoryResponseBuilder toBuilder() =>
      ApiResponseDownloadHistoryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseDownloadHistoryResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseDownloadHistoryResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseDownloadHistoryResponseBuilder
    implements
        Builder<ApiResponseDownloadHistoryResponse,
            ApiResponseDownloadHistoryResponseBuilder> {
  _$ApiResponseDownloadHistoryResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DownloadHistoryResponseBuilder? _data;
  DownloadHistoryResponseBuilder get data =>
      _$this._data ??= DownloadHistoryResponseBuilder();
  set data(DownloadHistoryResponseBuilder? data) => _$this._data = data;

  ApiResponseDownloadHistoryResponseBuilder() {
    ApiResponseDownloadHistoryResponse._defaults(this);
  }

  ApiResponseDownloadHistoryResponseBuilder get _$this {
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
  void replace(ApiResponseDownloadHistoryResponse other) {
    _$v = other as _$ApiResponseDownloadHistoryResponse;
  }

  @override
  void update(
      void Function(ApiResponseDownloadHistoryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseDownloadHistoryResponse build() => _build();

  _$ApiResponseDownloadHistoryResponse _build() {
    _$ApiResponseDownloadHistoryResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseDownloadHistoryResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseDownloadHistoryResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseDownloadHistoryResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseDownloadHistoryResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
