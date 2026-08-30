// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_page_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DocumentPageResponse extends DocumentPageResponse {
  @override
  final BuiltList<DocumentResponse> items;
  @override
  final int page;
  @override
  final int pageSize;
  @override
  final int total;

  factory _$DocumentPageResponse(
          [void Function(DocumentPageResponseBuilder)? updates]) =>
      (DocumentPageResponseBuilder()..update(updates))._build();

  _$DocumentPageResponse._(
      {required this.items,
      required this.page,
      required this.pageSize,
      required this.total})
      : super._();
  @override
  DocumentPageResponse rebuild(
          void Function(DocumentPageResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DocumentPageResponseBuilder toBuilder() =>
      DocumentPageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DocumentPageResponse &&
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
    return (newBuiltValueToStringHelper(r'DocumentPageResponse')
          ..add('items', items)
          ..add('page', page)
          ..add('pageSize', pageSize)
          ..add('total', total))
        .toString();
  }
}

class DocumentPageResponseBuilder
    implements Builder<DocumentPageResponse, DocumentPageResponseBuilder> {
  _$DocumentPageResponse? _$v;

  ListBuilder<DocumentResponse>? _items;
  ListBuilder<DocumentResponse> get items =>
      _$this._items ??= ListBuilder<DocumentResponse>();
  set items(ListBuilder<DocumentResponse>? items) => _$this._items = items;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _pageSize;
  int? get pageSize => _$this._pageSize;
  set pageSize(int? pageSize) => _$this._pageSize = pageSize;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  DocumentPageResponseBuilder() {
    DocumentPageResponse._defaults(this);
  }

  DocumentPageResponseBuilder get _$this {
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
  void replace(DocumentPageResponse other) {
    _$v = other as _$DocumentPageResponse;
  }

  @override
  void update(void Function(DocumentPageResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DocumentPageResponse build() => _build();

  _$DocumentPageResponse _build() {
    _$DocumentPageResponse _$result;
    try {
      _$result = _$v ??
          _$DocumentPageResponse._(
            items: items.build(),
            page: BuiltValueNullFieldError.checkNotNull(
                page, r'DocumentPageResponse', 'page'),
            pageSize: BuiltValueNullFieldError.checkNotNull(
                pageSize, r'DocumentPageResponse', 'pageSize'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'DocumentPageResponse', 'total'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DocumentPageResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
