// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_history_summary_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DownloadHistorySummaryResponse extends DownloadHistorySummaryResponse {
  @override
  final int total;
  @override
  final int succeeded;
  @override
  final int active;
  @override
  final int failed;

  factory _$DownloadHistorySummaryResponse(
          [void Function(DownloadHistorySummaryResponseBuilder)? updates]) =>
      (DownloadHistorySummaryResponseBuilder()..update(updates))._build();

  _$DownloadHistorySummaryResponse._(
      {required this.total,
      required this.succeeded,
      required this.active,
      required this.failed})
      : super._();
  @override
  DownloadHistorySummaryResponse rebuild(
          void Function(DownloadHistorySummaryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DownloadHistorySummaryResponseBuilder toBuilder() =>
      DownloadHistorySummaryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DownloadHistorySummaryResponse &&
        total == other.total &&
        succeeded == other.succeeded &&
        active == other.active &&
        failed == other.failed;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, succeeded.hashCode);
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jc(_$hash, failed.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DownloadHistorySummaryResponse')
          ..add('total', total)
          ..add('succeeded', succeeded)
          ..add('active', active)
          ..add('failed', failed))
        .toString();
  }
}

class DownloadHistorySummaryResponseBuilder
    implements
        Builder<DownloadHistorySummaryResponse,
            DownloadHistorySummaryResponseBuilder> {
  _$DownloadHistorySummaryResponse? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _succeeded;
  int? get succeeded => _$this._succeeded;
  set succeeded(int? succeeded) => _$this._succeeded = succeeded;

  int? _active;
  int? get active => _$this._active;
  set active(int? active) => _$this._active = active;

  int? _failed;
  int? get failed => _$this._failed;
  set failed(int? failed) => _$this._failed = failed;

  DownloadHistorySummaryResponseBuilder() {
    DownloadHistorySummaryResponse._defaults(this);
  }

  DownloadHistorySummaryResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _succeeded = $v.succeeded;
      _active = $v.active;
      _failed = $v.failed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DownloadHistorySummaryResponse other) {
    _$v = other as _$DownloadHistorySummaryResponse;
  }

  @override
  void update(void Function(DownloadHistorySummaryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DownloadHistorySummaryResponse build() => _build();

  _$DownloadHistorySummaryResponse _build() {
    final _$result = _$v ??
        _$DownloadHistorySummaryResponse._(
          total: BuiltValueNullFieldError.checkNotNull(
              total, r'DownloadHistorySummaryResponse', 'total'),
          succeeded: BuiltValueNullFieldError.checkNotNull(
              succeeded, r'DownloadHistorySummaryResponse', 'succeeded'),
          active: BuiltValueNullFieldError.checkNotNull(
              active, r'DownloadHistorySummaryResponse', 'active'),
          failed: BuiltValueNullFieldError.checkNotNull(
              failed, r'DownloadHistorySummaryResponse', 'failed'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
