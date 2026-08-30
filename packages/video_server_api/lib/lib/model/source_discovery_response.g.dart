// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_discovery_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SourceDiscoveryResponse extends SourceDiscoveryResponse {
  @override
  final String id;
  @override
  final String providerKey;
  @override
  final String title;
  @override
  final DiscoveryStatus status;
  @override
  final DateTime expiresAt;
  @override
  final BuiltList<SourceDiscoveryItemResponse> items;

  factory _$SourceDiscoveryResponse(
          [void Function(SourceDiscoveryResponseBuilder)? updates]) =>
      (SourceDiscoveryResponseBuilder()..update(updates))._build();

  _$SourceDiscoveryResponse._(
      {required this.id,
      required this.providerKey,
      required this.title,
      required this.status,
      required this.expiresAt,
      required this.items})
      : super._();
  @override
  SourceDiscoveryResponse rebuild(
          void Function(SourceDiscoveryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SourceDiscoveryResponseBuilder toBuilder() =>
      SourceDiscoveryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SourceDiscoveryResponse &&
        id == other.id &&
        providerKey == other.providerKey &&
        title == other.title &&
        status == other.status &&
        expiresAt == other.expiresAt &&
        items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, providerKey.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SourceDiscoveryResponse')
          ..add('id', id)
          ..add('providerKey', providerKey)
          ..add('title', title)
          ..add('status', status)
          ..add('expiresAt', expiresAt)
          ..add('items', items))
        .toString();
  }
}

class SourceDiscoveryResponseBuilder
    implements
        Builder<SourceDiscoveryResponse, SourceDiscoveryResponseBuilder> {
  _$SourceDiscoveryResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _providerKey;
  String? get providerKey => _$this._providerKey;
  set providerKey(String? providerKey) => _$this._providerKey = providerKey;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DiscoveryStatus? _status;
  DiscoveryStatus? get status => _$this._status;
  set status(DiscoveryStatus? status) => _$this._status = status;

  DateTime? _expiresAt;
  DateTime? get expiresAt => _$this._expiresAt;
  set expiresAt(DateTime? expiresAt) => _$this._expiresAt = expiresAt;

  ListBuilder<SourceDiscoveryItemResponse>? _items;
  ListBuilder<SourceDiscoveryItemResponse> get items =>
      _$this._items ??= ListBuilder<SourceDiscoveryItemResponse>();
  set items(ListBuilder<SourceDiscoveryItemResponse>? items) =>
      _$this._items = items;

  SourceDiscoveryResponseBuilder() {
    SourceDiscoveryResponse._defaults(this);
  }

  SourceDiscoveryResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _providerKey = $v.providerKey;
      _title = $v.title;
      _status = $v.status;
      _expiresAt = $v.expiresAt;
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SourceDiscoveryResponse other) {
    _$v = other as _$SourceDiscoveryResponse;
  }

  @override
  void update(void Function(SourceDiscoveryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SourceDiscoveryResponse build() => _build();

  _$SourceDiscoveryResponse _build() {
    _$SourceDiscoveryResponse _$result;
    try {
      _$result = _$v ??
          _$SourceDiscoveryResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'SourceDiscoveryResponse', 'id'),
            providerKey: BuiltValueNullFieldError.checkNotNull(
                providerKey, r'SourceDiscoveryResponse', 'providerKey'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'SourceDiscoveryResponse', 'title'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'SourceDiscoveryResponse', 'status'),
            expiresAt: BuiltValueNullFieldError.checkNotNull(
                expiresAt, r'SourceDiscoveryResponse', 'expiresAt'),
            items: items.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SourceDiscoveryResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
