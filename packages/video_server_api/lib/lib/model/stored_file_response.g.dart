// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stored_file_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StoredFileResponse extends StoredFileResponse {
  @override
  final String id;
  @override
  final StoredFileCategory category;
  @override
  final String name;
  @override
  final int objectCount;
  @override
  final int sizeBytes;
  @override
  final DateTime createdAt;

  factory _$StoredFileResponse(
          [void Function(StoredFileResponseBuilder)? updates]) =>
      (StoredFileResponseBuilder()..update(updates))._build();

  _$StoredFileResponse._(
      {required this.id,
      required this.category,
      required this.name,
      required this.objectCount,
      required this.sizeBytes,
      required this.createdAt})
      : super._();
  @override
  StoredFileResponse rebuild(
          void Function(StoredFileResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoredFileResponseBuilder toBuilder() =>
      StoredFileResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoredFileResponse &&
        id == other.id &&
        category == other.category &&
        name == other.name &&
        objectCount == other.objectCount &&
        sizeBytes == other.sizeBytes &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, objectCount.hashCode);
    _$hash = $jc(_$hash, sizeBytes.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StoredFileResponse')
          ..add('id', id)
          ..add('category', category)
          ..add('name', name)
          ..add('objectCount', objectCount)
          ..add('sizeBytes', sizeBytes)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class StoredFileResponseBuilder
    implements Builder<StoredFileResponse, StoredFileResponseBuilder> {
  _$StoredFileResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  StoredFileCategory? _category;
  StoredFileCategory? get category => _$this._category;
  set category(StoredFileCategory? category) => _$this._category = category;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _objectCount;
  int? get objectCount => _$this._objectCount;
  set objectCount(int? objectCount) => _$this._objectCount = objectCount;

  int? _sizeBytes;
  int? get sizeBytes => _$this._sizeBytes;
  set sizeBytes(int? sizeBytes) => _$this._sizeBytes = sizeBytes;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  StoredFileResponseBuilder() {
    StoredFileResponse._defaults(this);
  }

  StoredFileResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _category = $v.category;
      _name = $v.name;
      _objectCount = $v.objectCount;
      _sizeBytes = $v.sizeBytes;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoredFileResponse other) {
    _$v = other as _$StoredFileResponse;
  }

  @override
  void update(void Function(StoredFileResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StoredFileResponse build() => _build();

  _$StoredFileResponse _build() {
    final _$result = _$v ??
        _$StoredFileResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'StoredFileResponse', 'id'),
          category: BuiltValueNullFieldError.checkNotNull(
              category, r'StoredFileResponse', 'category'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'StoredFileResponse', 'name'),
          objectCount: BuiltValueNullFieldError.checkNotNull(
              objectCount, r'StoredFileResponse', 'objectCount'),
          sizeBytes: BuiltValueNullFieldError.checkNotNull(
              sizeBytes, r'StoredFileResponse', 'sizeBytes'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'StoredFileResponse', 'createdAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
