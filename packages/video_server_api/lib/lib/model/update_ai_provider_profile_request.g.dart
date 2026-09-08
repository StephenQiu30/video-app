// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_ai_provider_profile_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateAiProviderProfileRequest extends UpdateAiProviderProfileRequest {
  @override
  final String? displayName;
  @override
  final AiProviderEngine? engine;
  @override
  final AiProviderAuthMode? authMode;
  @override
  final String? baseUrl;
  @override
  final String? model;
  @override
  final String? apiKey;

  factory _$UpdateAiProviderProfileRequest(
          [void Function(UpdateAiProviderProfileRequestBuilder)? updates]) =>
      (UpdateAiProviderProfileRequestBuilder()..update(updates))._build();

  _$UpdateAiProviderProfileRequest._(
      {this.displayName,
      this.engine,
      this.authMode,
      this.baseUrl,
      this.model,
      this.apiKey})
      : super._();
  @override
  UpdateAiProviderProfileRequest rebuild(
          void Function(UpdateAiProviderProfileRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateAiProviderProfileRequestBuilder toBuilder() =>
      UpdateAiProviderProfileRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateAiProviderProfileRequest &&
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
    return (newBuiltValueToStringHelper(r'UpdateAiProviderProfileRequest')
          ..add('displayName', displayName)
          ..add('engine', engine)
          ..add('authMode', authMode)
          ..add('baseUrl', baseUrl)
          ..add('model', model)
          ..add('apiKey', apiKey))
        .toString();
  }
}

class UpdateAiProviderProfileRequestBuilder
    implements
        Builder<UpdateAiProviderProfileRequest,
            UpdateAiProviderProfileRequestBuilder> {
  _$UpdateAiProviderProfileRequest? _$v;

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

  UpdateAiProviderProfileRequestBuilder() {
    UpdateAiProviderProfileRequest._defaults(this);
  }

  UpdateAiProviderProfileRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
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
  void replace(UpdateAiProviderProfileRequest other) {
    _$v = other as _$UpdateAiProviderProfileRequest;
  }

  @override
  void update(void Function(UpdateAiProviderProfileRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateAiProviderProfileRequest build() => _build();

  _$UpdateAiProviderProfileRequest _build() {
    final _$result = _$v ??
        _$UpdateAiProviderProfileRequest._(
          displayName: displayName,
          engine: engine,
          authMode: authMode,
          baseUrl: baseUrl,
          model: model,
          apiKey: apiKey,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
