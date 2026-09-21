// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_ai_provider_profile_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseAiProviderProfileResponse
    extends ApiResponseAiProviderProfileResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final AiProviderProfileResponse data;

  factory _$ApiResponseAiProviderProfileResponse(
          [void Function(ApiResponseAiProviderProfileResponseBuilder)?
              updates]) =>
      (ApiResponseAiProviderProfileResponseBuilder()..update(updates))._build();

  _$ApiResponseAiProviderProfileResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseAiProviderProfileResponse rebuild(
          void Function(ApiResponseAiProviderProfileResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseAiProviderProfileResponseBuilder toBuilder() =>
      ApiResponseAiProviderProfileResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseAiProviderProfileResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseAiProviderProfileResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseAiProviderProfileResponseBuilder
    implements
        Builder<ApiResponseAiProviderProfileResponse,
            ApiResponseAiProviderProfileResponseBuilder> {
  _$ApiResponseAiProviderProfileResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AiProviderProfileResponseBuilder? _data;
  AiProviderProfileResponseBuilder get data =>
      _$this._data ??= AiProviderProfileResponseBuilder();
  set data(AiProviderProfileResponseBuilder? data) => _$this._data = data;

  ApiResponseAiProviderProfileResponseBuilder() {
    ApiResponseAiProviderProfileResponse._defaults(this);
  }

  ApiResponseAiProviderProfileResponseBuilder get _$this {
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
  void replace(ApiResponseAiProviderProfileResponse other) {
    _$v = other as _$ApiResponseAiProviderProfileResponse;
  }

  @override
  void update(
      void Function(ApiResponseAiProviderProfileResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseAiProviderProfileResponse build() => _build();

  _$ApiResponseAiProviderProfileResponse _build() {
    _$ApiResponseAiProviderProfileResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseAiProviderProfileResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseAiProviderProfileResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseAiProviderProfileResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseAiProviderProfileResponse',
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
