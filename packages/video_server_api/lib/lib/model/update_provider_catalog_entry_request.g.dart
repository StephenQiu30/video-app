// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_provider_catalog_entry_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateProviderCatalogEntryRequest
    extends UpdateProviderCatalogEntryRequest {
  @override
  final String? displayName;
  @override
  final int? sortOrder;
  @override
  final bool? isVisible;

  factory _$UpdateProviderCatalogEntryRequest(
          [void Function(UpdateProviderCatalogEntryRequestBuilder)? updates]) =>
      (UpdateProviderCatalogEntryRequestBuilder()..update(updates))._build();

  _$UpdateProviderCatalogEntryRequest._(
      {this.displayName, this.sortOrder, this.isVisible})
      : super._();
  @override
  UpdateProviderCatalogEntryRequest rebuild(
          void Function(UpdateProviderCatalogEntryRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateProviderCatalogEntryRequestBuilder toBuilder() =>
      UpdateProviderCatalogEntryRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateProviderCatalogEntryRequest &&
        displayName == other.displayName &&
        sortOrder == other.sortOrder &&
        isVisible == other.isVisible;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, isVisible.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateProviderCatalogEntryRequest')
          ..add('displayName', displayName)
          ..add('sortOrder', sortOrder)
          ..add('isVisible', isVisible))
        .toString();
  }
}

class UpdateProviderCatalogEntryRequestBuilder
    implements
        Builder<UpdateProviderCatalogEntryRequest,
            UpdateProviderCatalogEntryRequestBuilder> {
  _$UpdateProviderCatalogEntryRequest? _$v;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  int? _sortOrder;
  int? get sortOrder => _$this._sortOrder;
  set sortOrder(int? sortOrder) => _$this._sortOrder = sortOrder;

  bool? _isVisible;
  bool? get isVisible => _$this._isVisible;
  set isVisible(bool? isVisible) => _$this._isVisible = isVisible;

  UpdateProviderCatalogEntryRequestBuilder() {
    UpdateProviderCatalogEntryRequest._defaults(this);
  }

  UpdateProviderCatalogEntryRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayName = $v.displayName;
      _sortOrder = $v.sortOrder;
      _isVisible = $v.isVisible;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateProviderCatalogEntryRequest other) {
    _$v = other as _$UpdateProviderCatalogEntryRequest;
  }

  @override
  void update(
      void Function(UpdateProviderCatalogEntryRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateProviderCatalogEntryRequest build() => _build();

  _$UpdateProviderCatalogEntryRequest _build() {
    final _$result = _$v ??
        _$UpdateProviderCatalogEntryRequest._(
          displayName: displayName,
          sortOrder: sortOrder,
          isVisible: isVisible,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
