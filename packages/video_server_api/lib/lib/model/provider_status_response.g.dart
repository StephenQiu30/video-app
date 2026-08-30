// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_status_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProviderStatusResponse extends ProviderStatusResponse {
  @override
  final String key;
  @override
  final String displayName;
  @override
  final bool registered;
  @override
  final bool extractorExists;
  @override
  final BuiltList<ProviderCapability> capabilities;
  @override
  final BuiltList<ProviderAccessMode> accessModes;
  @override
  final ProviderSupportStatus status;
  @override
  final DateTime? lastCheckedAt;
  @override
  final bool? lastCheckSucceeded;
  @override
  final bool downloadSupported;
  @override
  final bool downloadAvailable;
  @override
  final DateTime? lastMediaVerifiedAt;
  @override
  final DateTime? lastVerifiedAt;
  @override
  final String? userAction;

  factory _$ProviderStatusResponse(
          [void Function(ProviderStatusResponseBuilder)? updates]) =>
      (ProviderStatusResponseBuilder()..update(updates))._build();

  _$ProviderStatusResponse._(
      {required this.key,
      required this.displayName,
      required this.registered,
      required this.extractorExists,
      required this.capabilities,
      required this.accessModes,
      required this.status,
      this.lastCheckedAt,
      this.lastCheckSucceeded,
      required this.downloadSupported,
      required this.downloadAvailable,
      this.lastMediaVerifiedAt,
      this.lastVerifiedAt,
      this.userAction})
      : super._();
  @override
  ProviderStatusResponse rebuild(
          void Function(ProviderStatusResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProviderStatusResponseBuilder toBuilder() =>
      ProviderStatusResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProviderStatusResponse &&
        key == other.key &&
        displayName == other.displayName &&
        registered == other.registered &&
        extractorExists == other.extractorExists &&
        capabilities == other.capabilities &&
        accessModes == other.accessModes &&
        status == other.status &&
        lastCheckedAt == other.lastCheckedAt &&
        lastCheckSucceeded == other.lastCheckSucceeded &&
        downloadSupported == other.downloadSupported &&
        downloadAvailable == other.downloadAvailable &&
        lastMediaVerifiedAt == other.lastMediaVerifiedAt &&
        lastVerifiedAt == other.lastVerifiedAt &&
        userAction == other.userAction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, registered.hashCode);
    _$hash = $jc(_$hash, extractorExists.hashCode);
    _$hash = $jc(_$hash, capabilities.hashCode);
    _$hash = $jc(_$hash, accessModes.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, lastCheckedAt.hashCode);
    _$hash = $jc(_$hash, lastCheckSucceeded.hashCode);
    _$hash = $jc(_$hash, downloadSupported.hashCode);
    _$hash = $jc(_$hash, downloadAvailable.hashCode);
    _$hash = $jc(_$hash, lastMediaVerifiedAt.hashCode);
    _$hash = $jc(_$hash, lastVerifiedAt.hashCode);
    _$hash = $jc(_$hash, userAction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProviderStatusResponse')
          ..add('key', key)
          ..add('displayName', displayName)
          ..add('registered', registered)
          ..add('extractorExists', extractorExists)
          ..add('capabilities', capabilities)
          ..add('accessModes', accessModes)
          ..add('status', status)
          ..add('lastCheckedAt', lastCheckedAt)
          ..add('lastCheckSucceeded', lastCheckSucceeded)
          ..add('downloadSupported', downloadSupported)
          ..add('downloadAvailable', downloadAvailable)
          ..add('lastMediaVerifiedAt', lastMediaVerifiedAt)
          ..add('lastVerifiedAt', lastVerifiedAt)
          ..add('userAction', userAction))
        .toString();
  }
}

class ProviderStatusResponseBuilder
    implements Builder<ProviderStatusResponse, ProviderStatusResponseBuilder> {
  _$ProviderStatusResponse? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  bool? _registered;
  bool? get registered => _$this._registered;
  set registered(bool? registered) => _$this._registered = registered;

  bool? _extractorExists;
  bool? get extractorExists => _$this._extractorExists;
  set extractorExists(bool? extractorExists) =>
      _$this._extractorExists = extractorExists;

  ListBuilder<ProviderCapability>? _capabilities;
  ListBuilder<ProviderCapability> get capabilities =>
      _$this._capabilities ??= ListBuilder<ProviderCapability>();
  set capabilities(ListBuilder<ProviderCapability>? capabilities) =>
      _$this._capabilities = capabilities;

  ListBuilder<ProviderAccessMode>? _accessModes;
  ListBuilder<ProviderAccessMode> get accessModes =>
      _$this._accessModes ??= ListBuilder<ProviderAccessMode>();
  set accessModes(ListBuilder<ProviderAccessMode>? accessModes) =>
      _$this._accessModes = accessModes;

  ProviderSupportStatus? _status;
  ProviderSupportStatus? get status => _$this._status;
  set status(ProviderSupportStatus? status) => _$this._status = status;

  DateTime? _lastCheckedAt;
  DateTime? get lastCheckedAt => _$this._lastCheckedAt;
  set lastCheckedAt(DateTime? lastCheckedAt) =>
      _$this._lastCheckedAt = lastCheckedAt;

  bool? _lastCheckSucceeded;
  bool? get lastCheckSucceeded => _$this._lastCheckSucceeded;
  set lastCheckSucceeded(bool? lastCheckSucceeded) =>
      _$this._lastCheckSucceeded = lastCheckSucceeded;

  bool? _downloadSupported;
  bool? get downloadSupported => _$this._downloadSupported;
  set downloadSupported(bool? downloadSupported) =>
      _$this._downloadSupported = downloadSupported;

  bool? _downloadAvailable;
  bool? get downloadAvailable => _$this._downloadAvailable;
  set downloadAvailable(bool? downloadAvailable) =>
      _$this._downloadAvailable = downloadAvailable;

  DateTime? _lastMediaVerifiedAt;
  DateTime? get lastMediaVerifiedAt => _$this._lastMediaVerifiedAt;
  set lastMediaVerifiedAt(DateTime? lastMediaVerifiedAt) =>
      _$this._lastMediaVerifiedAt = lastMediaVerifiedAt;

  DateTime? _lastVerifiedAt;
  DateTime? get lastVerifiedAt => _$this._lastVerifiedAt;
  set lastVerifiedAt(DateTime? lastVerifiedAt) =>
      _$this._lastVerifiedAt = lastVerifiedAt;

  String? _userAction;
  String? get userAction => _$this._userAction;
  set userAction(String? userAction) => _$this._userAction = userAction;

  ProviderStatusResponseBuilder() {
    ProviderStatusResponse._defaults(this);
  }

  ProviderStatusResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _displayName = $v.displayName;
      _registered = $v.registered;
      _extractorExists = $v.extractorExists;
      _capabilities = $v.capabilities.toBuilder();
      _accessModes = $v.accessModes.toBuilder();
      _status = $v.status;
      _lastCheckedAt = $v.lastCheckedAt;
      _lastCheckSucceeded = $v.lastCheckSucceeded;
      _downloadSupported = $v.downloadSupported;
      _downloadAvailable = $v.downloadAvailable;
      _lastMediaVerifiedAt = $v.lastMediaVerifiedAt;
      _lastVerifiedAt = $v.lastVerifiedAt;
      _userAction = $v.userAction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProviderStatusResponse other) {
    _$v = other as _$ProviderStatusResponse;
  }

  @override
  void update(void Function(ProviderStatusResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProviderStatusResponse build() => _build();

  _$ProviderStatusResponse _build() {
    _$ProviderStatusResponse _$result;
    try {
      _$result = _$v ??
          _$ProviderStatusResponse._(
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'ProviderStatusResponse', 'key'),
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName, r'ProviderStatusResponse', 'displayName'),
            registered: BuiltValueNullFieldError.checkNotNull(
                registered, r'ProviderStatusResponse', 'registered'),
            extractorExists: BuiltValueNullFieldError.checkNotNull(
                extractorExists, r'ProviderStatusResponse', 'extractorExists'),
            capabilities: capabilities.build(),
            accessModes: accessModes.build(),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'ProviderStatusResponse', 'status'),
            lastCheckedAt: lastCheckedAt,
            lastCheckSucceeded: lastCheckSucceeded,
            downloadSupported: BuiltValueNullFieldError.checkNotNull(
                downloadSupported,
                r'ProviderStatusResponse',
                'downloadSupported'),
            downloadAvailable: BuiltValueNullFieldError.checkNotNull(
                downloadAvailable,
                r'ProviderStatusResponse',
                'downloadAvailable'),
            lastMediaVerifiedAt: lastMediaVerifiedAt,
            lastVerifiedAt: lastVerifiedAt,
            userAction: userAction,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'capabilities';
        capabilities.build();
        _$failedField = 'accessModes';
        accessModes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ProviderStatusResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
