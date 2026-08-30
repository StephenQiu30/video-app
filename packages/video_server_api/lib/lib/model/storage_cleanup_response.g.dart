// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_cleanup_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StorageCleanupResponse extends StorageCleanupResponse {
  @override
  final int olderThanDays;
  @override
  final int removedResources;
  @override
  final int removedObjects;
  @override
  final int freedBytes;
  @override
  final int failedResources;

  factory _$StorageCleanupResponse(
          [void Function(StorageCleanupResponseBuilder)? updates]) =>
      (StorageCleanupResponseBuilder()..update(updates))._build();

  _$StorageCleanupResponse._(
      {required this.olderThanDays,
      required this.removedResources,
      required this.removedObjects,
      required this.freedBytes,
      required this.failedResources})
      : super._();
  @override
  StorageCleanupResponse rebuild(
          void Function(StorageCleanupResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StorageCleanupResponseBuilder toBuilder() =>
      StorageCleanupResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StorageCleanupResponse &&
        olderThanDays == other.olderThanDays &&
        removedResources == other.removedResources &&
        removedObjects == other.removedObjects &&
        freedBytes == other.freedBytes &&
        failedResources == other.failedResources;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, olderThanDays.hashCode);
    _$hash = $jc(_$hash, removedResources.hashCode);
    _$hash = $jc(_$hash, removedObjects.hashCode);
    _$hash = $jc(_$hash, freedBytes.hashCode);
    _$hash = $jc(_$hash, failedResources.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StorageCleanupResponse')
          ..add('olderThanDays', olderThanDays)
          ..add('removedResources', removedResources)
          ..add('removedObjects', removedObjects)
          ..add('freedBytes', freedBytes)
          ..add('failedResources', failedResources))
        .toString();
  }
}

class StorageCleanupResponseBuilder
    implements Builder<StorageCleanupResponse, StorageCleanupResponseBuilder> {
  _$StorageCleanupResponse? _$v;

  int? _olderThanDays;
  int? get olderThanDays => _$this._olderThanDays;
  set olderThanDays(int? olderThanDays) =>
      _$this._olderThanDays = olderThanDays;

  int? _removedResources;
  int? get removedResources => _$this._removedResources;
  set removedResources(int? removedResources) =>
      _$this._removedResources = removedResources;

  int? _removedObjects;
  int? get removedObjects => _$this._removedObjects;
  set removedObjects(int? removedObjects) =>
      _$this._removedObjects = removedObjects;

  int? _freedBytes;
  int? get freedBytes => _$this._freedBytes;
  set freedBytes(int? freedBytes) => _$this._freedBytes = freedBytes;

  int? _failedResources;
  int? get failedResources => _$this._failedResources;
  set failedResources(int? failedResources) =>
      _$this._failedResources = failedResources;

  StorageCleanupResponseBuilder() {
    StorageCleanupResponse._defaults(this);
  }

  StorageCleanupResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _olderThanDays = $v.olderThanDays;
      _removedResources = $v.removedResources;
      _removedObjects = $v.removedObjects;
      _freedBytes = $v.freedBytes;
      _failedResources = $v.failedResources;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StorageCleanupResponse other) {
    _$v = other as _$StorageCleanupResponse;
  }

  @override
  void update(void Function(StorageCleanupResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StorageCleanupResponse build() => _build();

  _$StorageCleanupResponse _build() {
    final _$result = _$v ??
        _$StorageCleanupResponse._(
          olderThanDays: BuiltValueNullFieldError.checkNotNull(
              olderThanDays, r'StorageCleanupResponse', 'olderThanDays'),
          removedResources: BuiltValueNullFieldError.checkNotNull(
              removedResources, r'StorageCleanupResponse', 'removedResources'),
          removedObjects: BuiltValueNullFieldError.checkNotNull(
              removedObjects, r'StorageCleanupResponse', 'removedObjects'),
          freedBytes: BuiltValueNullFieldError.checkNotNull(
              freedBytes, r'StorageCleanupResponse', 'freedBytes'),
          failedResources: BuiltValueNullFieldError.checkNotNull(
              failedResources, r'StorageCleanupResponse', 'failedResources'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
