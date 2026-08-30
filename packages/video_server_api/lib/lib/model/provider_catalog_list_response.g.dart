// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_catalog_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProviderCatalogListResponse extends ProviderCatalogListResponse {
  @override
  final BuiltList<ProviderCatalogEntryResponse> items;

  factory _$ProviderCatalogListResponse(
          [void Function(ProviderCatalogListResponseBuilder)? updates]) =>
      (ProviderCatalogListResponseBuilder()..update(updates))._build();

  _$ProviderCatalogListResponse._({required this.items}) : super._();
  @override
  ProviderCatalogListResponse rebuild(
          void Function(ProviderCatalogListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProviderCatalogListResponseBuilder toBuilder() =>
      ProviderCatalogListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProviderCatalogListResponse && items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProviderCatalogListResponse')
          ..add('items', items))
        .toString();
  }
}

class ProviderCatalogListResponseBuilder
    implements
        Builder<ProviderCatalogListResponse,
            ProviderCatalogListResponseBuilder> {
  _$ProviderCatalogListResponse? _$v;

  ListBuilder<ProviderCatalogEntryResponse>? _items;
  ListBuilder<ProviderCatalogEntryResponse> get items =>
      _$this._items ??= ListBuilder<ProviderCatalogEntryResponse>();
  set items(ListBuilder<ProviderCatalogEntryResponse>? items) =>
      _$this._items = items;

  ProviderCatalogListResponseBuilder() {
    ProviderCatalogListResponse._defaults(this);
  }

  ProviderCatalogListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProviderCatalogListResponse other) {
    _$v = other as _$ProviderCatalogListResponse;
  }

  @override
  void update(void Function(ProviderCatalogListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProviderCatalogListResponse build() => _build();

  _$ProviderCatalogListResponse _build() {
    _$ProviderCatalogListResponse _$result;
    try {
      _$result = _$v ??
          _$ProviderCatalogListResponse._(
            items: items.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ProviderCatalogListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
