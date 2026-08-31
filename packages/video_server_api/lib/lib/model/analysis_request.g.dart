// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnalysisRequest extends AnalysisRequest {
  @override
  final String skillId;
  @override
  final String outputLanguage;
  @override
  final String? customPrompt;

  factory _$AnalysisRequest([void Function(AnalysisRequestBuilder)? updates]) =>
      (AnalysisRequestBuilder()..update(updates))._build();

  _$AnalysisRequest._(
      {required this.skillId, required this.outputLanguage, this.customPrompt})
      : super._();
  @override
  AnalysisRequest rebuild(void Function(AnalysisRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalysisRequestBuilder toBuilder() => AnalysisRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalysisRequest &&
        skillId == other.skillId &&
        outputLanguage == other.outputLanguage &&
        customPrompt == other.customPrompt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, skillId.hashCode);
    _$hash = $jc(_$hash, outputLanguage.hashCode);
    _$hash = $jc(_$hash, customPrompt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnalysisRequest')
          ..add('skillId', skillId)
          ..add('outputLanguage', outputLanguage)
          ..add('customPrompt', customPrompt))
        .toString();
  }
}

class AnalysisRequestBuilder
    implements Builder<AnalysisRequest, AnalysisRequestBuilder> {
  _$AnalysisRequest? _$v;

  String? _skillId;
  String? get skillId => _$this._skillId;
  set skillId(String? skillId) => _$this._skillId = skillId;

  String? _outputLanguage;
  String? get outputLanguage => _$this._outputLanguage;
  set outputLanguage(String? outputLanguage) =>
      _$this._outputLanguage = outputLanguage;

  String? _customPrompt;
  String? get customPrompt => _$this._customPrompt;
  set customPrompt(String? customPrompt) => _$this._customPrompt = customPrompt;

  AnalysisRequestBuilder() {
    AnalysisRequest._defaults(this);
  }

  AnalysisRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skillId = $v.skillId;
      _outputLanguage = $v.outputLanguage;
      _customPrompt = $v.customPrompt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalysisRequest other) {
    _$v = other as _$AnalysisRequest;
  }

  @override
  void update(void Function(AnalysisRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalysisRequest build() => _build();

  _$AnalysisRequest _build() {
    final _$result = _$v ??
        _$AnalysisRequest._(
          skillId: BuiltValueNullFieldError.checkNotNull(
              skillId, r'AnalysisRequest', 'skillId'),
          outputLanguage: BuiltValueNullFieldError.checkNotNull(
              outputLanguage, r'AnalysisRequest', 'outputLanguage'),
          customPrompt: customPrompt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
