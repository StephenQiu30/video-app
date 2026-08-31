// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_report_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnalysisReportResponse extends AnalysisReportResponse {
  @override
  final String id;
  @override
  final String status;
  @override
  final String rendererVersion;
  @override
  final String contentSha256;
  @override
  final DateTime? publishedAt;
  @override
  final BuiltList<AnalysisReportArtifactResponse> artifacts;

  factory _$AnalysisReportResponse(
          [void Function(AnalysisReportResponseBuilder)? updates]) =>
      (AnalysisReportResponseBuilder()..update(updates))._build();

  _$AnalysisReportResponse._(
      {required this.id,
      required this.status,
      required this.rendererVersion,
      required this.contentSha256,
      this.publishedAt,
      required this.artifacts})
      : super._();
  @override
  AnalysisReportResponse rebuild(
          void Function(AnalysisReportResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalysisReportResponseBuilder toBuilder() =>
      AnalysisReportResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalysisReportResponse &&
        id == other.id &&
        status == other.status &&
        rendererVersion == other.rendererVersion &&
        contentSha256 == other.contentSha256 &&
        publishedAt == other.publishedAt &&
        artifacts == other.artifacts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, rendererVersion.hashCode);
    _$hash = $jc(_$hash, contentSha256.hashCode);
    _$hash = $jc(_$hash, publishedAt.hashCode);
    _$hash = $jc(_$hash, artifacts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnalysisReportResponse')
          ..add('id', id)
          ..add('status', status)
          ..add('rendererVersion', rendererVersion)
          ..add('contentSha256', contentSha256)
          ..add('publishedAt', publishedAt)
          ..add('artifacts', artifacts))
        .toString();
  }
}

class AnalysisReportResponseBuilder
    implements Builder<AnalysisReportResponse, AnalysisReportResponseBuilder> {
  _$AnalysisReportResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _rendererVersion;
  String? get rendererVersion => _$this._rendererVersion;
  set rendererVersion(String? rendererVersion) =>
      _$this._rendererVersion = rendererVersion;

  String? _contentSha256;
  String? get contentSha256 => _$this._contentSha256;
  set contentSha256(String? contentSha256) =>
      _$this._contentSha256 = contentSha256;

  DateTime? _publishedAt;
  DateTime? get publishedAt => _$this._publishedAt;
  set publishedAt(DateTime? publishedAt) => _$this._publishedAt = publishedAt;

  ListBuilder<AnalysisReportArtifactResponse>? _artifacts;
  ListBuilder<AnalysisReportArtifactResponse> get artifacts =>
      _$this._artifacts ??= ListBuilder<AnalysisReportArtifactResponse>();
  set artifacts(ListBuilder<AnalysisReportArtifactResponse>? artifacts) =>
      _$this._artifacts = artifacts;

  AnalysisReportResponseBuilder() {
    AnalysisReportResponse._defaults(this);
  }

  AnalysisReportResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _status = $v.status;
      _rendererVersion = $v.rendererVersion;
      _contentSha256 = $v.contentSha256;
      _publishedAt = $v.publishedAt;
      _artifacts = $v.artifacts.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalysisReportResponse other) {
    _$v = other as _$AnalysisReportResponse;
  }

  @override
  void update(void Function(AnalysisReportResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalysisReportResponse build() => _build();

  _$AnalysisReportResponse _build() {
    _$AnalysisReportResponse _$result;
    try {
      _$result = _$v ??
          _$AnalysisReportResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AnalysisReportResponse', 'id'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AnalysisReportResponse', 'status'),
            rendererVersion: BuiltValueNullFieldError.checkNotNull(
                rendererVersion, r'AnalysisReportResponse', 'rendererVersion'),
            contentSha256: BuiltValueNullFieldError.checkNotNull(
                contentSha256, r'AnalysisReportResponse', 'contentSha256'),
            publishedAt: publishedAt,
            artifacts: artifacts.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'artifacts';
        artifacts.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AnalysisReportResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
