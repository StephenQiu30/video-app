// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_analytics_summary_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DownloadAnalyticsSummaryResponse
    extends DownloadAnalyticsSummaryResponse {
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
  final num averageDurationSeconds;
  @override
  final num successRate;

  factory _$DownloadAnalyticsSummaryResponse(
          [void Function(DownloadAnalyticsSummaryResponseBuilder)? updates]) =>
      (DownloadAnalyticsSummaryResponseBuilder()..update(updates))._build();

  _$DownloadAnalyticsSummaryResponse._(
      {required this.total,
      required this.succeeded,
      required this.failed,
      required this.cancelled,
      required this.active,
      required this.uniqueUsers,
      required this.downloadedBytes,
      required this.averageDurationSeconds,
      required this.successRate})
      : super._();
  @override
  DownloadAnalyticsSummaryResponse rebuild(
          void Function(DownloadAnalyticsSummaryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DownloadAnalyticsSummaryResponseBuilder toBuilder() =>
      DownloadAnalyticsSummaryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DownloadAnalyticsSummaryResponse &&
        total == other.total &&
        succeeded == other.succeeded &&
        failed == other.failed &&
        cancelled == other.cancelled &&
        active == other.active &&
        uniqueUsers == other.uniqueUsers &&
        downloadedBytes == other.downloadedBytes &&
        averageDurationSeconds == other.averageDurationSeconds &&
        successRate == other.successRate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, succeeded.hashCode);
    _$hash = $jc(_$hash, failed.hashCode);
    _$hash = $jc(_$hash, cancelled.hashCode);
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jc(_$hash, uniqueUsers.hashCode);
    _$hash = $jc(_$hash, downloadedBytes.hashCode);
    _$hash = $jc(_$hash, averageDurationSeconds.hashCode);
    _$hash = $jc(_$hash, successRate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DownloadAnalyticsSummaryResponse')
          ..add('total', total)
          ..add('succeeded', succeeded)
          ..add('failed', failed)
          ..add('cancelled', cancelled)
          ..add('active', active)
          ..add('uniqueUsers', uniqueUsers)
          ..add('downloadedBytes', downloadedBytes)
          ..add('averageDurationSeconds', averageDurationSeconds)
          ..add('successRate', successRate))
        .toString();
  }
}

class DownloadAnalyticsSummaryResponseBuilder
    implements
        Builder<DownloadAnalyticsSummaryResponse,
            DownloadAnalyticsSummaryResponseBuilder> {
  _$DownloadAnalyticsSummaryResponse? _$v;

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

  num? _averageDurationSeconds;
  num? get averageDurationSeconds => _$this._averageDurationSeconds;
  set averageDurationSeconds(num? averageDurationSeconds) =>
      _$this._averageDurationSeconds = averageDurationSeconds;

  num? _successRate;
  num? get successRate => _$this._successRate;
  set successRate(num? successRate) => _$this._successRate = successRate;

  DownloadAnalyticsSummaryResponseBuilder() {
    DownloadAnalyticsSummaryResponse._defaults(this);
  }

  DownloadAnalyticsSummaryResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _succeeded = $v.succeeded;
      _failed = $v.failed;
      _cancelled = $v.cancelled;
      _active = $v.active;
      _uniqueUsers = $v.uniqueUsers;
      _downloadedBytes = $v.downloadedBytes;
      _averageDurationSeconds = $v.averageDurationSeconds;
      _successRate = $v.successRate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DownloadAnalyticsSummaryResponse other) {
    _$v = other as _$DownloadAnalyticsSummaryResponse;
  }

  @override
  void update(void Function(DownloadAnalyticsSummaryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DownloadAnalyticsSummaryResponse build() => _build();

  _$DownloadAnalyticsSummaryResponse _build() {
    final _$result = _$v ??
        _$DownloadAnalyticsSummaryResponse._(
          total: BuiltValueNullFieldError.checkNotNull(
              total, r'DownloadAnalyticsSummaryResponse', 'total'),
          succeeded: BuiltValueNullFieldError.checkNotNull(
              succeeded, r'DownloadAnalyticsSummaryResponse', 'succeeded'),
          failed: BuiltValueNullFieldError.checkNotNull(
              failed, r'DownloadAnalyticsSummaryResponse', 'failed'),
          cancelled: BuiltValueNullFieldError.checkNotNull(
              cancelled, r'DownloadAnalyticsSummaryResponse', 'cancelled'),
          active: BuiltValueNullFieldError.checkNotNull(
              active, r'DownloadAnalyticsSummaryResponse', 'active'),
          uniqueUsers: BuiltValueNullFieldError.checkNotNull(
              uniqueUsers, r'DownloadAnalyticsSummaryResponse', 'uniqueUsers'),
          downloadedBytes: BuiltValueNullFieldError.checkNotNull(
              downloadedBytes,
              r'DownloadAnalyticsSummaryResponse',
              'downloadedBytes'),
          averageDurationSeconds: BuiltValueNullFieldError.checkNotNull(
              averageDurationSeconds,
              r'DownloadAnalyticsSummaryResponse',
              'averageDurationSeconds'),
          successRate: BuiltValueNullFieldError.checkNotNull(
              successRate, r'DownloadAnalyticsSummaryResponse', 'successRate'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
