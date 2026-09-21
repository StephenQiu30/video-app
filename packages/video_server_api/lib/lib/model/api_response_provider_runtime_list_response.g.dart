// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_provider_runtime_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseProviderRuntimeListResponse
    extends ApiResponseProviderRuntimeListResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final ProviderRuntimeListResponse data;

  factory _$ApiResponseProviderRuntimeListResponse(
          [void Function(ApiResponseProviderRuntimeListResponseBuilder)?
              updates]) =>
      (ApiResponseProviderRuntimeListResponseBuilder()..update(updates))
          ._build();

  _$ApiResponseProviderRuntimeListResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseProviderRuntimeListResponse rebuild(
          void Function(ApiResponseProviderRuntimeListResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseProviderRuntimeListResponseBuilder toBuilder() =>
      ApiResponseProviderRuntimeListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseProviderRuntimeListResponse &&
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
            r'ApiResponseProviderRuntimeListResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseProviderRuntimeListResponseBuilder
    implements
        Builder<ApiResponseProviderRuntimeListResponse,
            ApiResponseProviderRuntimeListResponseBuilder> {
  _$ApiResponseProviderRuntimeListResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ProviderRuntimeListResponseBuilder? _data;
  ProviderRuntimeListResponseBuilder get data =>
      _$this._data ??= ProviderRuntimeListResponseBuilder();
  set data(ProviderRuntimeListResponseBuilder? data) => _$this._data = data;

  ApiResponseProviderRuntimeListResponseBuilder() {
    ApiResponseProviderRuntimeListResponse._defaults(this);
  }

  ApiResponseProviderRuntimeListResponseBuilder get _$this {
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
  void replace(ApiResponseProviderRuntimeListResponse other) {
    _$v = other as _$ApiResponseProviderRuntimeListResponse;
  }

  @override
  void update(
      void Function(ApiResponseProviderRuntimeListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseProviderRuntimeListResponse build() => _build();

  _$ApiResponseProviderRuntimeListResponse _build() {
    _$ApiResponseProviderRuntimeListResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseProviderRuntimeListResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseProviderRuntimeListResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseProviderRuntimeListResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseProviderRuntimeListResponse',
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
