// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_document_detail_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseDocumentDetailResponse
    extends ApiResponseDocumentDetailResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final DocumentDetailResponse data;

  factory _$ApiResponseDocumentDetailResponse(
          [void Function(ApiResponseDocumentDetailResponseBuilder)? updates]) =>
      (ApiResponseDocumentDetailResponseBuilder()..update(updates))._build();

  _$ApiResponseDocumentDetailResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseDocumentDetailResponse rebuild(
          void Function(ApiResponseDocumentDetailResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseDocumentDetailResponseBuilder toBuilder() =>
      ApiResponseDocumentDetailResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseDocumentDetailResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseDocumentDetailResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseDocumentDetailResponseBuilder
    implements
        Builder<ApiResponseDocumentDetailResponse,
            ApiResponseDocumentDetailResponseBuilder> {
  _$ApiResponseDocumentDetailResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DocumentDetailResponseBuilder? _data;
  DocumentDetailResponseBuilder get data =>
      _$this._data ??= DocumentDetailResponseBuilder();
  set data(DocumentDetailResponseBuilder? data) => _$this._data = data;

  ApiResponseDocumentDetailResponseBuilder() {
    ApiResponseDocumentDetailResponse._defaults(this);
  }

  ApiResponseDocumentDetailResponseBuilder get _$this {
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
  void replace(ApiResponseDocumentDetailResponse other) {
    _$v = other as _$ApiResponseDocumentDetailResponse;
  }

  @override
  void update(
      void Function(ApiResponseDocumentDetailResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseDocumentDetailResponse build() => _build();

  _$ApiResponseDocumentDetailResponse _build() {
    _$ApiResponseDocumentDetailResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseDocumentDetailResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseDocumentDetailResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseDocumentDetailResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseDocumentDetailResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
