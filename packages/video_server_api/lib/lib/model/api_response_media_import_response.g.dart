// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_media_import_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseMediaImportResponse extends ApiResponseMediaImportResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final MediaImportResponse data;

  factory _$ApiResponseMediaImportResponse(
          [void Function(ApiResponseMediaImportResponseBuilder)? updates]) =>
      (ApiResponseMediaImportResponseBuilder()..update(updates))._build();

  _$ApiResponseMediaImportResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseMediaImportResponse rebuild(
          void Function(ApiResponseMediaImportResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseMediaImportResponseBuilder toBuilder() =>
      ApiResponseMediaImportResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseMediaImportResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseMediaImportResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseMediaImportResponseBuilder
    implements
        Builder<ApiResponseMediaImportResponse,
            ApiResponseMediaImportResponseBuilder> {
  _$ApiResponseMediaImportResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  MediaImportResponseBuilder? _data;
  MediaImportResponseBuilder get data =>
      _$this._data ??= MediaImportResponseBuilder();
  set data(MediaImportResponseBuilder? data) => _$this._data = data;

  ApiResponseMediaImportResponseBuilder() {
    ApiResponseMediaImportResponse._defaults(this);
  }

  ApiResponseMediaImportResponseBuilder get _$this {
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
  void replace(ApiResponseMediaImportResponse other) {
    _$v = other as _$ApiResponseMediaImportResponse;
  }

  @override
  void update(void Function(ApiResponseMediaImportResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseMediaImportResponse build() => _build();

  _$ApiResponseMediaImportResponse _build() {
    _$ApiResponseMediaImportResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseMediaImportResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseMediaImportResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseMediaImportResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseMediaImportResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
