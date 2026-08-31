// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenplay_character_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ScreenplayCharacterResponse extends ScreenplayCharacterResponse {
  @override
  final String id;
  @override
  final String name;
  @override
  final String goal;
  @override
  final String conflict;
  @override
  final String arc;
  @override
  final BuiltList<String> evidenceSceneIds;

  factory _$ScreenplayCharacterResponse(
          [void Function(ScreenplayCharacterResponseBuilder)? updates]) =>
      (ScreenplayCharacterResponseBuilder()..update(updates))._build();

  _$ScreenplayCharacterResponse._(
      {required this.id,
      required this.name,
      required this.goal,
      required this.conflict,
      required this.arc,
      required this.evidenceSceneIds})
      : super._();
  @override
  ScreenplayCharacterResponse rebuild(
          void Function(ScreenplayCharacterResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScreenplayCharacterResponseBuilder toBuilder() =>
      ScreenplayCharacterResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScreenplayCharacterResponse &&
        id == other.id &&
        name == other.name &&
        goal == other.goal &&
        conflict == other.conflict &&
        arc == other.arc &&
        evidenceSceneIds == other.evidenceSceneIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, goal.hashCode);
    _$hash = $jc(_$hash, conflict.hashCode);
    _$hash = $jc(_$hash, arc.hashCode);
    _$hash = $jc(_$hash, evidenceSceneIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScreenplayCharacterResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('goal', goal)
          ..add('conflict', conflict)
          ..add('arc', arc)
          ..add('evidenceSceneIds', evidenceSceneIds))
        .toString();
  }
}

class ScreenplayCharacterResponseBuilder
    implements
        Builder<ScreenplayCharacterResponse,
            ScreenplayCharacterResponseBuilder> {
  _$ScreenplayCharacterResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _goal;
  String? get goal => _$this._goal;
  set goal(String? goal) => _$this._goal = goal;

  String? _conflict;
  String? get conflict => _$this._conflict;
  set conflict(String? conflict) => _$this._conflict = conflict;

  String? _arc;
  String? get arc => _$this._arc;
  set arc(String? arc) => _$this._arc = arc;

  ListBuilder<String>? _evidenceSceneIds;
  ListBuilder<String> get evidenceSceneIds =>
      _$this._evidenceSceneIds ??= ListBuilder<String>();
  set evidenceSceneIds(ListBuilder<String>? evidenceSceneIds) =>
      _$this._evidenceSceneIds = evidenceSceneIds;

  ScreenplayCharacterResponseBuilder() {
    ScreenplayCharacterResponse._defaults(this);
  }

  ScreenplayCharacterResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _goal = $v.goal;
      _conflict = $v.conflict;
      _arc = $v.arc;
      _evidenceSceneIds = $v.evidenceSceneIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScreenplayCharacterResponse other) {
    _$v = other as _$ScreenplayCharacterResponse;
  }

  @override
  void update(void Function(ScreenplayCharacterResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScreenplayCharacterResponse build() => _build();

  _$ScreenplayCharacterResponse _build() {
    _$ScreenplayCharacterResponse _$result;
    try {
      _$result = _$v ??
          _$ScreenplayCharacterResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ScreenplayCharacterResponse', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ScreenplayCharacterResponse', 'name'),
            goal: BuiltValueNullFieldError.checkNotNull(
                goal, r'ScreenplayCharacterResponse', 'goal'),
            conflict: BuiltValueNullFieldError.checkNotNull(
                conflict, r'ScreenplayCharacterResponse', 'conflict'),
            arc: BuiltValueNullFieldError.checkNotNull(
                arc, r'ScreenplayCharacterResponse', 'arc'),
            evidenceSceneIds: evidenceSceneIds.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'evidenceSceneIds';
        evidenceSceneIds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ScreenplayCharacterResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
