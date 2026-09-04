// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_parse_summary_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DocumentParseSummaryResponse extends DocumentParseSummaryResponse {
  @override
  final int? pageCount;
  @override
  final int paragraphCount;
  @override
  final int headingCount;
  @override
  final int listItemCount;
  @override
  final int tableCount;
  @override
  final int dialogueBlockCount;

  factory _$DocumentParseSummaryResponse(
          [void Function(DocumentParseSummaryResponseBuilder)? updates]) =>
      (DocumentParseSummaryResponseBuilder()..update(updates))._build();

  _$DocumentParseSummaryResponse._(
      {this.pageCount,
      required this.paragraphCount,
      required this.headingCount,
      required this.listItemCount,
      required this.tableCount,
      required this.dialogueBlockCount})
      : super._();
  @override
  DocumentParseSummaryResponse rebuild(
          void Function(DocumentParseSummaryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DocumentParseSummaryResponseBuilder toBuilder() =>
      DocumentParseSummaryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DocumentParseSummaryResponse &&
        pageCount == other.pageCount &&
        paragraphCount == other.paragraphCount &&
        headingCount == other.headingCount &&
        listItemCount == other.listItemCount &&
        tableCount == other.tableCount &&
        dialogueBlockCount == other.dialogueBlockCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pageCount.hashCode);
    _$hash = $jc(_$hash, paragraphCount.hashCode);
    _$hash = $jc(_$hash, headingCount.hashCode);
    _$hash = $jc(_$hash, listItemCount.hashCode);
    _$hash = $jc(_$hash, tableCount.hashCode);
    _$hash = $jc(_$hash, dialogueBlockCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DocumentParseSummaryResponse')
          ..add('pageCount', pageCount)
          ..add('paragraphCount', paragraphCount)
          ..add('headingCount', headingCount)
          ..add('listItemCount', listItemCount)
          ..add('tableCount', tableCount)
          ..add('dialogueBlockCount', dialogueBlockCount))
        .toString();
  }
}

class DocumentParseSummaryResponseBuilder
    implements
        Builder<DocumentParseSummaryResponse,
            DocumentParseSummaryResponseBuilder> {
  _$DocumentParseSummaryResponse? _$v;

  int? _pageCount;
  int? get pageCount => _$this._pageCount;
  set pageCount(int? pageCount) => _$this._pageCount = pageCount;

  int? _paragraphCount;
  int? get paragraphCount => _$this._paragraphCount;
  set paragraphCount(int? paragraphCount) =>
      _$this._paragraphCount = paragraphCount;

  int? _headingCount;
  int? get headingCount => _$this._headingCount;
  set headingCount(int? headingCount) => _$this._headingCount = headingCount;

  int? _listItemCount;
  int? get listItemCount => _$this._listItemCount;
  set listItemCount(int? listItemCount) =>
      _$this._listItemCount = listItemCount;

  int? _tableCount;
  int? get tableCount => _$this._tableCount;
  set tableCount(int? tableCount) => _$this._tableCount = tableCount;

  int? _dialogueBlockCount;
  int? get dialogueBlockCount => _$this._dialogueBlockCount;
  set dialogueBlockCount(int? dialogueBlockCount) =>
      _$this._dialogueBlockCount = dialogueBlockCount;

  DocumentParseSummaryResponseBuilder() {
    DocumentParseSummaryResponse._defaults(this);
  }

  DocumentParseSummaryResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pageCount = $v.pageCount;
      _paragraphCount = $v.paragraphCount;
      _headingCount = $v.headingCount;
      _listItemCount = $v.listItemCount;
      _tableCount = $v.tableCount;
      _dialogueBlockCount = $v.dialogueBlockCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DocumentParseSummaryResponse other) {
    _$v = other as _$DocumentParseSummaryResponse;
  }

  @override
  void update(void Function(DocumentParseSummaryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DocumentParseSummaryResponse build() => _build();

  _$DocumentParseSummaryResponse _build() {
    final _$result = _$v ??
        _$DocumentParseSummaryResponse._(
          pageCount: pageCount,
          paragraphCount: BuiltValueNullFieldError.checkNotNull(paragraphCount,
              r'DocumentParseSummaryResponse', 'paragraphCount'),
          headingCount: BuiltValueNullFieldError.checkNotNull(
              headingCount, r'DocumentParseSummaryResponse', 'headingCount'),
          listItemCount: BuiltValueNullFieldError.checkNotNull(
              listItemCount, r'DocumentParseSummaryResponse', 'listItemCount'),
          tableCount: BuiltValueNullFieldError.checkNotNull(
              tableCount, r'DocumentParseSummaryResponse', 'tableCount'),
          dialogueBlockCount: BuiltValueNullFieldError.checkNotNull(
              dialogueBlockCount,
              r'DocumentParseSummaryResponse',
              'dialogueBlockCount'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
