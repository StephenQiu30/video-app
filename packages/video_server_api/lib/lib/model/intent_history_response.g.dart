// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intent_history_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IntentHistoryResponse extends IntentHistoryResponse {
  @override
  final BuiltList<IntentHistoryItemResponse> items;
  @override
  final String? nextCursor;

  factory _$IntentHistoryResponse(
          [void Function(IntentHistoryResponseBuilder)? updates]) =>
      (IntentHistoryResponseBuilder()..update(updates))._build();

  _$IntentHistoryResponse._({required this.items, this.nextCursor}) : super._();
  @override
  IntentHistoryResponse rebuild(
          void Function(IntentHistoryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IntentHistoryResponseBuilder toBuilder() =>
      IntentHistoryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IntentHistoryResponse &&
        items == other.items &&
        nextCursor == other.nextCursor;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, nextCursor.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IntentHistoryResponse')
          ..add('items', items)
          ..add('nextCursor', nextCursor))
        .toString();
  }
}

class IntentHistoryResponseBuilder
    implements Builder<IntentHistoryResponse, IntentHistoryResponseBuilder> {
  _$IntentHistoryResponse? _$v;

  ListBuilder<IntentHistoryItemResponse>? _items;
  ListBuilder<IntentHistoryItemResponse> get items =>
      _$this._items ??= ListBuilder<IntentHistoryItemResponse>();
  set items(ListBuilder<IntentHistoryItemResponse>? items) =>
      _$this._items = items;

  String? _nextCursor;
  String? get nextCursor => _$this._nextCursor;
  set nextCursor(String? nextCursor) => _$this._nextCursor = nextCursor;

  IntentHistoryResponseBuilder() {
    IntentHistoryResponse._defaults(this);
  }

  IntentHistoryResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _nextCursor = $v.nextCursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IntentHistoryResponse other) {
    _$v = other as _$IntentHistoryResponse;
  }

  @override
  void update(void Function(IntentHistoryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IntentHistoryResponse build() => _build();

  _$IntentHistoryResponse _build() {
    _$IntentHistoryResponse _$result;
    try {
      _$result = _$v ??
          _$IntentHistoryResponse._(
            items: items.build(),
            nextCursor: nextCursor,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'IntentHistoryResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
