// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_runtime_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProviderRuntimeListResponse extends ProviderRuntimeListResponse {
  @override
  final BuiltList<ProviderRuntimeResponse> items;
  @override
  final int? snapshotMaxAgeSeconds;

  factory _$ProviderRuntimeListResponse(
          [void Function(ProviderRuntimeListResponseBuilder)? updates]) =>
      (ProviderRuntimeListResponseBuilder()..update(updates))._build();

  _$ProviderRuntimeListResponse._(
      {required this.items, this.snapshotMaxAgeSeconds})
      : super._();
  @override
  ProviderRuntimeListResponse rebuild(
          void Function(ProviderRuntimeListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProviderRuntimeListResponseBuilder toBuilder() =>
      ProviderRuntimeListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProviderRuntimeListResponse &&
        items == other.items &&
        snapshotMaxAgeSeconds == other.snapshotMaxAgeSeconds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, snapshotMaxAgeSeconds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProviderRuntimeListResponse')
          ..add('items', items)
          ..add('snapshotMaxAgeSeconds', snapshotMaxAgeSeconds))
        .toString();
  }
}

class ProviderRuntimeListResponseBuilder
    implements
        Builder<ProviderRuntimeListResponse,
            ProviderRuntimeListResponseBuilder> {
  _$ProviderRuntimeListResponse? _$v;

  ListBuilder<ProviderRuntimeResponse>? _items;
  ListBuilder<ProviderRuntimeResponse> get items =>
      _$this._items ??= ListBuilder<ProviderRuntimeResponse>();
  set items(ListBuilder<ProviderRuntimeResponse>? items) =>
      _$this._items = items;

  int? _snapshotMaxAgeSeconds;
  int? get snapshotMaxAgeSeconds => _$this._snapshotMaxAgeSeconds;
  set snapshotMaxAgeSeconds(int? snapshotMaxAgeSeconds) =>
      _$this._snapshotMaxAgeSeconds = snapshotMaxAgeSeconds;

  ProviderRuntimeListResponseBuilder() {
    ProviderRuntimeListResponse._defaults(this);
  }

  ProviderRuntimeListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _snapshotMaxAgeSeconds = $v.snapshotMaxAgeSeconds;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProviderRuntimeListResponse other) {
    _$v = other as _$ProviderRuntimeListResponse;
  }

  @override
  void update(void Function(ProviderRuntimeListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProviderRuntimeListResponse build() => _build();

  _$ProviderRuntimeListResponse _build() {
    _$ProviderRuntimeListResponse _$result;
    try {
      _$result = _$v ??
          _$ProviderRuntimeListResponse._(
            items: items.build(),
            snapshotMaxAgeSeconds: snapshotMaxAgeSeconds,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ProviderRuntimeListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
