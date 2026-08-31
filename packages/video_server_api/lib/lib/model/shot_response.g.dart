// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shot_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShotResponse extends ShotResponse {
  @override
  final String id;
  @override
  final int index;
  @override
  final int startMs;
  @override
  final int endMs;
  @override
  final int representativeFrameMs;
  @override
  final String description;
  @override
  final String transitionIn;
  @override
  final String shotSize;
  @override
  final String cameraMotion;
  @override
  final String narrativeFunction;
  @override
  final int highlightScore;
  @override
  final BuiltList<String> visualTags;
  @override
  final BuiltList<String> assetIds;

  factory _$ShotResponse([void Function(ShotResponseBuilder)? updates]) =>
      (ShotResponseBuilder()..update(updates))._build();

  _$ShotResponse._(
      {required this.id,
      required this.index,
      required this.startMs,
      required this.endMs,
      required this.representativeFrameMs,
      required this.description,
      required this.transitionIn,
      required this.shotSize,
      required this.cameraMotion,
      required this.narrativeFunction,
      required this.highlightScore,
      required this.visualTags,
      required this.assetIds})
      : super._();
  @override
  ShotResponse rebuild(void Function(ShotResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShotResponseBuilder toBuilder() => ShotResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShotResponse &&
        id == other.id &&
        index == other.index &&
        startMs == other.startMs &&
        endMs == other.endMs &&
        representativeFrameMs == other.representativeFrameMs &&
        description == other.description &&
        transitionIn == other.transitionIn &&
        shotSize == other.shotSize &&
        cameraMotion == other.cameraMotion &&
        narrativeFunction == other.narrativeFunction &&
        highlightScore == other.highlightScore &&
        visualTags == other.visualTags &&
        assetIds == other.assetIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, index.hashCode);
    _$hash = $jc(_$hash, startMs.hashCode);
    _$hash = $jc(_$hash, endMs.hashCode);
    _$hash = $jc(_$hash, representativeFrameMs.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, transitionIn.hashCode);
    _$hash = $jc(_$hash, shotSize.hashCode);
    _$hash = $jc(_$hash, cameraMotion.hashCode);
    _$hash = $jc(_$hash, narrativeFunction.hashCode);
    _$hash = $jc(_$hash, highlightScore.hashCode);
    _$hash = $jc(_$hash, visualTags.hashCode);
    _$hash = $jc(_$hash, assetIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShotResponse')
          ..add('id', id)
          ..add('index', index)
          ..add('startMs', startMs)
          ..add('endMs', endMs)
          ..add('representativeFrameMs', representativeFrameMs)
          ..add('description', description)
          ..add('transitionIn', transitionIn)
          ..add('shotSize', shotSize)
          ..add('cameraMotion', cameraMotion)
          ..add('narrativeFunction', narrativeFunction)
          ..add('highlightScore', highlightScore)
          ..add('visualTags', visualTags)
          ..add('assetIds', assetIds))
        .toString();
  }
}

class ShotResponseBuilder
    implements Builder<ShotResponse, ShotResponseBuilder> {
  _$ShotResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  int? _startMs;
  int? get startMs => _$this._startMs;
  set startMs(int? startMs) => _$this._startMs = startMs;

  int? _endMs;
  int? get endMs => _$this._endMs;
  set endMs(int? endMs) => _$this._endMs = endMs;

  int? _representativeFrameMs;
  int? get representativeFrameMs => _$this._representativeFrameMs;
  set representativeFrameMs(int? representativeFrameMs) =>
      _$this._representativeFrameMs = representativeFrameMs;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _transitionIn;
  String? get transitionIn => _$this._transitionIn;
  set transitionIn(String? transitionIn) => _$this._transitionIn = transitionIn;

  String? _shotSize;
  String? get shotSize => _$this._shotSize;
  set shotSize(String? shotSize) => _$this._shotSize = shotSize;

  String? _cameraMotion;
  String? get cameraMotion => _$this._cameraMotion;
  set cameraMotion(String? cameraMotion) => _$this._cameraMotion = cameraMotion;

  String? _narrativeFunction;
  String? get narrativeFunction => _$this._narrativeFunction;
  set narrativeFunction(String? narrativeFunction) =>
      _$this._narrativeFunction = narrativeFunction;

  int? _highlightScore;
  int? get highlightScore => _$this._highlightScore;
  set highlightScore(int? highlightScore) =>
      _$this._highlightScore = highlightScore;

  ListBuilder<String>? _visualTags;
  ListBuilder<String> get visualTags =>
      _$this._visualTags ??= ListBuilder<String>();
  set visualTags(ListBuilder<String>? visualTags) =>
      _$this._visualTags = visualTags;

  ListBuilder<String>? _assetIds;
  ListBuilder<String> get assetIds =>
      _$this._assetIds ??= ListBuilder<String>();
  set assetIds(ListBuilder<String>? assetIds) => _$this._assetIds = assetIds;

  ShotResponseBuilder() {
    ShotResponse._defaults(this);
  }

  ShotResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _index = $v.index;
      _startMs = $v.startMs;
      _endMs = $v.endMs;
      _representativeFrameMs = $v.representativeFrameMs;
      _description = $v.description;
      _transitionIn = $v.transitionIn;
      _shotSize = $v.shotSize;
      _cameraMotion = $v.cameraMotion;
      _narrativeFunction = $v.narrativeFunction;
      _highlightScore = $v.highlightScore;
      _visualTags = $v.visualTags.toBuilder();
      _assetIds = $v.assetIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShotResponse other) {
    _$v = other as _$ShotResponse;
  }

  @override
  void update(void Function(ShotResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShotResponse build() => _build();

  _$ShotResponse _build() {
    _$ShotResponse _$result;
    try {
      _$result = _$v ??
          _$ShotResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ShotResponse', 'id'),
            index: BuiltValueNullFieldError.checkNotNull(
                index, r'ShotResponse', 'index'),
            startMs: BuiltValueNullFieldError.checkNotNull(
                startMs, r'ShotResponse', 'startMs'),
            endMs: BuiltValueNullFieldError.checkNotNull(
                endMs, r'ShotResponse', 'endMs'),
            representativeFrameMs: BuiltValueNullFieldError.checkNotNull(
                representativeFrameMs,
                r'ShotResponse',
                'representativeFrameMs'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'ShotResponse', 'description'),
            transitionIn: BuiltValueNullFieldError.checkNotNull(
                transitionIn, r'ShotResponse', 'transitionIn'),
            shotSize: BuiltValueNullFieldError.checkNotNull(
                shotSize, r'ShotResponse', 'shotSize'),
            cameraMotion: BuiltValueNullFieldError.checkNotNull(
                cameraMotion, r'ShotResponse', 'cameraMotion'),
            narrativeFunction: BuiltValueNullFieldError.checkNotNull(
                narrativeFunction, r'ShotResponse', 'narrativeFunction'),
            highlightScore: BuiltValueNullFieldError.checkNotNull(
                highlightScore, r'ShotResponse', 'highlightScore'),
            visualTags: visualTags.build(),
            assetIds: assetIds.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'visualTags';
        visualTags.build();
        _$failedField = 'assetIds';
        assetIds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ShotResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
