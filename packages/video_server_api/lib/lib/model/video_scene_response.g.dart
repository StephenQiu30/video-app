// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_scene_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VideoSceneResponse extends VideoSceneResponse {
  @override
  final String id;
  @override
  final int index;
  @override
  final String title;
  @override
  final int startMs;
  @override
  final int endMs;
  @override
  final String location;
  @override
  final String description;
  @override
  final String narrativeFunction;
  @override
  final BuiltList<String> visualRules;
  @override
  final BuiltList<String> continuityRisks;
  @override
  final BuiltList<String> evidenceShotIds;

  factory _$VideoSceneResponse(
          [void Function(VideoSceneResponseBuilder)? updates]) =>
      (VideoSceneResponseBuilder()..update(updates))._build();

  _$VideoSceneResponse._(
      {required this.id,
      required this.index,
      required this.title,
      required this.startMs,
      required this.endMs,
      required this.location,
      required this.description,
      required this.narrativeFunction,
      required this.visualRules,
      required this.continuityRisks,
      required this.evidenceShotIds})
      : super._();
  @override
  VideoSceneResponse rebuild(
          void Function(VideoSceneResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoSceneResponseBuilder toBuilder() =>
      VideoSceneResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoSceneResponse &&
        id == other.id &&
        index == other.index &&
        title == other.title &&
        startMs == other.startMs &&
        endMs == other.endMs &&
        location == other.location &&
        description == other.description &&
        narrativeFunction == other.narrativeFunction &&
        visualRules == other.visualRules &&
        continuityRisks == other.continuityRisks &&
        evidenceShotIds == other.evidenceShotIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, index.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, startMs.hashCode);
    _$hash = $jc(_$hash, endMs.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, narrativeFunction.hashCode);
    _$hash = $jc(_$hash, visualRules.hashCode);
    _$hash = $jc(_$hash, continuityRisks.hashCode);
    _$hash = $jc(_$hash, evidenceShotIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VideoSceneResponse')
          ..add('id', id)
          ..add('index', index)
          ..add('title', title)
          ..add('startMs', startMs)
          ..add('endMs', endMs)
          ..add('location', location)
          ..add('description', description)
          ..add('narrativeFunction', narrativeFunction)
          ..add('visualRules', visualRules)
          ..add('continuityRisks', continuityRisks)
          ..add('evidenceShotIds', evidenceShotIds))
        .toString();
  }
}

class VideoSceneResponseBuilder
    implements Builder<VideoSceneResponse, VideoSceneResponseBuilder> {
  _$VideoSceneResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _startMs;
  int? get startMs => _$this._startMs;
  set startMs(int? startMs) => _$this._startMs = startMs;

  int? _endMs;
  int? get endMs => _$this._endMs;
  set endMs(int? endMs) => _$this._endMs = endMs;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _narrativeFunction;
  String? get narrativeFunction => _$this._narrativeFunction;
  set narrativeFunction(String? narrativeFunction) =>
      _$this._narrativeFunction = narrativeFunction;

  ListBuilder<String>? _visualRules;
  ListBuilder<String> get visualRules =>
      _$this._visualRules ??= ListBuilder<String>();
  set visualRules(ListBuilder<String>? visualRules) =>
      _$this._visualRules = visualRules;

  ListBuilder<String>? _continuityRisks;
  ListBuilder<String> get continuityRisks =>
      _$this._continuityRisks ??= ListBuilder<String>();
  set continuityRisks(ListBuilder<String>? continuityRisks) =>
      _$this._continuityRisks = continuityRisks;

  ListBuilder<String>? _evidenceShotIds;
  ListBuilder<String> get evidenceShotIds =>
      _$this._evidenceShotIds ??= ListBuilder<String>();
  set evidenceShotIds(ListBuilder<String>? evidenceShotIds) =>
      _$this._evidenceShotIds = evidenceShotIds;

  VideoSceneResponseBuilder() {
    VideoSceneResponse._defaults(this);
  }

  VideoSceneResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _index = $v.index;
      _title = $v.title;
      _startMs = $v.startMs;
      _endMs = $v.endMs;
      _location = $v.location;
      _description = $v.description;
      _narrativeFunction = $v.narrativeFunction;
      _visualRules = $v.visualRules.toBuilder();
      _continuityRisks = $v.continuityRisks.toBuilder();
      _evidenceShotIds = $v.evidenceShotIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoSceneResponse other) {
    _$v = other as _$VideoSceneResponse;
  }

  @override
  void update(void Function(VideoSceneResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VideoSceneResponse build() => _build();

  _$VideoSceneResponse _build() {
    _$VideoSceneResponse _$result;
    try {
      _$result = _$v ??
          _$VideoSceneResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'VideoSceneResponse', 'id'),
            index: BuiltValueNullFieldError.checkNotNull(
                index, r'VideoSceneResponse', 'index'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'VideoSceneResponse', 'title'),
            startMs: BuiltValueNullFieldError.checkNotNull(
                startMs, r'VideoSceneResponse', 'startMs'),
            endMs: BuiltValueNullFieldError.checkNotNull(
                endMs, r'VideoSceneResponse', 'endMs'),
            location: BuiltValueNullFieldError.checkNotNull(
                location, r'VideoSceneResponse', 'location'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'VideoSceneResponse', 'description'),
            narrativeFunction: BuiltValueNullFieldError.checkNotNull(
                narrativeFunction, r'VideoSceneResponse', 'narrativeFunction'),
            visualRules: visualRules.build(),
            continuityRisks: continuityRisks.build(),
            evidenceShotIds: evidenceShotIds.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'visualRules';
        visualRules.build();
        _$failedField = 'continuityRisks';
        continuityRisks.build();
        _$failedField = 'evidenceShotIds';
        evidenceShotIds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VideoSceneResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
