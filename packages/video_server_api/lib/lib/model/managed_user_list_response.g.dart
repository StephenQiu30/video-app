// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managed_user_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ManagedUserListResponse extends ManagedUserListResponse {
  @override
  final BuiltList<ManagedUserResponse> items;
  @override
  final int page;
  @override
  final int pageSize;
  @override
  final int total;

  factory _$ManagedUserListResponse(
          [void Function(ManagedUserListResponseBuilder)? updates]) =>
      (ManagedUserListResponseBuilder()..update(updates))._build();

  _$ManagedUserListResponse._(
      {required this.items,
      required this.page,
      required this.pageSize,
      required this.total})
      : super._();
  @override
  ManagedUserListResponse rebuild(
          void Function(ManagedUserListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ManagedUserListResponseBuilder toBuilder() =>
      ManagedUserListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ManagedUserListResponse &&
        items == other.items &&
        page == other.page &&
        pageSize == other.pageSize &&
        total == other.total;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, pageSize.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ManagedUserListResponse')
          ..add('items', items)
          ..add('page', page)
          ..add('pageSize', pageSize)
          ..add('total', total))
        .toString();
  }
}

class ManagedUserListResponseBuilder
    implements
        Builder<ManagedUserListResponse, ManagedUserListResponseBuilder> {
  _$ManagedUserListResponse? _$v;

  ListBuilder<ManagedUserResponse>? _items;
  ListBuilder<ManagedUserResponse> get items =>
      _$this._items ??= ListBuilder<ManagedUserResponse>();
  set items(ListBuilder<ManagedUserResponse>? items) => _$this._items = items;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _pageSize;
  int? get pageSize => _$this._pageSize;
  set pageSize(int? pageSize) => _$this._pageSize = pageSize;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ManagedUserListResponseBuilder() {
    ManagedUserListResponse._defaults(this);
  }

  ManagedUserListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _page = $v.page;
      _pageSize = $v.pageSize;
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ManagedUserListResponse other) {
    _$v = other as _$ManagedUserListResponse;
  }

  @override
  void update(void Function(ManagedUserListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ManagedUserListResponse build() => _build();

  _$ManagedUserListResponse _build() {
    _$ManagedUserListResponse _$result;
    try {
      _$result = _$v ??
          _$ManagedUserListResponse._(
            items: items.build(),
            page: BuiltValueNullFieldError.checkNotNull(
                page, r'ManagedUserListResponse', 'page'),
            pageSize: BuiltValueNullFieldError.checkNotNull(
                pageSize, r'ManagedUserListResponse', 'pageSize'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'ManagedUserListResponse', 'total'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ManagedUserListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
