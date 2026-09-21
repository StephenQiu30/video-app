// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_source_discovery_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseSourceDiscoveryResponse
    extends ApiResponseSourceDiscoveryResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final SourceDiscoveryResponse data;

  factory _$ApiResponseSourceDiscoveryResponse(
          [void Function(ApiResponseSourceDiscoveryResponseBuilder)?
              updates]) =>
      (ApiResponseSourceDiscoveryResponseBuilder()..update(updates))._build();

  _$ApiResponseSourceDiscoveryResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseSourceDiscoveryResponse rebuild(
          void Function(ApiResponseSourceDiscoveryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseSourceDiscoveryResponseBuilder toBuilder() =>
      ApiResponseSourceDiscoveryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseSourceDiscoveryResponse &&
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
    return (newBuiltValueToStringHelper(r'ApiResponseSourceDiscoveryResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseSourceDiscoveryResponseBuilder
    implements
        Builder<ApiResponseSourceDiscoveryResponse,
            ApiResponseSourceDiscoveryResponseBuilder> {
  _$ApiResponseSourceDiscoveryResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  SourceDiscoveryResponseBuilder? _data;
  SourceDiscoveryResponseBuilder get data =>
      _$this._data ??= SourceDiscoveryResponseBuilder();
  set data(SourceDiscoveryResponseBuilder? data) => _$this._data = data;

  ApiResponseSourceDiscoveryResponseBuilder() {
    ApiResponseSourceDiscoveryResponse._defaults(this);
  }

  ApiResponseSourceDiscoveryResponseBuilder get _$this {
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
  void replace(ApiResponseSourceDiscoveryResponse other) {
    _$v = other as _$ApiResponseSourceDiscoveryResponse;
  }

  @override
  void update(
      void Function(ApiResponseSourceDiscoveryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseSourceDiscoveryResponse build() => _build();

  _$ApiResponseSourceDiscoveryResponse _build() {
    _$ApiResponseSourceDiscoveryResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseSourceDiscoveryResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseSourceDiscoveryResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseSourceDiscoveryResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseSourceDiscoveryResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
