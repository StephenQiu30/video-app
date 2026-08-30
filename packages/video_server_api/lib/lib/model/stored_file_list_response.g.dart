// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stored_file_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StoredFileListResponse extends StoredFileListResponse {
  @override
  final BuiltList<StoredFileResponse> items;
  @override
  final int page;
  @override
  final int pageSize;
  @override
  final int total;

  factory _$StoredFileListResponse(
          [void Function(StoredFileListResponseBuilder)? updates]) =>
      (StoredFileListResponseBuilder()..update(updates))._build();

  _$StoredFileListResponse._(
      {required this.items,
      required this.page,
      required this.pageSize,
      required this.total})
      : super._();
  @override
  StoredFileListResponse rebuild(
          void Function(StoredFileListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoredFileListResponseBuilder toBuilder() =>
      StoredFileListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoredFileListResponse &&
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
    return (newBuiltValueToStringHelper(r'StoredFileListResponse')
          ..add('items', items)
          ..add('page', page)
          ..add('pageSize', pageSize)
          ..add('total', total))
        .toString();
  }
}

class StoredFileListResponseBuilder
    implements Builder<StoredFileListResponse, StoredFileListResponseBuilder> {
  _$StoredFileListResponse? _$v;

  ListBuilder<StoredFileResponse>? _items;
  ListBuilder<StoredFileResponse> get items =>
      _$this._items ??= ListBuilder<StoredFileResponse>();
  set items(ListBuilder<StoredFileResponse>? items) => _$this._items = items;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _pageSize;
  int? get pageSize => _$this._pageSize;
  set pageSize(int? pageSize) => _$this._pageSize = pageSize;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  StoredFileListResponseBuilder() {
    StoredFileListResponse._defaults(this);
  }

  StoredFileListResponseBuilder get _$this {
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
  void replace(StoredFileListResponse other) {
    _$v = other as _$StoredFileListResponse;
  }

  @override
  void update(void Function(StoredFileListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StoredFileListResponse build() => _build();

  _$StoredFileListResponse _build() {
    _$StoredFileListResponse _$result;
    try {
      _$result = _$v ??
          _$StoredFileListResponse._(
            items: items.build(),
            page: BuiltValueNullFieldError.checkNotNull(
                page, r'StoredFileListResponse', 'page'),
            pageSize: BuiltValueNullFieldError.checkNotNull(
                pageSize, r'StoredFileListResponse', 'pageSize'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'StoredFileListResponse', 'total'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'StoredFileListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
