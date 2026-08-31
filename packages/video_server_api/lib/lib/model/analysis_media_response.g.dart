// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_media_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnalysisMediaResponse extends AnalysisMediaResponse {
  @override
  final int durationMs;
  @override
  final String container;
  @override
  final int sizeBytes;

  factory _$AnalysisMediaResponse(
          [void Function(AnalysisMediaResponseBuilder)? updates]) =>
      (AnalysisMediaResponseBuilder()..update(updates))._build();

  _$AnalysisMediaResponse._(
      {required this.durationMs,
      required this.container,
      required this.sizeBytes})
      : super._();
  @override
  AnalysisMediaResponse rebuild(
          void Function(AnalysisMediaResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalysisMediaResponseBuilder toBuilder() =>
      AnalysisMediaResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalysisMediaResponse &&
        durationMs == other.durationMs &&
        container == other.container &&
        sizeBytes == other.sizeBytes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, durationMs.hashCode);
    _$hash = $jc(_$hash, container.hashCode);
    _$hash = $jc(_$hash, sizeBytes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnalysisMediaResponse')
          ..add('durationMs', durationMs)
          ..add('container', container)
          ..add('sizeBytes', sizeBytes))
        .toString();
  }
}

class AnalysisMediaResponseBuilder
    implements Builder<AnalysisMediaResponse, AnalysisMediaResponseBuilder> {
  _$AnalysisMediaResponse? _$v;

  int? _durationMs;
  int? get durationMs => _$this._durationMs;
  set durationMs(int? durationMs) => _$this._durationMs = durationMs;

  String? _container;
  String? get container => _$this._container;
  set container(String? container) => _$this._container = container;

  int? _sizeBytes;
  int? get sizeBytes => _$this._sizeBytes;
  set sizeBytes(int? sizeBytes) => _$this._sizeBytes = sizeBytes;

  AnalysisMediaResponseBuilder() {
    AnalysisMediaResponse._defaults(this);
  }

  AnalysisMediaResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _durationMs = $v.durationMs;
      _container = $v.container;
      _sizeBytes = $v.sizeBytes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalysisMediaResponse other) {
    _$v = other as _$AnalysisMediaResponse;
  }

  @override
  void update(void Function(AnalysisMediaResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalysisMediaResponse build() => _build();

  _$AnalysisMediaResponse _build() {
    final _$result = _$v ??
        _$AnalysisMediaResponse._(
          durationMs: BuiltValueNullFieldError.checkNotNull(
              durationMs, r'AnalysisMediaResponse', 'durationMs'),
          container: BuiltValueNullFieldError.checkNotNull(
              container, r'AnalysisMediaResponse', 'container'),
          sizeBytes: BuiltValueNullFieldError.checkNotNull(
              sizeBytes, r'AnalysisMediaResponse', 'sizeBytes'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
