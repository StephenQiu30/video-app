// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProviderListResponse extends ProviderListResponse {
  @override
  final BuiltList<ProviderStatusResponse> items;

  factory _$ProviderListResponse(
          [void Function(ProviderListResponseBuilder)? updates]) =>
      (ProviderListResponseBuilder()..update(updates))._build();

  _$ProviderListResponse._({required this.items}) : super._();
  @override
  ProviderListResponse rebuild(
          void Function(ProviderListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProviderListResponseBuilder toBuilder() =>
      ProviderListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProviderListResponse && items == other.items;
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
    return (newBuiltValueToStringHelper(r'ProviderListResponse')
          ..add('items', items))
        .toString();
  }
}

class ProviderListResponseBuilder
    implements Builder<ProviderListResponse, ProviderListResponseBuilder> {
  _$ProviderListResponse? _$v;

  ListBuilder<ProviderStatusResponse>? _items;
  ListBuilder<ProviderStatusResponse> get items =>
      _$this._items ??= ListBuilder<ProviderStatusResponse>();
  set items(ListBuilder<ProviderStatusResponse>? items) =>
      _$this._items = items;

  ProviderListResponseBuilder() {
    ProviderListResponse._defaults(this);
  }

  ProviderListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProviderListResponse other) {
    _$v = other as _$ProviderListResponse;
  }

  @override
  void update(void Function(ProviderListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProviderListResponse build() => _build();

  _$ProviderListResponse _build() {
    _$ProviderListResponse _$result;
    try {
      _$result = _$v ??
          _$ProviderListResponse._(
            items: items.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ProviderListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
