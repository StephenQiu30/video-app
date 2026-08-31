// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlight_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HighlightResponse extends HighlightResponse {
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final int score;
  @override
  final String reason;
  @override
  final int startMs;
  @override
  final int endMs;
  @override
  final BuiltList<String> evidenceShotIds;

  factory _$HighlightResponse(
          [void Function(HighlightResponseBuilder)? updates]) =>
      (HighlightResponseBuilder()..update(updates))._build();

  _$HighlightResponse._(
      {required this.id,
      required this.title,
      required this.description,
      required this.score,
      required this.reason,
      required this.startMs,
      required this.endMs,
      required this.evidenceShotIds})
      : super._();
  @override
  HighlightResponse rebuild(void Function(HighlightResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HighlightResponseBuilder toBuilder() =>
      HighlightResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HighlightResponse &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        score == other.score &&
        reason == other.reason &&
        startMs == other.startMs &&
        endMs == other.endMs &&
        evidenceShotIds == other.evidenceShotIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, score.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, startMs.hashCode);
    _$hash = $jc(_$hash, endMs.hashCode);
    _$hash = $jc(_$hash, evidenceShotIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HighlightResponse')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('score', score)
          ..add('reason', reason)
          ..add('startMs', startMs)
          ..add('endMs', endMs)
          ..add('evidenceShotIds', evidenceShotIds))
        .toString();
  }
}

class HighlightResponseBuilder
    implements Builder<HighlightResponse, HighlightResponseBuilder> {
  _$HighlightResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _score;
  int? get score => _$this._score;
  set score(int? score) => _$this._score = score;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  int? _startMs;
  int? get startMs => _$this._startMs;
  set startMs(int? startMs) => _$this._startMs = startMs;

  int? _endMs;
  int? get endMs => _$this._endMs;
  set endMs(int? endMs) => _$this._endMs = endMs;

  ListBuilder<String>? _evidenceShotIds;
  ListBuilder<String> get evidenceShotIds =>
      _$this._evidenceShotIds ??= ListBuilder<String>();
  set evidenceShotIds(ListBuilder<String>? evidenceShotIds) =>
      _$this._evidenceShotIds = evidenceShotIds;

  HighlightResponseBuilder() {
    HighlightResponse._defaults(this);
  }

  HighlightResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _score = $v.score;
      _reason = $v.reason;
      _startMs = $v.startMs;
      _endMs = $v.endMs;
      _evidenceShotIds = $v.evidenceShotIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HighlightResponse other) {
    _$v = other as _$HighlightResponse;
  }

  @override
  void update(void Function(HighlightResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HighlightResponse build() => _build();

  _$HighlightResponse _build() {
    _$HighlightResponse _$result;
    try {
      _$result = _$v ??
          _$HighlightResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'HighlightResponse', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'HighlightResponse', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'HighlightResponse', 'description'),
            score: BuiltValueNullFieldError.checkNotNull(
                score, r'HighlightResponse', 'score'),
            reason: BuiltValueNullFieldError.checkNotNull(
                reason, r'HighlightResponse', 'reason'),
            startMs: BuiltValueNullFieldError.checkNotNull(
                startMs, r'HighlightResponse', 'startMs'),
            endMs: BuiltValueNullFieldError.checkNotNull(
                endMs, r'HighlightResponse', 'endMs'),
            evidenceShotIds: evidenceShotIds.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'evidenceShotIds';
        evidenceShotIds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'HighlightResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
