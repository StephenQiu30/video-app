// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_report_artifact_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnalysisReportArtifactResponse extends AnalysisReportArtifactResponse {
  @override
  final String format;
  @override
  final String mediaType;
  @override
  final int sizeBytes;
  @override
  final String sha256;

  factory _$AnalysisReportArtifactResponse(
          [void Function(AnalysisReportArtifactResponseBuilder)? updates]) =>
      (AnalysisReportArtifactResponseBuilder()..update(updates))._build();

  _$AnalysisReportArtifactResponse._(
      {required this.format,
      required this.mediaType,
      required this.sizeBytes,
      required this.sha256})
      : super._();
  @override
  AnalysisReportArtifactResponse rebuild(
          void Function(AnalysisReportArtifactResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalysisReportArtifactResponseBuilder toBuilder() =>
      AnalysisReportArtifactResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalysisReportArtifactResponse &&
        format == other.format &&
        mediaType == other.mediaType &&
        sizeBytes == other.sizeBytes &&
        sha256 == other.sha256;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jc(_$hash, mediaType.hashCode);
    _$hash = $jc(_$hash, sizeBytes.hashCode);
    _$hash = $jc(_$hash, sha256.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnalysisReportArtifactResponse')
          ..add('format', format)
          ..add('mediaType', mediaType)
          ..add('sizeBytes', sizeBytes)
          ..add('sha256', sha256))
        .toString();
  }
}

class AnalysisReportArtifactResponseBuilder
    implements
        Builder<AnalysisReportArtifactResponse,
            AnalysisReportArtifactResponseBuilder> {
  _$AnalysisReportArtifactResponse? _$v;

  String? _format;
  String? get format => _$this._format;
  set format(String? format) => _$this._format = format;

  String? _mediaType;
  String? get mediaType => _$this._mediaType;
  set mediaType(String? mediaType) => _$this._mediaType = mediaType;

  int? _sizeBytes;
  int? get sizeBytes => _$this._sizeBytes;
  set sizeBytes(int? sizeBytes) => _$this._sizeBytes = sizeBytes;

  String? _sha256;
  String? get sha256 => _$this._sha256;
  set sha256(String? sha256) => _$this._sha256 = sha256;

  AnalysisReportArtifactResponseBuilder() {
    AnalysisReportArtifactResponse._defaults(this);
  }

  AnalysisReportArtifactResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _format = $v.format;
      _mediaType = $v.mediaType;
      _sizeBytes = $v.sizeBytes;
      _sha256 = $v.sha256;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalysisReportArtifactResponse other) {
    _$v = other as _$AnalysisReportArtifactResponse;
  }

  @override
  void update(void Function(AnalysisReportArtifactResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalysisReportArtifactResponse build() => _build();

  _$AnalysisReportArtifactResponse _build() {
    final _$result = _$v ??
        _$AnalysisReportArtifactResponse._(
          format: BuiltValueNullFieldError.checkNotNull(
              format, r'AnalysisReportArtifactResponse', 'format'),
          mediaType: BuiltValueNullFieldError.checkNotNull(
              mediaType, r'AnalysisReportArtifactResponse', 'mediaType'),
          sizeBytes: BuiltValueNullFieldError.checkNotNull(
              sizeBytes, r'AnalysisReportArtifactResponse', 'sizeBytes'),
          sha256: BuiltValueNullFieldError.checkNotNull(
              sha256, r'AnalysisReportArtifactResponse', 'sha256'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
