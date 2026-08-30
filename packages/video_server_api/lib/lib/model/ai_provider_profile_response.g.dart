// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_provider_profile_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiProviderProfileResponse extends AiProviderProfileResponse {
  @override
  final String key;
  @override
  final String displayName;
  @override
  final AiProviderEngine engine;
  @override
  final AiProviderAuthMode authMode;
  @override
  final String? baseUrl;
  @override
  final String model;
  @override
  final bool credentialConfigured;
  @override
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  factory _$AiProviderProfileResponse(
          [void Function(AiProviderProfileResponseBuilder)? updates]) =>
      (AiProviderProfileResponseBuilder()..update(updates))._build();

  _$AiProviderProfileResponse._(
      {required this.key,
      required this.displayName,
      required this.engine,
      required this.authMode,
      this.baseUrl,
      required this.model,
      required this.credentialConfigured,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt})
      : super._();
  @override
  AiProviderProfileResponse rebuild(
          void Function(AiProviderProfileResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiProviderProfileResponseBuilder toBuilder() =>
      AiProviderProfileResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiProviderProfileResponse &&
        key == other.key &&
        displayName == other.displayName &&
        engine == other.engine &&
        authMode == other.authMode &&
        baseUrl == other.baseUrl &&
        model == other.model &&
        credentialConfigured == other.credentialConfigured &&
        isActive == other.isActive &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, engine.hashCode);
    _$hash = $jc(_$hash, authMode.hashCode);
    _$hash = $jc(_$hash, baseUrl.hashCode);
    _$hash = $jc(_$hash, model.hashCode);
    _$hash = $jc(_$hash, credentialConfigured.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiProviderProfileResponse')
          ..add('key', key)
          ..add('displayName', displayName)
          ..add('engine', engine)
          ..add('authMode', authMode)
          ..add('baseUrl', baseUrl)
          ..add('model', model)
          ..add('credentialConfigured', credentialConfigured)
          ..add('isActive', isActive)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class AiProviderProfileResponseBuilder
    implements
        Builder<AiProviderProfileResponse, AiProviderProfileResponseBuilder> {
  _$AiProviderProfileResponse? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  AiProviderEngine? _engine;
  AiProviderEngine? get engine => _$this._engine;
  set engine(AiProviderEngine? engine) => _$this._engine = engine;

  AiProviderAuthMode? _authMode;
  AiProviderAuthMode? get authMode => _$this._authMode;
  set authMode(AiProviderAuthMode? authMode) => _$this._authMode = authMode;

  String? _baseUrl;
  String? get baseUrl => _$this._baseUrl;
  set baseUrl(String? baseUrl) => _$this._baseUrl = baseUrl;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  bool? _credentialConfigured;
  bool? get credentialConfigured => _$this._credentialConfigured;
  set credentialConfigured(bool? credentialConfigured) =>
      _$this._credentialConfigured = credentialConfigured;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  AiProviderProfileResponseBuilder() {
    AiProviderProfileResponse._defaults(this);
  }

  AiProviderProfileResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _displayName = $v.displayName;
      _engine = $v.engine;
      _authMode = $v.authMode;
      _baseUrl = $v.baseUrl;
      _model = $v.model;
      _credentialConfigured = $v.credentialConfigured;
      _isActive = $v.isActive;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiProviderProfileResponse other) {
    _$v = other as _$AiProviderProfileResponse;
  }

  @override
  void update(void Function(AiProviderProfileResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiProviderProfileResponse build() => _build();

  _$AiProviderProfileResponse _build() {
    final _$result = _$v ??
        _$AiProviderProfileResponse._(
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'AiProviderProfileResponse', 'key'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'AiProviderProfileResponse', 'displayName'),
          engine: BuiltValueNullFieldError.checkNotNull(
              engine, r'AiProviderProfileResponse', 'engine'),
          authMode: BuiltValueNullFieldError.checkNotNull(
              authMode, r'AiProviderProfileResponse', 'authMode'),
          baseUrl: baseUrl,
          model: BuiltValueNullFieldError.checkNotNull(
              model, r'AiProviderProfileResponse', 'model'),
          credentialConfigured: BuiltValueNullFieldError.checkNotNull(
              credentialConfigured,
              r'AiProviderProfileResponse',
              'credentialConfigured'),
          isActive: BuiltValueNullFieldError.checkNotNull(
              isActive, r'AiProviderProfileResponse', 'isActive'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'AiProviderProfileResponse', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'AiProviderProfileResponse', 'updatedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
