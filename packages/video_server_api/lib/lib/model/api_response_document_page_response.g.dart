// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_document_page_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseDocumentPageResponse
    extends ApiResponseDocumentPageResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final DocumentPageResponse data;

  factory _$ApiResponseDocumentPageResponse(
          [void Function(ApiResponseDocumentPageResponseBuilder)? updates]) =>
      (ApiResponseDocumentPageResponseBuilder()..update(updates))._build();

  _$ApiResponseDocumentPageResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseDocumentPageResponse rebuild(
          void Function(ApiResponseDocumentPageResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseDocumentPageResponseBuilder toBuilder() =>
      ApiResponseDocumentPageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseDocumentPageResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseDocumentPageResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseDocumentPageResponseBuilder
    implements
        Builder<ApiResponseDocumentPageResponse,
            ApiResponseDocumentPageResponseBuilder> {
  _$ApiResponseDocumentPageResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DocumentPageResponseBuilder? _data;
  DocumentPageResponseBuilder get data =>
      _$this._data ??= DocumentPageResponseBuilder();
  set data(DocumentPageResponseBuilder? data) => _$this._data = data;

  ApiResponseDocumentPageResponseBuilder() {
    ApiResponseDocumentPageResponse._defaults(this);
  }

  ApiResponseDocumentPageResponseBuilder get _$this {
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
  void replace(ApiResponseDocumentPageResponse other) {
    _$v = other as _$ApiResponseDocumentPageResponse;
  }

  @override
  void update(void Function(ApiResponseDocumentPageResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseDocumentPageResponse build() => _build();

  _$ApiResponseDocumentPageResponse _build() {
    _$ApiResponseDocumentPageResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseDocumentPageResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseDocumentPageResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseDocumentPageResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseDocumentPageResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
