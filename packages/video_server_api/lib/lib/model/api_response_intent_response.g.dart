// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_intent_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseIntentResponse extends ApiResponseIntentResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final IntentResponse data;

  factory _$ApiResponseIntentResponse(
          [void Function(ApiResponseIntentResponseBuilder)? updates]) =>
      (ApiResponseIntentResponseBuilder()..update(updates))._build();

  _$ApiResponseIntentResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseIntentResponse rebuild(
          void Function(ApiResponseIntentResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseIntentResponseBuilder toBuilder() =>
      ApiResponseIntentResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseIntentResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseIntentResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseIntentResponseBuilder
    implements
        Builder<ApiResponseIntentResponse, ApiResponseIntentResponseBuilder> {
  _$ApiResponseIntentResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  IntentResponseBuilder? _data;
  IntentResponseBuilder get data => _$this._data ??= IntentResponseBuilder();
  set data(IntentResponseBuilder? data) => _$this._data = data;

  ApiResponseIntentResponseBuilder() {
    ApiResponseIntentResponse._defaults(this);
  }

  ApiResponseIntentResponseBuilder get _$this {
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
  void replace(ApiResponseIntentResponse other) {
    _$v = other as _$ApiResponseIntentResponse;
  }

  @override
  void update(void Function(ApiResponseIntentResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseIntentResponse build() => _build();

  _$ApiResponseIntentResponse _build() {
    _$ApiResponseIntentResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseIntentResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseIntentResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseIntentResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseIntentResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
