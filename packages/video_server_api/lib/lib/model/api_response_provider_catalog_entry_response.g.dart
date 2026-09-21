// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_provider_catalog_entry_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseProviderCatalogEntryResponse
    extends ApiResponseProviderCatalogEntryResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final ProviderCatalogEntryResponse data;

  factory _$ApiResponseProviderCatalogEntryResponse(
          [void Function(ApiResponseProviderCatalogEntryResponseBuilder)?
              updates]) =>
      (ApiResponseProviderCatalogEntryResponseBuilder()..update(updates))
          ._build();

  _$ApiResponseProviderCatalogEntryResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseProviderCatalogEntryResponse rebuild(
          void Function(ApiResponseProviderCatalogEntryResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseProviderCatalogEntryResponseBuilder toBuilder() =>
      ApiResponseProviderCatalogEntryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseProviderCatalogEntryResponse &&
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
            r'ApiResponseProviderCatalogEntryResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseProviderCatalogEntryResponseBuilder
    implements
        Builder<ApiResponseProviderCatalogEntryResponse,
            ApiResponseProviderCatalogEntryResponseBuilder> {
  _$ApiResponseProviderCatalogEntryResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ProviderCatalogEntryResponseBuilder? _data;
  ProviderCatalogEntryResponseBuilder get data =>
      _$this._data ??= ProviderCatalogEntryResponseBuilder();
  set data(ProviderCatalogEntryResponseBuilder? data) => _$this._data = data;

  ApiResponseProviderCatalogEntryResponseBuilder() {
    ApiResponseProviderCatalogEntryResponse._defaults(this);
  }

  ApiResponseProviderCatalogEntryResponseBuilder get _$this {
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
  void replace(ApiResponseProviderCatalogEntryResponse other) {
    _$v = other as _$ApiResponseProviderCatalogEntryResponse;
  }

  @override
  void update(
      void Function(ApiResponseProviderCatalogEntryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseProviderCatalogEntryResponse build() => _build();

  _$ApiResponseProviderCatalogEntryResponse _build() {
    _$ApiResponseProviderCatalogEntryResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseProviderCatalogEntryResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseProviderCatalogEntryResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseProviderCatalogEntryResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseProviderCatalogEntryResponse',
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
