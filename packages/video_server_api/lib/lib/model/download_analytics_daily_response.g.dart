// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_analytics_daily_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DownloadAnalyticsDailyResponse extends DownloadAnalyticsDailyResponse {
  @override
  final Date date;
  @override
  final int total;
  @override
  final int succeeded;
  @override
  final int failed;
  @override
  final int cancelled;

  factory _$DownloadAnalyticsDailyResponse(
          [void Function(DownloadAnalyticsDailyResponseBuilder)? updates]) =>
      (DownloadAnalyticsDailyResponseBuilder()..update(updates))._build();

  _$DownloadAnalyticsDailyResponse._(
      {required this.date,
      required this.total,
      required this.succeeded,
      required this.failed,
      required this.cancelled})
      : super._();
  @override
  DownloadAnalyticsDailyResponse rebuild(
          void Function(DownloadAnalyticsDailyResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DownloadAnalyticsDailyResponseBuilder toBuilder() =>
      DownloadAnalyticsDailyResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DownloadAnalyticsDailyResponse &&
        date == other.date &&
        total == other.total &&
        succeeded == other.succeeded &&
        failed == other.failed &&
        cancelled == other.cancelled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, succeeded.hashCode);
    _$hash = $jc(_$hash, failed.hashCode);
    _$hash = $jc(_$hash, cancelled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DownloadAnalyticsDailyResponse')
          ..add('date', date)
          ..add('total', total)
          ..add('succeeded', succeeded)
          ..add('failed', failed)
          ..add('cancelled', cancelled))
        .toString();
  }
}

class DownloadAnalyticsDailyResponseBuilder
    implements
        Builder<DownloadAnalyticsDailyResponse,
            DownloadAnalyticsDailyResponseBuilder> {
  _$DownloadAnalyticsDailyResponse? _$v;

  Date? _date;
  Date? get date => _$this._date;
  set date(Date? date) => _$this._date = date;

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

  DownloadAnalyticsDailyResponseBuilder() {
    DownloadAnalyticsDailyResponse._defaults(this);
  }

  DownloadAnalyticsDailyResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _total = $v.total;
      _succeeded = $v.succeeded;
      _failed = $v.failed;
      _cancelled = $v.cancelled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DownloadAnalyticsDailyResponse other) {
    _$v = other as _$DownloadAnalyticsDailyResponse;
  }

  @override
  void update(void Function(DownloadAnalyticsDailyResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DownloadAnalyticsDailyResponse build() => _build();

  _$DownloadAnalyticsDailyResponse _build() {
    final _$result = _$v ??
        _$DownloadAnalyticsDailyResponse._(
          date: BuiltValueNullFieldError.checkNotNull(
              date, r'DownloadAnalyticsDailyResponse', 'date'),
          total: BuiltValueNullFieldError.checkNotNull(
              total, r'DownloadAnalyticsDailyResponse', 'total'),
          succeeded: BuiltValueNullFieldError.checkNotNull(
              succeeded, r'DownloadAnalyticsDailyResponse', 'succeeded'),
          failed: BuiltValueNullFieldError.checkNotNull(
              failed, r'DownloadAnalyticsDailyResponse', 'failed'),
          cancelled: BuiltValueNullFieldError.checkNotNull(
              cancelled, r'DownloadAnalyticsDailyResponse', 'cancelled'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
