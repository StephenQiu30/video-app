// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_catalog_entry_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProviderCatalogEntryResponse extends ProviderCatalogEntryResponse {
  @override
  final String key;
  @override
  final String displayName;
  @override
  final int sortOrder;
  @override
  final bool isVisible;
  @override
  final bool systemRegistered;
  @override
  final ProviderSupportStatus systemStatus;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  factory _$ProviderCatalogEntryResponse(
          [void Function(ProviderCatalogEntryResponseBuilder)? updates]) =>
      (ProviderCatalogEntryResponseBuilder()..update(updates))._build();

  _$ProviderCatalogEntryResponse._(
      {required this.key,
      required this.displayName,
      required this.sortOrder,
      required this.isVisible,
      required this.systemRegistered,
      required this.systemStatus,
      required this.createdAt,
      required this.updatedAt})
      : super._();
  @override
  ProviderCatalogEntryResponse rebuild(
          void Function(ProviderCatalogEntryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProviderCatalogEntryResponseBuilder toBuilder() =>
      ProviderCatalogEntryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProviderCatalogEntryResponse &&
        key == other.key &&
        displayName == other.displayName &&
        sortOrder == other.sortOrder &&
        isVisible == other.isVisible &&
        systemRegistered == other.systemRegistered &&
        systemStatus == other.systemStatus &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, isVisible.hashCode);
    _$hash = $jc(_$hash, systemRegistered.hashCode);
    _$hash = $jc(_$hash, systemStatus.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProviderCatalogEntryResponse')
          ..add('key', key)
          ..add('displayName', displayName)
          ..add('sortOrder', sortOrder)
          ..add('isVisible', isVisible)
          ..add('systemRegistered', systemRegistered)
          ..add('systemStatus', systemStatus)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class ProviderCatalogEntryResponseBuilder
    implements
        Builder<ProviderCatalogEntryResponse,
            ProviderCatalogEntryResponseBuilder> {
  _$ProviderCatalogEntryResponse? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  int? _sortOrder;
  int? get sortOrder => _$this._sortOrder;
  set sortOrder(int? sortOrder) => _$this._sortOrder = sortOrder;

  bool? _isVisible;
  bool? get isVisible => _$this._isVisible;
  set isVisible(bool? isVisible) => _$this._isVisible = isVisible;

  bool? _systemRegistered;
  bool? get systemRegistered => _$this._systemRegistered;
  set systemRegistered(bool? systemRegistered) =>
      _$this._systemRegistered = systemRegistered;

  ProviderSupportStatus? _systemStatus;
  ProviderSupportStatus? get systemStatus => _$this._systemStatus;
  set systemStatus(ProviderSupportStatus? systemStatus) =>
      _$this._systemStatus = systemStatus;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  ProviderCatalogEntryResponseBuilder() {
    ProviderCatalogEntryResponse._defaults(this);
  }

  ProviderCatalogEntryResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _displayName = $v.displayName;
      _sortOrder = $v.sortOrder;
      _isVisible = $v.isVisible;
      _systemRegistered = $v.systemRegistered;
      _systemStatus = $v.systemStatus;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProviderCatalogEntryResponse other) {
    _$v = other as _$ProviderCatalogEntryResponse;
  }

  @override
  void update(void Function(ProviderCatalogEntryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProviderCatalogEntryResponse build() => _build();

  _$ProviderCatalogEntryResponse _build() {
    final _$result = _$v ??
        _$ProviderCatalogEntryResponse._(
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'ProviderCatalogEntryResponse', 'key'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'ProviderCatalogEntryResponse', 'displayName'),
          sortOrder: BuiltValueNullFieldError.checkNotNull(
              sortOrder, r'ProviderCatalogEntryResponse', 'sortOrder'),
          isVisible: BuiltValueNullFieldError.checkNotNull(
              isVisible, r'ProviderCatalogEntryResponse', 'isVisible'),
          systemRegistered: BuiltValueNullFieldError.checkNotNull(
              systemRegistered,
              r'ProviderCatalogEntryResponse',
              'systemRegistered'),
          systemStatus: BuiltValueNullFieldError.checkNotNull(
              systemStatus, r'ProviderCatalogEntryResponse', 'systemStatus'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'ProviderCatalogEntryResponse', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'ProviderCatalogEntryResponse', 'updatedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
