// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_media_upload_session_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseMediaUploadSessionResponse
    extends ApiResponseMediaUploadSessionResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final MediaUploadSessionResponse data;

  factory _$ApiResponseMediaUploadSessionResponse(
          [void Function(ApiResponseMediaUploadSessionResponseBuilder)?
              updates]) =>
      (ApiResponseMediaUploadSessionResponseBuilder()..update(updates))
          ._build();

  _$ApiResponseMediaUploadSessionResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseMediaUploadSessionResponse rebuild(
          void Function(ApiResponseMediaUploadSessionResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseMediaUploadSessionResponseBuilder toBuilder() =>
      ApiResponseMediaUploadSessionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseMediaUploadSessionResponse &&
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
            r'ApiResponseMediaUploadSessionResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseMediaUploadSessionResponseBuilder
    implements
        Builder<ApiResponseMediaUploadSessionResponse,
            ApiResponseMediaUploadSessionResponseBuilder> {
  _$ApiResponseMediaUploadSessionResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  MediaUploadSessionResponseBuilder? _data;
  MediaUploadSessionResponseBuilder get data =>
      _$this._data ??= MediaUploadSessionResponseBuilder();
  set data(MediaUploadSessionResponseBuilder? data) => _$this._data = data;

  ApiResponseMediaUploadSessionResponseBuilder() {
    ApiResponseMediaUploadSessionResponse._defaults(this);
  }

  ApiResponseMediaUploadSessionResponseBuilder get _$this {
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
  void replace(ApiResponseMediaUploadSessionResponse other) {
    _$v = other as _$ApiResponseMediaUploadSessionResponse;
  }

  @override
  void update(
      void Function(ApiResponseMediaUploadSessionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseMediaUploadSessionResponse build() => _build();

  _$ApiResponseMediaUploadSessionResponse _build() {
    _$ApiResponseMediaUploadSessionResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseMediaUploadSessionResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseMediaUploadSessionResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseMediaUploadSessionResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseMediaUploadSessionResponse',
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
