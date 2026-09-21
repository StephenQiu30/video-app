// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_analysis_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseAnalysisResponse extends ApiResponseAnalysisResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final AnalysisResponse data;

  factory _$ApiResponseAnalysisResponse(
          [void Function(ApiResponseAnalysisResponseBuilder)? updates]) =>
      (ApiResponseAnalysisResponseBuilder()..update(updates))._build();

  _$ApiResponseAnalysisResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseAnalysisResponse rebuild(
          void Function(ApiResponseAnalysisResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseAnalysisResponseBuilder toBuilder() =>
      ApiResponseAnalysisResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseAnalysisResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseAnalysisResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseAnalysisResponseBuilder
    implements
        Builder<ApiResponseAnalysisResponse,
            ApiResponseAnalysisResponseBuilder> {
  _$ApiResponseAnalysisResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AnalysisResponseBuilder? _data;
  AnalysisResponseBuilder get data =>
      _$this._data ??= AnalysisResponseBuilder();
  set data(AnalysisResponseBuilder? data) => _$this._data = data;

  ApiResponseAnalysisResponseBuilder() {
    ApiResponseAnalysisResponse._defaults(this);
  }

  ApiResponseAnalysisResponseBuilder get _$this {
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
  void replace(ApiResponseAnalysisResponse other) {
    _$v = other as _$ApiResponseAnalysisResponse;
  }

  @override
  void update(void Function(ApiResponseAnalysisResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseAnalysisResponse build() => _build();

  _$ApiResponseAnalysisResponse _build() {
    _$ApiResponseAnalysisResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseAnalysisResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseAnalysisResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseAnalysisResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseAnalysisResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
