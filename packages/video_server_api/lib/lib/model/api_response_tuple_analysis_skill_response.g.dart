// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_tuple_analysis_skill_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponseTupleAnalysisSkillResponse
    extends ApiResponseTupleAnalysisSkillResponse {
  @override
  final ErrorCode code;
  @override
  final String message;
  @override
  final BuiltList<AnalysisSkillResponse> data;

  factory _$ApiResponseTupleAnalysisSkillResponse(
          [void Function(ApiResponseTupleAnalysisSkillResponseBuilder)?
              updates]) =>
      (ApiResponseTupleAnalysisSkillResponseBuilder()..update(updates))
          ._build();

  _$ApiResponseTupleAnalysisSkillResponse._(
      {required this.code, required this.message, required this.data})
      : super._();
  @override
  ApiResponseTupleAnalysisSkillResponse rebuild(
          void Function(ApiResponseTupleAnalysisSkillResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseTupleAnalysisSkillResponseBuilder toBuilder() =>
      ApiResponseTupleAnalysisSkillResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponseTupleAnalysisSkillResponse &&
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
            r'ApiResponseTupleAnalysisSkillResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ApiResponseTupleAnalysisSkillResponseBuilder
    implements
        Builder<ApiResponseTupleAnalysisSkillResponse,
            ApiResponseTupleAnalysisSkillResponseBuilder> {
  _$ApiResponseTupleAnalysisSkillResponse? _$v;

  ErrorCode? _code;
  ErrorCode? get code => _$this._code;
  set code(ErrorCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<AnalysisSkillResponse>? _data;
  ListBuilder<AnalysisSkillResponse> get data =>
      _$this._data ??= ListBuilder<AnalysisSkillResponse>();
  set data(ListBuilder<AnalysisSkillResponse>? data) => _$this._data = data;

  ApiResponseTupleAnalysisSkillResponseBuilder() {
    ApiResponseTupleAnalysisSkillResponse._defaults(this);
  }

  ApiResponseTupleAnalysisSkillResponseBuilder get _$this {
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
  void replace(ApiResponseTupleAnalysisSkillResponse other) {
    _$v = other as _$ApiResponseTupleAnalysisSkillResponse;
  }

  @override
  void update(
      void Function(ApiResponseTupleAnalysisSkillResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponseTupleAnalysisSkillResponse build() => _build();

  _$ApiResponseTupleAnalysisSkillResponse _build() {
    _$ApiResponseTupleAnalysisSkillResponse _$result;
    try {
      _$result = _$v ??
          _$ApiResponseTupleAnalysisSkillResponse._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponseTupleAnalysisSkillResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponseTupleAnalysisSkillResponse', 'message'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiResponseTupleAnalysisSkillResponse',
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
