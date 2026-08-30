// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_cleanup_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StorageCleanupRequest extends StorageCleanupRequest {
  @override
  final int? olderThanDays;

  factory _$StorageCleanupRequest(
          [void Function(StorageCleanupRequestBuilder)? updates]) =>
      (StorageCleanupRequestBuilder()..update(updates))._build();

  _$StorageCleanupRequest._({this.olderThanDays}) : super._();
  @override
  StorageCleanupRequest rebuild(
          void Function(StorageCleanupRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StorageCleanupRequestBuilder toBuilder() =>
      StorageCleanupRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StorageCleanupRequest &&
        olderThanDays == other.olderThanDays;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, olderThanDays.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StorageCleanupRequest')
          ..add('olderThanDays', olderThanDays))
        .toString();
  }
}

class StorageCleanupRequestBuilder
    implements Builder<StorageCleanupRequest, StorageCleanupRequestBuilder> {
  _$StorageCleanupRequest? _$v;

  int? _olderThanDays;
  int? get olderThanDays => _$this._olderThanDays;
  set olderThanDays(int? olderThanDays) =>
      _$this._olderThanDays = olderThanDays;

  StorageCleanupRequestBuilder() {
    StorageCleanupRequest._defaults(this);
  }

  StorageCleanupRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _olderThanDays = $v.olderThanDays;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StorageCleanupRequest other) {
    _$v = other as _$StorageCleanupRequest;
  }

  @override
  void update(void Function(StorageCleanupRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StorageCleanupRequest build() => _build();

  _$StorageCleanupRequest _build() {
    final _$result = _$v ??
        _$StorageCleanupRequest._(
          olderThanDays: olderThanDays,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
