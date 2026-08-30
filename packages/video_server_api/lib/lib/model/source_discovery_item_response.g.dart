// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_discovery_item_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SourceDiscoveryItemResponse extends SourceDiscoveryItemResponse {
  @override
  final String itemRef;
  @override
  final DiscoveryItemKind kind;
  @override
  final String title;
  @override
  final int? durationMs;
  @override
  final DiscoveryDecisionHint decisionHint;
  @override
  final DiscoveryItemStatus status;

  factory _$SourceDiscoveryItemResponse(
          [void Function(SourceDiscoveryItemResponseBuilder)? updates]) =>
      (SourceDiscoveryItemResponseBuilder()..update(updates))._build();

  _$SourceDiscoveryItemResponse._(
      {required this.itemRef,
      required this.kind,
      required this.title,
      this.durationMs,
      required this.decisionHint,
      required this.status})
      : super._();
  @override
  SourceDiscoveryItemResponse rebuild(
          void Function(SourceDiscoveryItemResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SourceDiscoveryItemResponseBuilder toBuilder() =>
      SourceDiscoveryItemResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SourceDiscoveryItemResponse &&
        itemRef == other.itemRef &&
        kind == other.kind &&
        title == other.title &&
        durationMs == other.durationMs &&
        decisionHint == other.decisionHint &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, itemRef.hashCode);
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, durationMs.hashCode);
    _$hash = $jc(_$hash, decisionHint.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SourceDiscoveryItemResponse')
          ..add('itemRef', itemRef)
          ..add('kind', kind)
          ..add('title', title)
          ..add('durationMs', durationMs)
          ..add('decisionHint', decisionHint)
          ..add('status', status))
        .toString();
  }
}

class SourceDiscoveryItemResponseBuilder
    implements
        Builder<SourceDiscoveryItemResponse,
            SourceDiscoveryItemResponseBuilder> {
  _$SourceDiscoveryItemResponse? _$v;

  String? _itemRef;
  String? get itemRef => _$this._itemRef;
  set itemRef(String? itemRef) => _$this._itemRef = itemRef;

  DiscoveryItemKind? _kind;
  DiscoveryItemKind? get kind => _$this._kind;
  set kind(DiscoveryItemKind? kind) => _$this._kind = kind;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _durationMs;
  int? get durationMs => _$this._durationMs;
  set durationMs(int? durationMs) => _$this._durationMs = durationMs;

  DiscoveryDecisionHint? _decisionHint;
  DiscoveryDecisionHint? get decisionHint => _$this._decisionHint;
  set decisionHint(DiscoveryDecisionHint? decisionHint) =>
      _$this._decisionHint = decisionHint;

  DiscoveryItemStatus? _status;
  DiscoveryItemStatus? get status => _$this._status;
  set status(DiscoveryItemStatus? status) => _$this._status = status;

  SourceDiscoveryItemResponseBuilder() {
    SourceDiscoveryItemResponse._defaults(this);
  }

  SourceDiscoveryItemResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemRef = $v.itemRef;
      _kind = $v.kind;
      _title = $v.title;
      _durationMs = $v.durationMs;
      _decisionHint = $v.decisionHint;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SourceDiscoveryItemResponse other) {
    _$v = other as _$SourceDiscoveryItemResponse;
  }

  @override
  void update(void Function(SourceDiscoveryItemResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SourceDiscoveryItemResponse build() => _build();

  _$SourceDiscoveryItemResponse _build() {
    final _$result = _$v ??
        _$SourceDiscoveryItemResponse._(
          itemRef: BuiltValueNullFieldError.checkNotNull(
              itemRef, r'SourceDiscoveryItemResponse', 'itemRef'),
          kind: BuiltValueNullFieldError.checkNotNull(
              kind, r'SourceDiscoveryItemResponse', 'kind'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'SourceDiscoveryItemResponse', 'title'),
          durationMs: durationMs,
          decisionHint: BuiltValueNullFieldError.checkNotNull(
              decisionHint, r'SourceDiscoveryItemResponse', 'decisionHint'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'SourceDiscoveryItemResponse', 'status'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
