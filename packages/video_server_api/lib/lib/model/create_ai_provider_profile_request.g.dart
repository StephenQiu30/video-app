// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ai_provider_profile_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateAiProviderProfileRequest extends CreateAiProviderProfileRequest {
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
  final String? apiKey;

  factory _$CreateAiProviderProfileRequest(
          [void Function(CreateAiProviderProfileRequestBuilder)? updates]) =>
      (CreateAiProviderProfileRequestBuilder()..update(updates))._build();

  _$CreateAiProviderProfileRequest._(
      {required this.key,
      required this.displayName,
      required this.engine,
      required this.authMode,
      this.baseUrl,
      required this.model,
      this.apiKey})
      : super._();
  @override
  CreateAiProviderProfileRequest rebuild(
          void Function(CreateAiProviderProfileRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateAiProviderProfileRequestBuilder toBuilder() =>
      CreateAiProviderProfileRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateAiProviderProfileRequest &&
        key == other.key &&
        displayName == other.displayName &&
        engine == other.engine &&
        authMode == other.authMode &&
        baseUrl == other.baseUrl &&
        model == other.model &&
        apiKey == other.apiKey;
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
    _$hash = $jc(_$hash, apiKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateAiProviderProfileRequest')
          ..add('key', key)
          ..add('displayName', displayName)
          ..add('engine', engine)
          ..add('authMode', authMode)
          ..add('baseUrl', baseUrl)
          ..add('model', model)
          ..add('apiKey', apiKey))
        .toString();
  }
}

class CreateAiProviderProfileRequestBuilder
    implements
        Builder<CreateAiProviderProfileRequest,
            CreateAiProviderProfileRequestBuilder> {
  _$CreateAiProviderProfileRequest? _$v;

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

  String? _apiKey;
  String? get apiKey => _$this._apiKey;
  set apiKey(String? apiKey) => _$this._apiKey = apiKey;

  CreateAiProviderProfileRequestBuilder() {
    CreateAiProviderProfileRequest._defaults(this);
  }

  CreateAiProviderProfileRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _displayName = $v.displayName;
      _engine = $v.engine;
      _authMode = $v.authMode;
      _baseUrl = $v.baseUrl;
      _model = $v.model;
      _apiKey = $v.apiKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateAiProviderProfileRequest other) {
    _$v = other as _$CreateAiProviderProfileRequest;
  }

  @override
  void update(void Function(CreateAiProviderProfileRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateAiProviderProfileRequest build() => _build();

  _$CreateAiProviderProfileRequest _build() {
    final _$result = _$v ??
        _$CreateAiProviderProfileRequest._(
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'CreateAiProviderProfileRequest', 'key'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'CreateAiProviderProfileRequest', 'displayName'),
          engine: BuiltValueNullFieldError.checkNotNull(
              engine, r'CreateAiProviderProfileRequest', 'engine'),
          authMode: BuiltValueNullFieldError.checkNotNull(
              authMode, r'CreateAiProviderProfileRequest', 'authMode'),
          baseUrl: baseUrl,
          model: BuiltValueNullFieldError.checkNotNull(
              model, r'CreateAiProviderProfileRequest', 'model'),
          apiKey: apiKey,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
