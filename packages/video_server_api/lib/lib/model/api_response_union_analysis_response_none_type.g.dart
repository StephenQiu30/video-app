// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_union_analysis_response_none_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseUnionAnalysisResponseNoneType
    extends ApiResponseUnionAnalysisResponseNoneType {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final AnalysisResponse? data;

  factory _$ApiResponseUnionAnalysisResponseNoneType(
          [void Function(ApiResponseUnionAnalysisResponseNoneTypeBuilder)?
              updates]) =>
      (ApiResponseUnionAnalysisResponseNoneTypeBuilder()..update(updates))
          ._build();

  _$ApiResponseUnionAnalysisResponseNoneType._(
      {required this.code, required this.message, this.data})
      : super._();
  @override
  ApiResponseUnionAnalysisResponseNoneType rebuild(
          void Function(ApiResponseUnionAnalysisResponseNoneTypeBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseUnionAnalysisResponseNoneTypeBuilder toBuilder() =>
      ApiResponseUnionAnalysisResponseNoneTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseUnionAnalysisResponseNoneType &&
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
            r'ApiResponseUnionAnalysisResponseNoneType')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseUnionAnalysisResponseNoneTypeBuilder
    implements
        Builder<ApiResponseUnionAnalysisResponseNoneType,
            ApiResponseUnionAnalysisResponseNoneTypeBuilder> {
  _$ApiResponseUnionAnalysisResponseNoneType? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AnalysisResponseBuilder? _data;
  AnalysisResponseBuilder get data =>
      _$this._data ??= AnalysisResponseBuilder();
  set data(AnalysisResponseBuilder? data) => _$this._data = data;

  ApiResponseUnionAnalysisResponseNoneTypeBuilder() {
    ApiResponseUnionAnalysisResponseNoneType._defaults(this);
  }

  ApiResponseUnionAnalysisResponseNoneTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiResponseUnionAnalysisResponseNoneType other) {
    _$v = other as _$ApiResponseUnionAnalysisResponseNoneType;
  }

  @override
  void update(
      void Function(ApiResponseUnionAnalysisResponseNoneTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseUnionAnalysisResponseNoneType build() => _build();

  _$ApiResponseUnionAnalysisResponseNoneType _build() {
    _$ApiResponseUnionAnalysisResponseNoneType _$result;
    try {
      _$result = _$v ??
          _$ApiResponseUnionAnalysisResponseNoneType._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseUnionAnalysisResponseNoneType', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(message,
                r'ApiResponseUnionAnalysisResponseNoneType', 'message'),
            data: _data?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseUnionAnalysisResponseNoneType',
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
