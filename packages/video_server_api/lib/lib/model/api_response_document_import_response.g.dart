// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_document_import_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseDocumentImportResponse
    extends ApiResponseDocumentImportResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final DocumentImportResponse data;

  factory _$ApiResponseDocumentImportResponse(
          [void Function(ApiResponseDocumentImportResponseBuilder)? updates]) =>
      (ApiResponseDocumentImportResponseBuilder()..update(updates))._build();

  _$ApiResponseDocumentImportResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseDocumentImportResponse rebuild(
          void Function(ApiResponseDocumentImportResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseDocumentImportResponseBuilder toBuilder() =>
      ApiResponseDocumentImportResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseDocumentImportResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseDocumentImportResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseDocumentImportResponseBuilder
    implements
        Builder<ApiResponseDocumentImportResponse,
            ApiResponseDocumentImportResponseBuilder> {
  _$ApiResponseDocumentImportResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DocumentImportResponseBuilder? _data;
  DocumentImportResponseBuilder get data =>
      _$this._data ??= DocumentImportResponseBuilder();
  set data(DocumentImportResponseBuilder? data) => _$this._data = data;

  ApiResponseDocumentImportResponseBuilder() {
    ApiResponseDocumentImportResponse._defaults(this);
  }

  ApiResponseDocumentImportResponseBuilder get _$this {
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
  void replace(ApiResponseDocumentImportResponse other) {
    _$v = other as _$ApiResponseDocumentImportResponse;
  }

  @override
  void update(
      void Function(ApiResponseDocumentImportResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseDocumentImportResponse build() => _build();

  _$ApiResponseDocumentImportResponse _build() {
    _$ApiResponseDocumentImportResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseDocumentImportResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseDocumentImportResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseDocumentImportResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseDocumentImportResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
