// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_analytics_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DownloadAnalyticsResponse extends DownloadAnalyticsResponse {
  @override
  final int periodDays;
  @override
  final DateTime start;
  @override
  final DateTime end;
  @override
  final DownloadAnalyticsSummaryResponse summary;
  @override
  final BuiltList<DownloadAnalyticsDailyResponse> daily;
  @override
  final BuiltList<DownloadAnalyticsSourceResponse> sources;

  factory _$DownloadAnalyticsResponse(
          [void Function(DownloadAnalyticsResponseBuilder)? updates]) =>
      (DownloadAnalyticsResponseBuilder()..update(updates))._build();

  _$DownloadAnalyticsResponse._(
      {required this.periodDays,
      required this.start,
      required this.end,
      required this.summary,
      required this.daily,
      required this.sources})
      : super._();
  @override
  DownloadAnalyticsResponse rebuild(
          void Function(DownloadAnalyticsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DownloadAnalyticsResponseBuilder toBuilder() =>
      DownloadAnalyticsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DownloadAnalyticsResponse &&
        periodDays == other.periodDays &&
        start == other.start &&
        end == other.end &&
        summary == other.summary &&
        daily == other.daily &&
        sources == other.sources;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, periodDays.hashCode);
    _$hash = $jc(_$hash, start.hashCode);
    _$hash = $jc(_$hash, end.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, daily.hashCode);
    _$hash = $jc(_$hash, sources.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DownloadAnalyticsResponse')
          ..add('periodDays', periodDays)
          ..add('start', start)
          ..add('end', end)
          ..add('summary', summary)
          ..add('daily', daily)
          ..add('sources', sources))
        .toString();
  }
}

class DownloadAnalyticsResponseBuilder
    implements
        Builder<DownloadAnalyticsResponse, DownloadAnalyticsResponseBuilder> {
  _$DownloadAnalyticsResponse? _$v;

  int? _periodDays;
  int? get periodDays => _$this._periodDays;
  set periodDays(int? periodDays) => _$this._periodDays = periodDays;

  DateTime? _start;
  DateTime? get start => _$this._start;
  set start(DateTime? start) => _$this._start = start;

  DateTime? _end;
  DateTime? get end => _$this._end;
  set end(DateTime? end) => _$this._end = end;

  DownloadAnalyticsSummaryResponseBuilder? _summary;
  DownloadAnalyticsSummaryResponseBuilder get summary =>
      _$this._summary ??= DownloadAnalyticsSummaryResponseBuilder();
  set summary(DownloadAnalyticsSummaryResponseBuilder? summary) =>
      _$this._summary = summary;

  ListBuilder<DownloadAnalyticsDailyResponse>? _daily;
  ListBuilder<DownloadAnalyticsDailyResponse> get daily =>
      _$this._daily ??= ListBuilder<DownloadAnalyticsDailyResponse>();
  set daily(ListBuilder<DownloadAnalyticsDailyResponse>? daily) =>
      _$this._daily = daily;

  ListBuilder<DownloadAnalyticsSourceResponse>? _sources;
  ListBuilder<DownloadAnalyticsSourceResponse> get sources =>
      _$this._sources ??= ListBuilder<DownloadAnalyticsSourceResponse>();
  set sources(ListBuilder<DownloadAnalyticsSourceResponse>? sources) =>
      _$this._sources = sources;

  DownloadAnalyticsResponseBuilder() {
    DownloadAnalyticsResponse._defaults(this);
  }

  DownloadAnalyticsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _periodDays = $v.periodDays;
      _start = $v.start;
      _end = $v.end;
      _summary = $v.summary.toBuilder();
      _daily = $v.daily.toBuilder();
      _sources = $v.sources.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DownloadAnalyticsResponse other) {
    _$v = other as _$DownloadAnalyticsResponse;
  }

  @override
  void update(void Function(DownloadAnalyticsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DownloadAnalyticsResponse build() => _build();

  _$DownloadAnalyticsResponse _build() {
    _$DownloadAnalyticsResponse _$result;
    try {
      _$result = _$v ??
          _$DownloadAnalyticsResponse._(
            periodDays: BuiltValueNullFieldError.checkNotNull(
                periodDays, r'DownloadAnalyticsResponse', 'periodDays'),
            start: BuiltValueNullFieldError.checkNotNull(
                start, r'DownloadAnalyticsResponse', 'start'),
            end: BuiltValueNullFieldError.checkNotNull(
                end, r'DownloadAnalyticsResponse', 'end'),
            summary: summary.build(),
            daily: daily.build(),
            sources: sources.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'summary';
        summary.build();
        _$failedField = 'daily';
        daily.build();
        _$failedField = 'sources';
        sources.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DownloadAnalyticsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
