// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InspectionResponse extends InspectionResponse {
  @override
  final String id;
  @override
  final String extractorKey;
  @override
  final String providerMediaId;
  @override
  final String title;
  @override
  final int durationSeconds;
  @override
  final String? thumbnailUrl;
  @override
  final DateTime expiresAt;
  @override
  final BuiltList<FormatResponse> formats;
  @override
  final SourceOrigin sourceOrigin;
  @override
  final ExecutionMode executionMode;
  @override
  final AccessDecision accessDecision;
  @override
  final EntitlementState entitlementState;
  @override
  final IdentityState identityState;
  @override
  final ProtectionState protectionState;
  @override
  final RightsBasis? rightsBasis;
  @override
  final String? restrictionReason;
  @override
  final String? userAction;

  factory _$InspectionResponse(
          [void Function(InspectionResponseBuilder)? updates]) =>
      (InspectionResponseBuilder()..update(updates))._build();

  _$InspectionResponse._(
      {required this.id,
      required this.extractorKey,
      required this.providerMediaId,
      required this.title,
      required this.durationSeconds,
      this.thumbnailUrl,
      required this.expiresAt,
      required this.formats,
      required this.sourceOrigin,
      required this.executionMode,
      required this.accessDecision,
      required this.entitlementState,
      required this.identityState,
      required this.protectionState,
      this.rightsBasis,
      this.restrictionReason,
      this.userAction})
      : super._();
  @override
  InspectionResponse rebuild(
          void Function(InspectionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InspectionResponseBuilder toBuilder() =>
      InspectionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InspectionResponse &&
        id == other.id &&
        extractorKey == other.extractorKey &&
        providerMediaId == other.providerMediaId &&
        title == other.title &&
        durationSeconds == other.durationSeconds &&
        thumbnailUrl == other.thumbnailUrl &&
        expiresAt == other.expiresAt &&
        formats == other.formats &&
        sourceOrigin == other.sourceOrigin &&
        executionMode == other.executionMode &&
        accessDecision == other.accessDecision &&
        entitlementState == other.entitlementState &&
        identityState == other.identityState &&
        protectionState == other.protectionState &&
        rightsBasis == other.rightsBasis &&
        restrictionReason == other.restrictionReason &&
        userAction == other.userAction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, extractorKey.hashCode);
    _$hash = $jc(_$hash, providerMediaId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, durationSeconds.hashCode);
    _$hash = $jc(_$hash, thumbnailUrl.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jc(_$hash, formats.hashCode);
    _$hash = $jc(_$hash, sourceOrigin.hashCode);
    _$hash = $jc(_$hash, executionMode.hashCode);
    _$hash = $jc(_$hash, accessDecision.hashCode);
    _$hash = $jc(_$hash, entitlementState.hashCode);
    _$hash = $jc(_$hash, identityState.hashCode);
    _$hash = $jc(_$hash, protectionState.hashCode);
    _$hash = $jc(_$hash, rightsBasis.hashCode);
    _$hash = $jc(_$hash, restrictionReason.hashCode);
    _$hash = $jc(_$hash, userAction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InspectionResponse')
          ..add('id', id)
          ..add('extractorKey', extractorKey)
          ..add('providerMediaId', providerMediaId)
          ..add('title', title)
          ..add('durationSeconds', durationSeconds)
          ..add('thumbnailUrl', thumbnailUrl)
          ..add('expiresAt', expiresAt)
          ..add('formats', formats)
          ..add('sourceOrigin', sourceOrigin)
          ..add('executionMode', executionMode)
          ..add('accessDecision', accessDecision)
          ..add('entitlementState', entitlementState)
          ..add('identityState', identityState)
          ..add('protectionState', protectionState)
          ..add('rightsBasis', rightsBasis)
          ..add('restrictionReason', restrictionReason)
          ..add('userAction', userAction))
        .toString();
  }
}

class InspectionResponseBuilder
    implements Builder<InspectionResponse, InspectionResponseBuilder> {
  _$InspectionResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _extractorKey;
  String? get extractorKey => _$this._extractorKey;
  set extractorKey(String? extractorKey) => _$this._extractorKey = extractorKey;

  String? _providerMediaId;
  String? get providerMediaId => _$this._providerMediaId;
  set providerMediaId(String? providerMediaId) =>
      _$this._providerMediaId = providerMediaId;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _durationSeconds;
  int? get durationSeconds => _$this._durationSeconds;
  set durationSeconds(int? durationSeconds) =>
      _$this._durationSeconds = durationSeconds;

  String? _thumbnailUrl;
  String? get thumbnailUrl => _$this._thumbnailUrl;
  set thumbnailUrl(String? thumbnailUrl) => _$this._thumbnailUrl = thumbnailUrl;

  DateTime? _expiresAt;
  DateTime? get expiresAt => _$this._expiresAt;
  set expiresAt(DateTime? expiresAt) => _$this._expiresAt = expiresAt;

  ListBuilder<FormatResponse>? _formats;
  ListBuilder<FormatResponse> get formats =>
      _$this._formats ??= ListBuilder<FormatResponse>();
  set formats(ListBuilder<FormatResponse>? formats) =>
      _$this._formats = formats;

  SourceOrigin? _sourceOrigin;
  SourceOrigin? get sourceOrigin => _$this._sourceOrigin;
  set sourceOrigin(SourceOrigin? sourceOrigin) =>
      _$this._sourceOrigin = sourceOrigin;

  ExecutionMode? _executionMode;
  ExecutionMode? get executionMode => _$this._executionMode;
  set executionMode(ExecutionMode? executionMode) =>
      _$this._executionMode = executionMode;

  AccessDecision? _accessDecision;
  AccessDecision? get accessDecision => _$this._accessDecision;
  set accessDecision(AccessDecision? accessDecision) =>
      _$this._accessDecision = accessDecision;

  EntitlementState? _entitlementState;
  EntitlementState? get entitlementState => _$this._entitlementState;
  set entitlementState(EntitlementState? entitlementState) =>
      _$this._entitlementState = entitlementState;

  IdentityState? _identityState;
  IdentityState? get identityState => _$this._identityState;
  set identityState(IdentityState? identityState) =>
      _$this._identityState = identityState;

  ProtectionState? _protectionState;
  ProtectionState? get protectionState => _$this._protectionState;
  set protectionState(ProtectionState? protectionState) =>
      _$this._protectionState = protectionState;

  RightsBasis? _rightsBasis;
  RightsBasis? get rightsBasis => _$this._rightsBasis;
  set rightsBasis(RightsBasis? rightsBasis) =>
      _$this._rightsBasis = rightsBasis;

  String? _restrictionReason;
  String? get restrictionReason => _$this._restrictionReason;
  set restrictionReason(String? restrictionReason) =>
      _$this._restrictionReason = restrictionReason;

  String? _userAction;
  String? get userAction => _$this._userAction;
  set userAction(String? userAction) => _$this._userAction = userAction;

  InspectionResponseBuilder() {
    InspectionResponse._defaults(this);
  }

  InspectionResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _extractorKey = $v.extractorKey;
      _providerMediaId = $v.providerMediaId;
      _title = $v.title;
      _durationSeconds = $v.durationSeconds;
      _thumbnailUrl = $v.thumbnailUrl;
      _expiresAt = $v.expiresAt;
      _formats = $v.formats.toBuilder();
      _sourceOrigin = $v.sourceOrigin;
      _executionMode = $v.executionMode;
      _accessDecision = $v.accessDecision;
      _entitlementState = $v.entitlementState;
      _identityState = $v.identityState;
      _protectionState = $v.protectionState;
      _rightsBasis = $v.rightsBasis;
      _restrictionReason = $v.restrictionReason;
      _userAction = $v.userAction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InspectionResponse other) {
    _$v = other as _$InspectionResponse;
  }

  @override
  void update(void Function(InspectionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InspectionResponse build() => _build();

  _$InspectionResponse _build() {
    _$InspectionResponse _$result;
    try {
      _$result = _$v ??
          _$InspectionResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'InspectionResponse', 'id'),
            extractorKey: BuiltValueNullFieldError.checkNotNull(
                extractorKey, r'InspectionResponse', 'extractorKey'),
            providerMediaId: BuiltValueNullFieldError.checkNotNull(
                providerMediaId, r'InspectionResponse', 'providerMediaId'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'InspectionResponse', 'title'),
            durationSeconds: BuiltValueNullFieldError.checkNotNull(
                durationSeconds, r'InspectionResponse', 'durationSeconds'),
            thumbnailUrl: thumbnailUrl,
            expiresAt: BuiltValueNullFieldError.checkNotNull(
                expiresAt, r'InspectionResponse', 'expiresAt'),
            formats: formats.build(),
            sourceOrigin: BuiltValueNullFieldError.checkNotNull(
                sourceOrigin, r'InspectionResponse', 'sourceOrigin'),
            executionMode: BuiltValueNullFieldError.checkNotNull(
                executionMode, r'InspectionResponse', 'executionMode'),
            accessDecision: BuiltValueNullFieldError.checkNotNull(
                accessDecision, r'InspectionResponse', 'accessDecision'),
            entitlementState: BuiltValueNullFieldError.checkNotNull(
                entitlementState, r'InspectionResponse', 'entitlementState'),
            identityState: BuiltValueNullFieldError.checkNotNull(
                identityState, r'InspectionResponse', 'identityState'),
            protectionState: BuiltValueNullFieldError.checkNotNull(
                protectionState, r'InspectionResponse', 'protectionState'),
            rightsBasis: rightsBasis,
            restrictionReason: restrictionReason,
            userAction: userAction,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'formats';
        formats.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'InspectionResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
