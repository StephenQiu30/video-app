// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_download_analytics_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseDownloadAnalyticsResponse
    extends ApiResponseDownloadAnalyticsResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final DownloadAnalyticsResponse data;

  factory _$ApiResponseDownloadAnalyticsResponse(
          [void Function(ApiResponseDownloadAnalyticsResponseBuilder)?
              updates]) =>
      (ApiResponseDownloadAnalyticsResponseBuilder()..update(updates))._build();

  _$ApiResponseDownloadAnalyticsResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseDownloadAnalyticsResponse rebuild(
          void Function(ApiResponseDownloadAnalyticsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseDownloadAnalyticsResponseBuilder toBuilder() =>
      ApiResponseDownloadAnalyticsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseDownloadAnalyticsResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseDownloadAnalyticsResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseDownloadAnalyticsResponseBuilder
    implements
        Builder<ApiResponseDownloadAnalyticsResponse,
            ApiResponseDownloadAnalyticsResponseBuilder> {
  _$ApiResponseDownloadAnalyticsResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DownloadAnalyticsResponseBuilder? _data;
  DownloadAnalyticsResponseBuilder get data =>
      _$this._data ??= DownloadAnalyticsResponseBuilder();
  set data(DownloadAnalyticsResponseBuilder? data) => _$this._data = data;

  ApiResponseDownloadAnalyticsResponseBuilder() {
    ApiResponseDownloadAnalyticsResponse._defaults(this);
  }

  ApiResponseDownloadAnalyticsResponseBuilder get _$this {
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
  void replace(ApiResponseDownloadAnalyticsResponse other) {
    _$v = other as _$ApiResponseDownloadAnalyticsResponse;
  }

  @override
  void update(
      void Function(ApiResponseDownloadAnalyticsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseDownloadAnalyticsResponse build() => _build();

  _$ApiResponseDownloadAnalyticsResponse _build() {
    _$ApiResponseDownloadAnalyticsResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseDownloadAnalyticsResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseDownloadAnalyticsResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseDownloadAnalyticsResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseDownloadAnalyticsResponse',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
