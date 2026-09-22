// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_intent_history_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseIntentHistoryResponse
    extends ApiResponseIntentHistoryResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final IntentHistoryResponse data;

  factory _$ApiResponseIntentHistoryResponse(
          [void Function(ApiResponseIntentHistoryResponseBuilder)? updates]) =>
      (ApiResponseIntentHistoryResponseBuilder()..update(updates))._build();

  _$ApiResponseIntentHistoryResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseIntentHistoryResponse rebuild(
          void Function(ApiResponseIntentHistoryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseIntentHistoryResponseBuilder toBuilder() =>
      ApiResponseIntentHistoryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseIntentHistoryResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseIntentHistoryResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseIntentHistoryResponseBuilder
    implements
        Builder<ApiResponseIntentHistoryResponse,
            ApiResponseIntentHistoryResponseBuilder> {
  _$ApiResponseIntentHistoryResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  IntentHistoryResponseBuilder? _data;
  IntentHistoryResponseBuilder get data =>
      _$this._data ??= IntentHistoryResponseBuilder();
  set data(IntentHistoryResponseBuilder? data) => _$this._data = data;

  ApiResponseIntentHistoryResponseBuilder() {
    ApiResponseIntentHistoryResponse._defaults(this);
  }

  ApiResponseIntentHistoryResponseBuilder get _$this {
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
  void replace(ApiResponseIntentHistoryResponse other) {
    _$v = other as _$ApiResponseIntentHistoryResponse;
  }

  @override
  void update(void Function(ApiResponseIntentHistoryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseIntentHistoryResponse build() => _build();

  _$ApiResponseIntentHistoryResponse _build() {
    _$ApiResponseIntentHistoryResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseIntentHistoryResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseIntentHistoryResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseIntentHistoryResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseIntentHistoryResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
