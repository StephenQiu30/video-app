// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_history_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DownloadHistoryResponse extends DownloadHistoryResponse {
  @override
  final BuiltList<DownloadHistoryItemResponse> items;
  @override
  final int page;
  @override
  final int pageSize;
  @override
  final int total;
  @override
  final DownloadHistorySummaryResponse summary;

  factory _$DownloadHistoryResponse(
          [void Function(DownloadHistoryResponseBuilder)? updates]) =>
      (DownloadHistoryResponseBuilder()..update(updates))._build();

  _$DownloadHistoryResponse._(
      {required this.items,
      required this.page,
      required this.pageSize,
      required this.total,
      required this.summary})
      : super._();
  @override
  DownloadHistoryResponse rebuild(
          void Function(DownloadHistoryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DownloadHistoryResponseBuilder toBuilder() =>
      DownloadHistoryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DownloadHistoryResponse &&
        items == other.items &&
        page == other.page &&
        pageSize == other.pageSize &&
        total == other.total &&
        summary == other.summary;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, pageSize.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DownloadHistoryResponse')
          ..add('items', items)
          ..add('page', page)
          ..add('pageSize', pageSize)
          ..add('total', total)
          ..add('summary', summary))
        .toString();
  }
}

class DownloadHistoryResponseBuilder
    implements
        Builder<DownloadHistoryResponse, DownloadHistoryResponseBuilder> {
  _$DownloadHistoryResponse? _$v;

  ListBuilder<DownloadHistoryItemResponse>? _items;
  ListBuilder<DownloadHistoryItemResponse> get items =>
      _$this._items ??= ListBuilder<DownloadHistoryItemResponse>();
  set items(ListBuilder<DownloadHistoryItemResponse>? items) =>
      _$this._items = items;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _pageSize;
  int? get pageSize => _$this._pageSize;
  set pageSize(int? pageSize) => _$this._pageSize = pageSize;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  DownloadHistorySummaryResponseBuilder? _summary;
  DownloadHistorySummaryResponseBuilder get summary =>
      _$this._summary ??= DownloadHistorySummaryResponseBuilder();
  set summary(DownloadHistorySummaryResponseBuilder? summary) =>
      _$this._summary = summary;

  DownloadHistoryResponseBuilder() {
    DownloadHistoryResponse._defaults(this);
  }

  DownloadHistoryResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _page = $v.page;
      _pageSize = $v.pageSize;
      _total = $v.total;
      _summary = $v.summary.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DownloadHistoryResponse other) {
    _$v = other as _$DownloadHistoryResponse;
  }

  @override
  void update(void Function(DownloadHistoryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DownloadHistoryResponse build() => _build();

  _$DownloadHistoryResponse _build() {
    _$DownloadHistoryResponse _$result;
    try {
      _$result = _$v ??
          _$DownloadHistoryResponse._(
            items: items.build(),
            page: BuiltValueNullFieldError.checkNotNull(
                page, r'DownloadHistoryResponse', 'page'),
            pageSize: BuiltValueNullFieldError.checkNotNull(
                pageSize, r'DownloadHistoryResponse', 'pageSize'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'DownloadHistoryResponse', 'total'),
            summary: summary.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();

        _$failedField = 'summary';
        summary.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DownloadHistoryResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
