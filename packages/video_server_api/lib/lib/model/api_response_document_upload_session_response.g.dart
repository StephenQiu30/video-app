// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_document_upload_session_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseDocumentUploadSessionResponse
    extends ApiResponseDocumentUploadSessionResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final DocumentUploadSessionResponse data;

  factory _$ApiResponseDocumentUploadSessionResponse(
          [void Function(ApiResponseDocumentUploadSessionResponseBuilder)?
              updates]) =>
      (ApiResponseDocumentUploadSessionResponseBuilder()..update(updates))
          ._build();

  _$ApiResponseDocumentUploadSessionResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseDocumentUploadSessionResponse rebuild(
          void Function(ApiResponseDocumentUploadSessionResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseDocumentUploadSessionResponseBuilder toBuilder() =>
      ApiResponseDocumentUploadSessionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseDocumentUploadSessionResponse &&
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
    return (newBuiltValueToStringHelper(
            r'ApiResponseDocumentUploadSessionResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseDocumentUploadSessionResponseBuilder
    implements
        Builder<ApiResponseDocumentUploadSessionResponse,
            ApiResponseDocumentUploadSessionResponseBuilder> {
  _$ApiResponseDocumentUploadSessionResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DocumentUploadSessionResponseBuilder? _data;
  DocumentUploadSessionResponseBuilder get data =>
      _$this._data ??= DocumentUploadSessionResponseBuilder();
  set data(DocumentUploadSessionResponseBuilder? data) => _$this._data = data;

  ApiResponseDocumentUploadSessionResponseBuilder() {
    ApiResponseDocumentUploadSessionResponse._defaults(this);
  }

  ApiResponseDocumentUploadSessionResponseBuilder get _$this {
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
  void replace(ApiResponseDocumentUploadSessionResponse other) {
    _$v = other as _$ApiResponseDocumentUploadSessionResponse;
  }

  @override
  void update(
      void Function(ApiResponseDocumentUploadSessionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseDocumentUploadSessionResponse build() => _build();

  _$ApiResponseDocumentUploadSessionResponse _build() {
    _$ApiResponseDocumentUploadSessionResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseDocumentUploadSessionResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseDocumentUploadSessionResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(message,
                r'ApiResponseDocumentUploadSessionResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseDocumentUploadSessionResponse',
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
