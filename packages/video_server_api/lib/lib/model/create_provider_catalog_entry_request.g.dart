// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_provider_catalog_entry_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateProviderCatalogEntryRequest
    extends CreateProviderCatalogEntryRequest {
  @override
  final String key;
  @override
  final String displayName;
  @override
  final int sortOrder;
  @override
  final bool? isVisible;

  factory _$CreateProviderCatalogEntryRequest(
          [void Function(CreateProviderCatalogEntryRequestBuilder)? updates]) =>
      (CreateProviderCatalogEntryRequestBuilder()..update(updates))._build();

  _$CreateProviderCatalogEntryRequest._(
      {required this.key,
      required this.displayName,
      required this.sortOrder,
      this.isVisible})
      : super._();
  @override
  CreateProviderCatalogEntryRequest rebuild(
          void Function(CreateProviderCatalogEntryRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateProviderCatalogEntryRequestBuilder toBuilder() =>
      CreateProviderCatalogEntryRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateProviderCatalogEntryRequest &&
        key == other.key &&
        displayName == other.displayName &&
        sortOrder == other.sortOrder &&
        isVisible == other.isVisible;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, isVisible.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateProviderCatalogEntryRequest')
          ..add('key', key)
          ..add('displayName', displayName)
          ..add('sortOrder', sortOrder)
          ..add('isVisible', isVisible))
        .toString();
  }
}

class CreateProviderCatalogEntryRequestBuilder
    implements
        Builder<CreateProviderCatalogEntryRequest,
            CreateProviderCatalogEntryRequestBuilder> {
  _$CreateProviderCatalogEntryRequest? _$v;

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

  CreateProviderCatalogEntryRequestBuilder() {
    CreateProviderCatalogEntryRequest._defaults(this);
  }

  CreateProviderCatalogEntryRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _displayName = $v.displayName;
      _sortOrder = $v.sortOrder;
      _isVisible = $v.isVisible;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateProviderCatalogEntryRequest other) {
    _$v = other as _$CreateProviderCatalogEntryRequest;
  }

  @override
  void update(
      void Function(CreateProviderCatalogEntryRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateProviderCatalogEntryRequest build() => _build();

  _$CreateProviderCatalogEntryRequest _build() {
    final _$result = _$v ??
        _$CreateProviderCatalogEntryRequest._(
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'CreateProviderCatalogEntryRequest', 'key'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'CreateProviderCatalogEntryRequest', 'displayName'),
          sortOrder: BuiltValueNullFieldError.checkNotNull(
              sortOrder, r'CreateProviderCatalogEntryRequest', 'sortOrder'),
          isVisible: isVisible,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
