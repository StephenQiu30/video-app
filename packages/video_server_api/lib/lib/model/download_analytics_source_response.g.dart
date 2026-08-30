// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_analytics_source_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DownloadAnalyticsSourceResponse
    extends DownloadAnalyticsSourceResponse {
  @override
  final String sourceKey;
  @override
  final String sourceName;
  @override
  final int total;
  @override
  final int succeeded;
  @override
  final int failed;
  @override
  final int cancelled;
  @override
  final int active;
  @override
  final int uniqueUsers;
  @override
  final int downloadedBytes;
  @override
  final num successRate;

  factory _$DownloadAnalyticsSourceResponse(
          [void Function(DownloadAnalyticsSourceResponseBuilder)? updates]) =>
      (DownloadAnalyticsSourceResponseBuilder()..update(updates))._build();

  _$DownloadAnalyticsSourceResponse._(
      {required this.sourceKey,
      required this.sourceName,
      required this.total,
      required this.succeeded,
      required this.failed,
      required this.cancelled,
      required this.active,
      required this.uniqueUsers,
      required this.downloadedBytes,
      required this.successRate})
      : super._();
  @override
  DownloadAnalyticsSourceResponse rebuild(
          void Function(DownloadAnalyticsSourceResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DownloadAnalyticsSourceResponseBuilder toBuilder() =>
      DownloadAnalyticsSourceResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DownloadAnalyticsSourceResponse &&
        sourceKey == other.sourceKey &&
        sourceName == other.sourceName &&
        total == other.total &&
        succeeded == other.succeeded &&
        failed == other.failed &&
        cancelled == other.cancelled &&
        active == other.active &&
        uniqueUsers == other.uniqueUsers &&
        downloadedBytes == other.downloadedBytes &&
        successRate == other.successRate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sourceKey.hashCode);
    _$hash = $jc(_$hash, sourceName.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, succeeded.hashCode);
    _$hash = $jc(_$hash, failed.hashCode);
    _$hash = $jc(_$hash, cancelled.hashCode);
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jc(_$hash, uniqueUsers.hashCode);
    _$hash = $jc(_$hash, downloadedBytes.hashCode);
    _$hash = $jc(_$hash, successRate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DownloadAnalyticsSourceResponse')
          ..add('sourceKey', sourceKey)
          ..add('sourceName', sourceName)
          ..add('total', total)
          ..add('succeeded', succeeded)
          ..add('failed', failed)
          ..add('cancelled', cancelled)
          ..add('active', active)
          ..add('uniqueUsers', uniqueUsers)
          ..add('downloadedBytes', downloadedBytes)
          ..add('successRate', successRate))
        .toString();
  }
}

class DownloadAnalyticsSourceResponseBuilder
    implements
        Builder<DownloadAnalyticsSourceResponse,
            DownloadAnalyticsSourceResponseBuilder> {
  _$DownloadAnalyticsSourceResponse? _$v;

  String? _sourceKey;
  String? get sourceKey => _$this._sourceKey;
  set sourceKey(String? sourceKey) => _$this._sourceKey = sourceKey;

  String? _sourceName;
  String? get sourceName => _$this._sourceName;
  set sourceName(String? sourceName) => _$this._sourceName = sourceName;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _succeeded;
  int? get succeeded => _$this._succeeded;
  set succeeded(int? succeeded) => _$this._succeeded = succeeded;

  int? _failed;
  int? get failed => _$this._failed;
  set failed(int? failed) => _$this._failed = failed;

  int? _cancelled;
  int? get cancelled => _$this._cancelled;
  set cancelled(int? cancelled) => _$this._cancelled = cancelled;

  int? _active;
  int? get active => _$this._active;
  set active(int? active) => _$this._active = active;

  int? _uniqueUsers;
  int? get uniqueUsers => _$this._uniqueUsers;
  set uniqueUsers(int? uniqueUsers) => _$this._uniqueUsers = uniqueUsers;

  int? _downloadedBytes;
  int? get downloadedBytes => _$this._downloadedBytes;
  set downloadedBytes(int? downloadedBytes) =>
      _$this._downloadedBytes = downloadedBytes;

  num? _successRate;
  num? get successRate => _$this._successRate;
  set successRate(num? successRate) => _$this._successRate = successRate;

  DownloadAnalyticsSourceResponseBuilder() {
    DownloadAnalyticsSourceResponse._defaults(this);
  }

  DownloadAnalyticsSourceResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sourceKey = $v.sourceKey;
      _sourceName = $v.sourceName;
      _total = $v.total;
      _succeeded = $v.succeeded;
      _failed = $v.failed;
      _cancelled = $v.cancelled;
      _active = $v.active;
      _uniqueUsers = $v.uniqueUsers;
      _downloadedBytes = $v.downloadedBytes;
      _successRate = $v.successRate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DownloadAnalyticsSourceResponse other) {
    _$v = other as _$DownloadAnalyticsSourceResponse;
  }

  @override
  void update(void Function(DownloadAnalyticsSourceResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DownloadAnalyticsSourceResponse build() => _build();

  _$DownloadAnalyticsSourceResponse _build() {
    final _$result = _$v ??
        _$DownloadAnalyticsSourceResponse._(
          sourceKey: BuiltValueNullFieldError.checkNotNull(
              sourceKey, r'DownloadAnalyticsSourceResponse', 'sourceKey'),
          sourceName: BuiltValueNullFieldError.checkNotNull(
              sourceName, r'DownloadAnalyticsSourceResponse', 'sourceName'),
          total: BuiltValueNullFieldError.checkNotNull(
              total, r'DownloadAnalyticsSourceResponse', 'total'),
          succeeded: BuiltValueNullFieldError.checkNotNull(
              succeeded, r'DownloadAnalyticsSourceResponse', 'succeeded'),
          failed: BuiltValueNullFieldError.checkNotNull(
              failed, r'DownloadAnalyticsSourceResponse', 'failed'),
          cancelled: BuiltValueNullFieldError.checkNotNull(
              cancelled, r'DownloadAnalyticsSourceResponse', 'cancelled'),
          active: BuiltValueNullFieldError.checkNotNull(
              active, r'DownloadAnalyticsSourceResponse', 'active'),
          uniqueUsers: BuiltValueNullFieldError.checkNotNull(
              uniqueUsers, r'DownloadAnalyticsSourceResponse', 'uniqueUsers'),
          downloadedBytes: BuiltValueNullFieldError.checkNotNull(
              downloadedBytes,
              r'DownloadAnalyticsSourceResponse',
              'downloadedBytes'),
          successRate: BuiltValueNullFieldError.checkNotNull(
              successRate, r'DownloadAnalyticsSourceResponse', 'successRate'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
