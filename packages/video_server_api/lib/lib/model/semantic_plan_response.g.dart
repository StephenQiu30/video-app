// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semantic_plan_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SemanticPlanResponse extends SemanticPlanResponse {
  @override
  final int height;
  @override
  final int width;
  @override
  final FpsBucket fpsBucket;
  @override
  final DynamicRange dynamicRange;
  @override
  final VideoCodecFamily videoCodecFamily;
  @override
  final AudioCodecFamily audioCodecFamily;
  @override
  final String? audioLanguage;
  @override
  final ContainerPreference containerPreference;
  @override
  final CompatibilityProfile compatibilityProfile;

  factory _$SemanticPlanResponse(
          [void Function(SemanticPlanResponseBuilder)? updates]) =>
      (SemanticPlanResponseBuilder()..update(updates))._build();

  _$SemanticPlanResponse._(
      {required this.height,
      required this.width,
      required this.fpsBucket,
      required this.dynamicRange,
      required this.videoCodecFamily,
      required this.audioCodecFamily,
      this.audioLanguage,
      required this.containerPreference,
      required this.compatibilityProfile})
      : super._();
  @override
  SemanticPlanResponse rebuild(
          void Function(SemanticPlanResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SemanticPlanResponseBuilder toBuilder() =>
      SemanticPlanResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SemanticPlanResponse &&
        height == other.height &&
        width == other.width &&
        fpsBucket == other.fpsBucket &&
        dynamicRange == other.dynamicRange &&
        videoCodecFamily == other.videoCodecFamily &&
        audioCodecFamily == other.audioCodecFamily &&
        audioLanguage == other.audioLanguage &&
        containerPreference == other.containerPreference &&
        compatibilityProfile == other.compatibilityProfile;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jc(_$hash, width.hashCode);
    _$hash = $jc(_$hash, fpsBucket.hashCode);
    _$hash = $jc(_$hash, dynamicRange.hashCode);
    _$hash = $jc(_$hash, videoCodecFamily.hashCode);
    _$hash = $jc(_$hash, audioCodecFamily.hashCode);
    _$hash = $jc(_$hash, audioLanguage.hashCode);
    _$hash = $jc(_$hash, containerPreference.hashCode);
    _$hash = $jc(_$hash, compatibilityProfile.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SemanticPlanResponse')
          ..add('height', height)
          ..add('width', width)
          ..add('fpsBucket', fpsBucket)
          ..add('dynamicRange', dynamicRange)
          ..add('videoCodecFamily', videoCodecFamily)
          ..add('audioCodecFamily', audioCodecFamily)
          ..add('audioLanguage', audioLanguage)
          ..add('containerPreference', containerPreference)
          ..add('compatibilityProfile', compatibilityProfile))
        .toString();
  }
}

class SemanticPlanResponseBuilder
    implements Builder<SemanticPlanResponse, SemanticPlanResponseBuilder> {
  _$SemanticPlanResponse? _$v;

  int? _height;
  int? get height => _$this._height;
  set height(int? height) => _$this._height = height;

  int? _width;
  int? get width => _$this._width;
  set width(int? width) => _$this._width = width;

  FpsBucket? _fpsBucket;
  FpsBucket? get fpsBucket => _$this._fpsBucket;
  set fpsBucket(FpsBucket? fpsBucket) => _$this._fpsBucket = fpsBucket;

  DynamicRange? _dynamicRange;
  DynamicRange? get dynamicRange => _$this._dynamicRange;
  set dynamicRange(DynamicRange? dynamicRange) =>
      _$this._dynamicRange = dynamicRange;

  VideoCodecFamily? _videoCodecFamily;
  VideoCodecFamily? get videoCodecFamily => _$this._videoCodecFamily;
  set videoCodecFamily(VideoCodecFamily? videoCodecFamily) =>
      _$this._videoCodecFamily = videoCodecFamily;

  AudioCodecFamily? _audioCodecFamily;
  AudioCodecFamily? get audioCodecFamily => _$this._audioCodecFamily;
  set audioCodecFamily(AudioCodecFamily? audioCodecFamily) =>
      _$this._audioCodecFamily = audioCodecFamily;

  String? _audioLanguage;
  String? get audioLanguage => _$this._audioLanguage;
  set audioLanguage(String? audioLanguage) =>
      _$this._audioLanguage = audioLanguage;

  ContainerPreference? _containerPreference;
  ContainerPreference? get containerPreference => _$this._containerPreference;
  set containerPreference(ContainerPreference? containerPreference) =>
      _$this._containerPreference = containerPreference;

  CompatibilityProfile? _compatibilityProfile;
  CompatibilityProfile? get compatibilityProfile =>
      _$this._compatibilityProfile;
  set compatibilityProfile(CompatibilityProfile? compatibilityProfile) =>
      _$this._compatibilityProfile = compatibilityProfile;

  SemanticPlanResponseBuilder() {
    SemanticPlanResponse._defaults(this);
  }

  SemanticPlanResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _height = $v.height;
      _width = $v.width;
      _fpsBucket = $v.fpsBucket;
      _dynamicRange = $v.dynamicRange;
      _videoCodecFamily = $v.videoCodecFamily;
      _audioCodecFamily = $v.audioCodecFamily;
      _audioLanguage = $v.audioLanguage;
      _containerPreference = $v.containerPreference;
      _compatibilityProfile = $v.compatibilityProfile;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SemanticPlanResponse other) {
    _$v = other as _$SemanticPlanResponse;
  }

  @override
  void update(void Function(SemanticPlanResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SemanticPlanResponse build() => _build();

  _$SemanticPlanResponse _build() {
    final _$result = _$v ??
        _$SemanticPlanResponse._(
          height: BuiltValueNullFieldError.checkNotNull(
              height, r'SemanticPlanResponse', 'height'),
          width: BuiltValueNullFieldError.checkNotNull(
              width, r'SemanticPlanResponse', 'width'),
          fpsBucket: BuiltValueNullFieldError.checkNotNull(
              fpsBucket, r'SemanticPlanResponse', 'fpsBucket'),
          dynamicRange: BuiltValueNullFieldError.checkNotNull(
              dynamicRange, r'SemanticPlanResponse', 'dynamicRange'),
          videoCodecFamily: BuiltValueNullFieldError.checkNotNull(
              videoCodecFamily, r'SemanticPlanResponse', 'videoCodecFamily'),
          audioCodecFamily: BuiltValueNullFieldError.checkNotNull(
              audioCodecFamily, r'SemanticPlanResponse', 'audioCodecFamily'),
          audioLanguage: audioLanguage,
          containerPreference: BuiltValueNullFieldError.checkNotNull(
              containerPreference,
              r'SemanticPlanResponse',
              'containerPreference'),
          compatibilityProfile: BuiltValueNullFieldError.checkNotNull(
              compatibilityProfile,
              r'SemanticPlanResponse',
              'compatibilityProfile'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
