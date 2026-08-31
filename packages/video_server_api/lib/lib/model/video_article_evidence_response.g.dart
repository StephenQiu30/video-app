// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_article_evidence_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VideoArticleEvidenceResponse extends VideoArticleEvidenceResponse {
  @override
  final int startMs;
  @override
  final int endMs;
  @override
  final String note;

  factory _$VideoArticleEvidenceResponse(
          [void Function(VideoArticleEvidenceResponseBuilder)? updates]) =>
      (VideoArticleEvidenceResponseBuilder()..update(updates))._build();

  _$VideoArticleEvidenceResponse._(
      {required this.startMs, required this.endMs, required this.note})
      : super._();
  @override
  VideoArticleEvidenceResponse rebuild(
          void Function(VideoArticleEvidenceResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoArticleEvidenceResponseBuilder toBuilder() =>
      VideoArticleEvidenceResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoArticleEvidenceResponse &&
        startMs == other.startMs &&
        endMs == other.endMs &&
        note == other.note;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, startMs.hashCode);
    _$hash = $jc(_$hash, endMs.hashCode);
    _$hash = $jc(_$hash, note.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VideoArticleEvidenceResponse')
          ..add('startMs', startMs)
          ..add('endMs', endMs)
          ..add('note', note))
        .toString();
  }
}

class VideoArticleEvidenceResponseBuilder
    implements
        Builder<VideoArticleEvidenceResponse,
            VideoArticleEvidenceResponseBuilder> {
  _$VideoArticleEvidenceResponse? _$v;

  int? _startMs;
  int? get startMs => _$this._startMs;
  set startMs(int? startMs) => _$this._startMs = startMs;

  int? _endMs;
  int? get endMs => _$this._endMs;
  set endMs(int? endMs) => _$this._endMs = endMs;

  String? _note;
  String? get note => _$this._note;
  set note(String? note) => _$this._note = note;

  VideoArticleEvidenceResponseBuilder() {
    VideoArticleEvidenceResponse._defaults(this);
  }

  VideoArticleEvidenceResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startMs = $v.startMs;
      _endMs = $v.endMs;
      _note = $v.note;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoArticleEvidenceResponse other) {
    _$v = other as _$VideoArticleEvidenceResponse;
  }

  @override
  void update(void Function(VideoArticleEvidenceResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VideoArticleEvidenceResponse build() => _build();

  _$VideoArticleEvidenceResponse _build() {
    final _$result = _$v ??
        _$VideoArticleEvidenceResponse._(
          startMs: BuiltValueNullFieldError.checkNotNull(
              startMs, r'VideoArticleEvidenceResponse', 'startMs'),
          endMs: BuiltValueNullFieldError.checkNotNull(
              endMs, r'VideoArticleEvidenceResponse', 'endMs'),
          note: BuiltValueNullFieldError.checkNotNull(
              note, r'VideoArticleEvidenceResponse', 'note'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
