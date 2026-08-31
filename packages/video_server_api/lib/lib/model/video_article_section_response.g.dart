// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_article_section_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VideoArticleSectionResponse extends VideoArticleSectionResponse {
  @override
  final String id;
  @override
  final String title;
  @override
  final String body;
  @override
  final BuiltList<VideoArticleEvidenceResponse> evidence;

  factory _$VideoArticleSectionResponse(
          [void Function(VideoArticleSectionResponseBuilder)? updates]) =>
      (VideoArticleSectionResponseBuilder()..update(updates))._build();

  _$VideoArticleSectionResponse._(
      {required this.id,
      required this.title,
      required this.body,
      required this.evidence})
      : super._();
  @override
  VideoArticleSectionResponse rebuild(
          void Function(VideoArticleSectionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoArticleSectionResponseBuilder toBuilder() =>
      VideoArticleSectionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoArticleSectionResponse &&
        id == other.id &&
        title == other.title &&
        body == other.body &&
        evidence == other.evidence;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, evidence.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VideoArticleSectionResponse')
          ..add('id', id)
          ..add('title', title)
          ..add('body', body)
          ..add('evidence', evidence))
        .toString();
  }
}

class VideoArticleSectionResponseBuilder
    implements
        Builder<VideoArticleSectionResponse,
            VideoArticleSectionResponseBuilder> {
  _$VideoArticleSectionResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  ListBuilder<VideoArticleEvidenceResponse>? _evidence;
  ListBuilder<VideoArticleEvidenceResponse> get evidence =>
      _$this._evidence ??= ListBuilder<VideoArticleEvidenceResponse>();
  set evidence(ListBuilder<VideoArticleEvidenceResponse>? evidence) =>
      _$this._evidence = evidence;

  VideoArticleSectionResponseBuilder() {
    VideoArticleSectionResponse._defaults(this);
  }

  VideoArticleSectionResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _body = $v.body;
      _evidence = $v.evidence.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoArticleSectionResponse other) {
    _$v = other as _$VideoArticleSectionResponse;
  }

  @override
  void update(void Function(VideoArticleSectionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VideoArticleSectionResponse build() => _build();

  _$VideoArticleSectionResponse _build() {
    _$VideoArticleSectionResponse _$result;
    try {
      _$result = _$v ??
          _$VideoArticleSectionResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'VideoArticleSectionResponse', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'VideoArticleSectionResponse', 'title'),
            body: BuiltValueNullFieldError.checkNotNull(
                body, r'VideoArticleSectionResponse', 'body'),
            evidence: evidence.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'evidence';
        evidence.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VideoArticleSectionResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
