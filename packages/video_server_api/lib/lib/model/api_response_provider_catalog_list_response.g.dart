// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_provider_catalog_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseProviderCatalogListResponse
    extends ApiResponseProviderCatalogListResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final ProviderCatalogListResponse data;

  factory _$ApiResponseProviderCatalogListResponse(
          [void Function(ApiResponseProviderCatalogListResponseBuilder)?
              updates]) =>
      (ApiResponseProviderCatalogListResponseBuilder()..update(updates))
          ._build();

  _$ApiResponseProviderCatalogListResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseProviderCatalogListResponse rebuild(
          void Function(ApiResponseProviderCatalogListResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseProviderCatalogListResponseBuilder toBuilder() =>
      ApiResponseProviderCatalogListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseProviderCatalogListResponse &&
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
            r'ApiResponseProviderCatalogListResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseProviderCatalogListResponseBuilder
    implements
        Builder<ApiResponseProviderCatalogListResponse,
            ApiResponseProviderCatalogListResponseBuilder> {
  _$ApiResponseProviderCatalogListResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ProviderCatalogListResponseBuilder? _data;
  ProviderCatalogListResponseBuilder get data =>
      _$this._data ??= ProviderCatalogListResponseBuilder();
  set data(ProviderCatalogListResponseBuilder? data) => _$this._data = data;

  ApiResponseProviderCatalogListResponseBuilder() {
    ApiResponseProviderCatalogListResponse._defaults(this);
  }

  ApiResponseProviderCatalogListResponseBuilder get _$this {
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
  void replace(ApiResponseProviderCatalogListResponse other) {
    _$v = other as _$ApiResponseProviderCatalogListResponse;
  }

  @override
  void update(
      void Function(ApiResponseProviderCatalogListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseProviderCatalogListResponse build() => _build();

  _$ApiResponseProviderCatalogListResponse _build() {
    _$ApiResponseProviderCatalogListResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseProviderCatalogListResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseProviderCatalogListResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseProviderCatalogListResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseProviderCatalogListResponse',
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
