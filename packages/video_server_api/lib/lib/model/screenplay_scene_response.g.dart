// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenplay_scene_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ScreenplaySceneResponse extends ScreenplaySceneResponse {
  @override
  final String id;
  @override
  final String sourceSceneId;
  @override
  final String purpose;
  @override
  final String conflict;
  @override
  final String turn;
  @override
  final String pacing;
  @override
  final BuiltList<String> findings;

  factory _$ScreenplaySceneResponse(
          [void Function(ScreenplaySceneResponseBuilder)? updates]) =>
      (ScreenplaySceneResponseBuilder()..update(updates))._build();

  _$ScreenplaySceneResponse._(
      {required this.id,
      required this.sourceSceneId,
      required this.purpose,
      required this.conflict,
      required this.turn,
      required this.pacing,
      required this.findings})
      : super._();
  @override
  ScreenplaySceneResponse rebuild(
          void Function(ScreenplaySceneResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScreenplaySceneResponseBuilder toBuilder() =>
      ScreenplaySceneResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScreenplaySceneResponse &&
        id == other.id &&
        sourceSceneId == other.sourceSceneId &&
        purpose == other.purpose &&
        conflict == other.conflict &&
        turn == other.turn &&
        pacing == other.pacing &&
        findings == other.findings;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, sourceSceneId.hashCode);
    _$hash = $jc(_$hash, purpose.hashCode);
    _$hash = $jc(_$hash, conflict.hashCode);
    _$hash = $jc(_$hash, turn.hashCode);
    _$hash = $jc(_$hash, pacing.hashCode);
    _$hash = $jc(_$hash, findings.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScreenplaySceneResponse')
          ..add('id', id)
          ..add('sourceSceneId', sourceSceneId)
          ..add('purpose', purpose)
          ..add('conflict', conflict)
          ..add('turn', turn)
          ..add('pacing', pacing)
          ..add('findings', findings))
        .toString();
  }
}

class ScreenplaySceneResponseBuilder
    implements
        Builder<ScreenplaySceneResponse, ScreenplaySceneResponseBuilder> {
  _$ScreenplaySceneResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _sourceSceneId;
  String? get sourceSceneId => _$this._sourceSceneId;
  set sourceSceneId(String? sourceSceneId) =>
      _$this._sourceSceneId = sourceSceneId;

  String? _purpose;
  String? get purpose => _$this._purpose;
  set purpose(String? purpose) => _$this._purpose = purpose;

  String? _conflict;
  String? get conflict => _$this._conflict;
  set conflict(String? conflict) => _$this._conflict = conflict;

  String? _turn;
  String? get turn => _$this._turn;
  set turn(String? turn) => _$this._turn = turn;

  String? _pacing;
  String? get pacing => _$this._pacing;
  set pacing(String? pacing) => _$this._pacing = pacing;

  ListBuilder<String>? _findings;
  ListBuilder<String> get findings =>
      _$this._findings ??= ListBuilder<String>();
  set findings(ListBuilder<String>? findings) => _$this._findings = findings;

  ScreenplaySceneResponseBuilder() {
    ScreenplaySceneResponse._defaults(this);
  }

  ScreenplaySceneResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _sourceSceneId = $v.sourceSceneId;
      _purpose = $v.purpose;
      _conflict = $v.conflict;
      _turn = $v.turn;
      _pacing = $v.pacing;
      _findings = $v.findings.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScreenplaySceneResponse other) {
    _$v = other as _$ScreenplaySceneResponse;
  }

  @override
  void update(void Function(ScreenplaySceneResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScreenplaySceneResponse build() => _build();

  _$ScreenplaySceneResponse _build() {
    _$ScreenplaySceneResponse _$result;
    try {
      _$result = _$v ??
          _$ScreenplaySceneResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ScreenplaySceneResponse', 'id'),
            sourceSceneId: BuiltValueNullFieldError.checkNotNull(
                sourceSceneId, r'ScreenplaySceneResponse', 'sourceSceneId'),
            purpose: BuiltValueNullFieldError.checkNotNull(
                purpose, r'ScreenplaySceneResponse', 'purpose'),
            conflict: BuiltValueNullFieldError.checkNotNull(
                conflict, r'ScreenplaySceneResponse', 'conflict'),
            turn: BuiltValueNullFieldError.checkNotNull(
                turn, r'ScreenplaySceneResponse', 'turn'),
            pacing: BuiltValueNullFieldError.checkNotNull(
                pacing, r'ScreenplaySceneResponse', 'pacing'),
            findings: findings.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'findings';
        findings.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ScreenplaySceneResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
