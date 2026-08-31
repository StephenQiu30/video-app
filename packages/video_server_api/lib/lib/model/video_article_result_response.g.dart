// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_article_result_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const VideoArticleResultResponseKindEnum
    _$videoArticleResultResponseKindEnum_videoArticle =
    const VideoArticleResultResponseKindEnum._('videoArticle');
const VideoArticleResultResponseKindEnum
    _$videoArticleResultResponseKindEnum_unknownDefaultOpenApi =
    const VideoArticleResultResponseKindEnum._('unknownDefaultOpenApi');

VideoArticleResultResponseKindEnum _$videoArticleResultResponseKindEnumValueOf(
    String name) {
  switch (name) {
    case 'videoArticle':
      return _$videoArticleResultResponseKindEnum_videoArticle;
    case 'unknownDefaultOpenApi':
      return _$videoArticleResultResponseKindEnum_unknownDefaultOpenApi;
    default:
      return _$videoArticleResultResponseKindEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<VideoArticleResultResponseKindEnum>
    _$videoArticleResultResponseKindEnumValues = BuiltSet<
        VideoArticleResultResponseKindEnum>(const <VideoArticleResultResponseKindEnum>[
  _$videoArticleResultResponseKindEnum_videoArticle,
  _$videoArticleResultResponseKindEnum_unknownDefaultOpenApi,
]);

Serializer<VideoArticleResultResponseKindEnum>
    _$videoArticleResultResponseKindEnumSerializer =
    _$VideoArticleResultResponseKindEnumSerializer();

class _$VideoArticleResultResponseKindEnumSerializer
    implements PrimitiveSerializer<VideoArticleResultResponseKindEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'videoArticle': 'video_article',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'video_article': 'videoArticle',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[VideoArticleResultResponseKindEnum];
  @override
  final String wireName = 'VideoArticleResultResponseKindEnum';

  @override
  Object serialize(
          Serializers serializers, VideoArticleResultResponseKindEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  VideoArticleResultResponseKindEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      VideoArticleResultResponseKindEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$VideoArticleResultResponse extends VideoArticleResultResponse {
  @override
  final VideoArticleResultResponseKindEnum kind;
  @override
  final String language;
  @override
  final String title;
  @override
  final String lead;
  @override
  final BuiltList<VideoArticleSectionResponse> sections;
  @override
  final BuiltList<String> keyPoints;
  @override
  final String closing;
  @override
  final BuiltList<String> limitations;
  @override
  final AnalysisMediaResponse media;

  factory _$VideoArticleResultResponse(
          [void Function(VideoArticleResultResponseBuilder)? updates]) =>
      (VideoArticleResultResponseBuilder()..update(updates))._build();

  _$VideoArticleResultResponse._(
      {required this.kind,
      required this.language,
      required this.title,
      required this.lead,
      required this.sections,
      required this.keyPoints,
      required this.closing,
      required this.limitations,
      required this.media})
      : super._();
  @override
  VideoArticleResultResponse rebuild(
          void Function(VideoArticleResultResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoArticleResultResponseBuilder toBuilder() =>
      VideoArticleResultResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoArticleResultResponse &&
        kind == other.kind &&
        language == other.language &&
        title == other.title &&
        lead == other.lead &&
        sections == other.sections &&
        keyPoints == other.keyPoints &&
        closing == other.closing &&
        limitations == other.limitations &&
        media == other.media;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, lead.hashCode);
    _$hash = $jc(_$hash, sections.hashCode);
    _$hash = $jc(_$hash, keyPoints.hashCode);
    _$hash = $jc(_$hash, closing.hashCode);
    _$hash = $jc(_$hash, limitations.hashCode);
    _$hash = $jc(_$hash, media.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VideoArticleResultResponse')
          ..add('kind', kind)
          ..add('language', language)
          ..add('title', title)
          ..add('lead', lead)
          ..add('sections', sections)
          ..add('keyPoints', keyPoints)
          ..add('closing', closing)
          ..add('limitations', limitations)
          ..add('media', media))
        .toString();
  }
}

class VideoArticleResultResponseBuilder
    implements
        Builder<VideoArticleResultResponse, VideoArticleResultResponseBuilder> {
  _$VideoArticleResultResponse? _$v;

  VideoArticleResultResponseKindEnum? _kind;
  VideoArticleResultResponseKindEnum? get kind => _$this._kind;
  set kind(VideoArticleResultResponseKindEnum? kind) => _$this._kind = kind;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _lead;
  String? get lead => _$this._lead;
  set lead(String? lead) => _$this._lead = lead;

  ListBuilder<VideoArticleSectionResponse>? _sections;
  ListBuilder<VideoArticleSectionResponse> get sections =>
      _$this._sections ??= ListBuilder<VideoArticleSectionResponse>();
  set sections(ListBuilder<VideoArticleSectionResponse>? sections) =>
      _$this._sections = sections;

  ListBuilder<String>? _keyPoints;
  ListBuilder<String> get keyPoints =>
      _$this._keyPoints ??= ListBuilder<String>();
  set keyPoints(ListBuilder<String>? keyPoints) =>
      _$this._keyPoints = keyPoints;

  String? _closing;
  String? get closing => _$this._closing;
  set closing(String? closing) => _$this._closing = closing;

  ListBuilder<String>? _limitations;
  ListBuilder<String> get limitations =>
      _$this._limitations ??= ListBuilder<String>();
  set limitations(ListBuilder<String>? limitations) =>
      _$this._limitations = limitations;

  AnalysisMediaResponseBuilder? _media;
  AnalysisMediaResponseBuilder get media =>
      _$this._media ??= AnalysisMediaResponseBuilder();
  set media(AnalysisMediaResponseBuilder? media) => _$this._media = media;

  VideoArticleResultResponseBuilder() {
    VideoArticleResultResponse._defaults(this);
  }

  VideoArticleResultResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kind = $v.kind;
      _language = $v.language;
      _title = $v.title;
      _lead = $v.lead;
      _sections = $v.sections.toBuilder();
      _keyPoints = $v.keyPoints.toBuilder();
      _closing = $v.closing;
      _limitations = $v.limitations.toBuilder();
      _media = $v.media.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoArticleResultResponse other) {
    _$v = other as _$VideoArticleResultResponse;
  }

  @override
  void update(void Function(VideoArticleResultResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VideoArticleResultResponse build() => _build();

  _$VideoArticleResultResponse _build() {
    _$VideoArticleResultResponse _$result;
    try {
      _$result = _$v ??
          _$VideoArticleResultResponse._(
            kind: BuiltValueNullFieldError.checkNotNull(
                kind, r'VideoArticleResultResponse', 'kind'),
            language: BuiltValueNullFieldError.checkNotNull(
                language, r'VideoArticleResultResponse', 'language'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'VideoArticleResultResponse', 'title'),
            lead: BuiltValueNullFieldError.checkNotNull(
                lead, r'VideoArticleResultResponse', 'lead'),
            sections: sections.build(),
            keyPoints: keyPoints.build(),
            closing: BuiltValueNullFieldError.checkNotNull(
                closing, r'VideoArticleResultResponse', 'closing'),
            limitations: limitations.build(),
            media: media.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sections';
        sections.build();
        _$failedField = 'keyPoints';
        keyPoints.build();

        _$failedField = 'limitations';
        limitations.build();
        _$failedField = 'media';
        media.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VideoArticleResultResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
