// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_skill_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnalysisSkillResponse extends AnalysisSkillResponse {
  @override
  final String id;
  @override
  final String displayName;
  @override
  final String description;
  @override
  final String defaultPrompt;
  @override
  final BuiltList<AnalysisInputKind> inputKinds;
  @override
  final AnalysisResultContract resultContract;

  factory _$AnalysisSkillResponse(
          [void Function(AnalysisSkillResponseBuilder)? updates]) =>
      (AnalysisSkillResponseBuilder()..update(updates))._build();

  _$AnalysisSkillResponse._(
      {required this.id,
      required this.displayName,
      required this.description,
      required this.defaultPrompt,
      required this.inputKinds,
      required this.resultContract})
      : super._();
  @override
  AnalysisSkillResponse rebuild(
          void Function(AnalysisSkillResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalysisSkillResponseBuilder toBuilder() =>
      AnalysisSkillResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalysisSkillResponse &&
        id == other.id &&
        displayName == other.displayName &&
        description == other.description &&
        defaultPrompt == other.defaultPrompt &&
        inputKinds == other.inputKinds &&
        resultContract == other.resultContract;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, defaultPrompt.hashCode);
    _$hash = $jc(_$hash, inputKinds.hashCode);
    _$hash = $jc(_$hash, resultContract.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnalysisSkillResponse')
          ..add('id', id)
          ..add('displayName', displayName)
          ..add('description', description)
          ..add('defaultPrompt', defaultPrompt)
          ..add('inputKinds', inputKinds)
          ..add('resultContract', resultContract))
        .toString();
  }
}

class AnalysisSkillResponseBuilder
    implements Builder<AnalysisSkillResponse, AnalysisSkillResponseBuilder> {
  _$AnalysisSkillResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _defaultPrompt;
  String? get defaultPrompt => _$this._defaultPrompt;
  set defaultPrompt(String? defaultPrompt) =>
      _$this._defaultPrompt = defaultPrompt;

  ListBuilder<AnalysisInputKind>? _inputKinds;
  ListBuilder<AnalysisInputKind> get inputKinds =>
      _$this._inputKinds ??= ListBuilder<AnalysisInputKind>();
  set inputKinds(ListBuilder<AnalysisInputKind>? inputKinds) =>
      _$this._inputKinds = inputKinds;

  AnalysisResultContract? _resultContract;
  AnalysisResultContract? get resultContract => _$this._resultContract;
  set resultContract(AnalysisResultContract? resultContract) =>
      _$this._resultContract = resultContract;

  AnalysisSkillResponseBuilder() {
    AnalysisSkillResponse._defaults(this);
  }

  AnalysisSkillResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _displayName = $v.displayName;
      _description = $v.description;
      _defaultPrompt = $v.defaultPrompt;
      _inputKinds = $v.inputKinds.toBuilder();
      _resultContract = $v.resultContract;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalysisSkillResponse other) {
    _$v = other as _$AnalysisSkillResponse;
  }

  @override
  void update(void Function(AnalysisSkillResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalysisSkillResponse build() => _build();

  _$AnalysisSkillResponse _build() {
    _$AnalysisSkillResponse _$result;
    try {
      _$result = _$v ??
          _$AnalysisSkillResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AnalysisSkillResponse', 'id'),
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName, r'AnalysisSkillResponse', 'displayName'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'AnalysisSkillResponse', 'description'),
            defaultPrompt: BuiltValueNullFieldError.checkNotNull(
                defaultPrompt, r'AnalysisSkillResponse', 'defaultPrompt'),
            inputKinds: inputKinds.build(),
            resultContract: BuiltValueNullFieldError.checkNotNull(
                resultContract, r'AnalysisSkillResponse', 'resultContract'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'inputKinds';
        inputKinds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AnalysisSkillResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
