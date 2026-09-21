// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_inspection_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseInspectionResponse extends ApiResponseInspectionResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final InspectionResponse data;

  factory _$ApiResponseInspectionResponse(
          [void Function(ApiResponseInspectionResponseBuilder)? updates]) =>
      (ApiResponseInspectionResponseBuilder()..update(updates))._build();

  _$ApiResponseInspectionResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseInspectionResponse rebuild(
          void Function(ApiResponseInspectionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseInspectionResponseBuilder toBuilder() =>
      ApiResponseInspectionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseInspectionResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseInspectionResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseInspectionResponseBuilder
    implements
        Builder<ApiResponseInspectionResponse,
            ApiResponseInspectionResponseBuilder> {
  _$ApiResponseInspectionResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  InspectionResponseBuilder? _data;
  InspectionResponseBuilder get data =>
      _$this._data ??= InspectionResponseBuilder();
  set data(InspectionResponseBuilder? data) => _$this._data = data;

  ApiResponseInspectionResponseBuilder() {
    ApiResponseInspectionResponse._defaults(this);
  }

  ApiResponseInspectionResponseBuilder get _$this {
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
  void replace(ApiResponseInspectionResponse other) {
    _$v = other as _$ApiResponseInspectionResponse;
  }

  @override
  void update(void Function(ApiResponseInspectionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseInspectionResponse build() => _build();

  _$ApiResponseInspectionResponse _build() {
    _$ApiResponseInspectionResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseInspectionResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseInspectionResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseInspectionResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseInspectionResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
