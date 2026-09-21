// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_ai_provider_profile_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseAiProviderProfileListResponse
    extends ApiResponseAiProviderProfileListResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final AiProviderProfileListResponse data;

  factory _$ApiResponseAiProviderProfileListResponse(
          [void Function(ApiResponseAiProviderProfileListResponseBuilder)?
              updates]) =>
      (ApiResponseAiProviderProfileListResponseBuilder()..update(updates))
          ._build();

  _$ApiResponseAiProviderProfileListResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseAiProviderProfileListResponse rebuild(
          void Function(ApiResponseAiProviderProfileListResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseAiProviderProfileListResponseBuilder toBuilder() =>
      ApiResponseAiProviderProfileListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseAiProviderProfileListResponse &&
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
            r'ApiResponseAiProviderProfileListResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseAiProviderProfileListResponseBuilder
    implements
        Builder<ApiResponseAiProviderProfileListResponse,
            ApiResponseAiProviderProfileListResponseBuilder> {
  _$ApiResponseAiProviderProfileListResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AiProviderProfileListResponseBuilder? _data;
  AiProviderProfileListResponseBuilder get data =>
      _$this._data ??= AiProviderProfileListResponseBuilder();
  set data(AiProviderProfileListResponseBuilder? data) => _$this._data = data;

  ApiResponseAiProviderProfileListResponseBuilder() {
    ApiResponseAiProviderProfileListResponse._defaults(this);
  }

  ApiResponseAiProviderProfileListResponseBuilder get _$this {
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
  void replace(ApiResponseAiProviderProfileListResponse other) {
    _$v = other as _$ApiResponseAiProviderProfileListResponse;
  }

  @override
  void update(
      void Function(ApiResponseAiProviderProfileListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseAiProviderProfileListResponse build() => _build();

  _$ApiResponseAiProviderProfileListResponse _build() {
    _$ApiResponseAiProviderProfileListResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseAiProviderProfileListResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseAiProviderProfileListResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(message,
                r'ApiResponseAiProviderProfileListResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseAiProviderProfileListResponse',
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
