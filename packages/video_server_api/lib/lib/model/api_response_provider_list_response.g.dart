// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_provider_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseProviderListResponse
    extends ApiResponseProviderListResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final ProviderListResponse data;

  factory _$ApiResponseProviderListResponse(
          [void Function(ApiResponseProviderListResponseBuilder)? updates]) =>
      (ApiResponseProviderListResponseBuilder()..update(updates))._build();

  _$ApiResponseProviderListResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseProviderListResponse rebuild(
          void Function(ApiResponseProviderListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseProviderListResponseBuilder toBuilder() =>
      ApiResponseProviderListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseProviderListResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseProviderListResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseProviderListResponseBuilder
    implements
        Builder<ApiResponseProviderListResponse,
            ApiResponseProviderListResponseBuilder> {
  _$ApiResponseProviderListResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ProviderListResponseBuilder? _data;
  ProviderListResponseBuilder get data =>
      _$this._data ??= ProviderListResponseBuilder();
  set data(ProviderListResponseBuilder? data) => _$this._data = data;

  ApiResponseProviderListResponseBuilder() {
    ApiResponseProviderListResponse._defaults(this);
  }

  ApiResponseProviderListResponseBuilder get _$this {
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
  void replace(ApiResponseProviderListResponse other) {
    _$v = other as _$ApiResponseProviderListResponse;
  }

  @override
  void update(void Function(ApiResponseProviderListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseProviderListResponse build() => _build();

  _$ApiResponseProviderListResponse _build() {
    _$ApiResponseProviderListResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseProviderListResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseProviderListResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseProviderListResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseProviderListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
