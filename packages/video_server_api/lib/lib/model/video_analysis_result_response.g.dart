// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_analysis_result_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const VideoAnalysisResultResponseKindEnum
    _$videoAnalysisResultResponseKindEnum_videoVisualAnalysis =
    const VideoAnalysisResultResponseKindEnum._('videoVisualAnalysis');
const VideoAnalysisResultResponseKindEnum
    _$videoAnalysisResultResponseKindEnum_unknownDefaultOpenApi =
    const VideoAnalysisResultResponseKindEnum._('unknownDefaultOpenApi');

VideoAnalysisResultResponseKindEnum
    _$videoAnalysisResultResponseKindEnumValueOf(String name) {
  switch (name) {
    case 'videoVisualAnalysis':
      return _$videoAnalysisResultResponseKindEnum_videoVisualAnalysis;
    case 'unknownDefaultOpenApi':
      return _$videoAnalysisResultResponseKindEnum_unknownDefaultOpenApi;
    default:
      return _$videoAnalysisResultResponseKindEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<VideoAnalysisResultResponseKindEnum>
    _$videoAnalysisResultResponseKindEnumValues = BuiltSet<
        VideoAnalysisResultResponseKindEnum>(const <VideoAnalysisResultResponseKindEnum>[
  _$videoAnalysisResultResponseKindEnum_videoVisualAnalysis,
  _$videoAnalysisResultResponseKindEnum_unknownDefaultOpenApi,
]);

Serializer<VideoAnalysisResultResponseKindEnum>
    _$videoAnalysisResultResponseKindEnumSerializer =
    _$VideoAnalysisResultResponseKindEnumSerializer();

class _$VideoAnalysisResultResponseKindEnumSerializer
    implements PrimitiveSerializer<VideoAnalysisResultResponseKindEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'videoVisualAnalysis': 'video_visual_analysis',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'video_visual_analysis': 'videoVisualAnalysis',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    VideoAnalysisResultResponseKindEnum
  ];
  @override
  final String wireName = 'VideoAnalysisResultResponseKindEnum';

  @override
  Object serialize(
          Serializers serializers, VideoAnalysisResultResponseKindEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  VideoAnalysisResultResponseKindEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      VideoAnalysisResultResponseKindEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$VideoAnalysisResultResponse extends VideoAnalysisResultResponse {
  @override
  final VideoAnalysisResultResponseKindEnum kind;
  @override
  final String language;
  @override
  final String title;
  @override
  final EvidenceSummaryResponse summary;
  @override
  final AnalysisMediaResponse media;
  @override
  final int shotCount;
  @override
  final BuiltList<ShotResponse> shots;
  @override
  final BuiltList<VideoSceneResponse> scenes;
  @override
  final BuiltList<HighlightResponse> highlights;
  @override
  final BuiltList<VisualAssetResponse> assets;
  @override
  final ProductionAdviceResponse productionAdvice;

  factory _$VideoAnalysisResultResponse(
          [void Function(VideoAnalysisResultResponseBuilder)? updates]) =>
      (VideoAnalysisResultResponseBuilder()..update(updates))._build();

  _$VideoAnalysisResultResponse._(
      {required this.kind,
      required this.language,
      required this.title,
      required this.summary,
      required this.media,
      required this.shotCount,
      required this.shots,
      required this.scenes,
      required this.highlights,
      required this.assets,
      required this.productionAdvice})
      : super._();
  @override
  VideoAnalysisResultResponse rebuild(
          void Function(VideoAnalysisResultResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoAnalysisResultResponseBuilder toBuilder() =>
      VideoAnalysisResultResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoAnalysisResultResponse &&
        kind == other.kind &&
        language == other.language &&
        title == other.title &&
        summary == other.summary &&
        media == other.media &&
        shotCount == other.shotCount &&
        shots == other.shots &&
        scenes == other.scenes &&
        highlights == other.highlights &&
        assets == other.assets &&
        productionAdvice == other.productionAdvice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, media.hashCode);
    _$hash = $jc(_$hash, shotCount.hashCode);
    _$hash = $jc(_$hash, shots.hashCode);
    _$hash = $jc(_$hash, scenes.hashCode);
    _$hash = $jc(_$hash, highlights.hashCode);
    _$hash = $jc(_$hash, assets.hashCode);
    _$hash = $jc(_$hash, productionAdvice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VideoAnalysisResultResponse')
          ..add('kind', kind)
          ..add('language', language)
          ..add('title', title)
          ..add('summary', summary)
          ..add('media', media)
          ..add('shotCount', shotCount)
          ..add('shots', shots)
          ..add('scenes', scenes)
          ..add('highlights', highlights)
          ..add('assets', assets)
          ..add('productionAdvice', productionAdvice))
        .toString();
  }
}

class VideoAnalysisResultResponseBuilder
    implements
        Builder<VideoAnalysisResultResponse,
            VideoAnalysisResultResponseBuilder> {
  _$VideoAnalysisResultResponse? _$v;

  VideoAnalysisResultResponseKindEnum? _kind;
  VideoAnalysisResultResponseKindEnum? get kind => _$this._kind;
  set kind(VideoAnalysisResultResponseKindEnum? kind) => _$this._kind = kind;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  EvidenceSummaryResponseBuilder? _summary;
  EvidenceSummaryResponseBuilder get summary =>
      _$this._summary ??= EvidenceSummaryResponseBuilder();
  set summary(EvidenceSummaryResponseBuilder? summary) =>
      _$this._summary = summary;

  AnalysisMediaResponseBuilder? _media;
  AnalysisMediaResponseBuilder get media =>
      _$this._media ??= AnalysisMediaResponseBuilder();
  set media(AnalysisMediaResponseBuilder? media) => _$this._media = media;

  int? _shotCount;
  int? get shotCount => _$this._shotCount;
  set shotCount(int? shotCount) => _$this._shotCount = shotCount;

  ListBuilder<ShotResponse>? _shots;
  ListBuilder<ShotResponse> get shots =>
      _$this._shots ??= ListBuilder<ShotResponse>();
  set shots(ListBuilder<ShotResponse>? shots) => _$this._shots = shots;

  ListBuilder<VideoSceneResponse>? _scenes;
  ListBuilder<VideoSceneResponse> get scenes =>
      _$this._scenes ??= ListBuilder<VideoSceneResponse>();
  set scenes(ListBuilder<VideoSceneResponse>? scenes) =>
      _$this._scenes = scenes;

  ListBuilder<HighlightResponse>? _highlights;
  ListBuilder<HighlightResponse> get highlights =>
      _$this._highlights ??= ListBuilder<HighlightResponse>();
  set highlights(ListBuilder<HighlightResponse>? highlights) =>
      _$this._highlights = highlights;

  ListBuilder<VisualAssetResponse>? _assets;
  ListBuilder<VisualAssetResponse> get assets =>
      _$this._assets ??= ListBuilder<VisualAssetResponse>();
  set assets(ListBuilder<VisualAssetResponse>? assets) =>
      _$this._assets = assets;

  ProductionAdviceResponseBuilder? _productionAdvice;
  ProductionAdviceResponseBuilder get productionAdvice =>
      _$this._productionAdvice ??= ProductionAdviceResponseBuilder();
  set productionAdvice(ProductionAdviceResponseBuilder? productionAdvice) =>
      _$this._productionAdvice = productionAdvice;

  VideoAnalysisResultResponseBuilder() {
    VideoAnalysisResultResponse._defaults(this);
  }

  VideoAnalysisResultResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kind = $v.kind;
      _language = $v.language;
      _title = $v.title;
      _summary = $v.summary.toBuilder();
      _media = $v.media.toBuilder();
      _shotCount = $v.shotCount;
      _shots = $v.shots.toBuilder();
      _scenes = $v.scenes.toBuilder();
      _highlights = $v.highlights.toBuilder();
      _assets = $v.assets.toBuilder();
      _productionAdvice = $v.productionAdvice.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoAnalysisResultResponse other) {
    _$v = other as _$VideoAnalysisResultResponse;
  }

  @override
  void update(void Function(VideoAnalysisResultResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VideoAnalysisResultResponse build() => _build();

  _$VideoAnalysisResultResponse _build() {
    _$VideoAnalysisResultResponse _$result;
    try {
      _$result = _$v ??
          _$VideoAnalysisResultResponse._(
            kind: BuiltValueNullFieldError.checkNotNull(
                kind, r'VideoAnalysisResultResponse', 'kind'),
            language: BuiltValueNullFieldError.checkNotNull(
                language, r'VideoAnalysisResultResponse', 'language'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'VideoAnalysisResultResponse', 'title'),
            summary: summary.build(),
            media: media.build(),
            shotCount: BuiltValueNullFieldError.checkNotNull(
                shotCount, r'VideoAnalysisResultResponse', 'shotCount'),
            shots: shots.build(),
            scenes: scenes.build(),
            highlights: highlights.build(),
            assets: assets.build(),
            productionAdvice: productionAdvice.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'summary';
        summary.build();
        _$failedField = 'media';
        media.build();

        _$failedField = 'shots';
        shots.build();
        _$failedField = 'scenes';
        scenes.build();
        _$failedField = 'highlights';
        highlights.build();
        _$failedField = 'assets';
        assets.build();
        _$failedField = 'productionAdvice';
        productionAdvice.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VideoAnalysisResultResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
