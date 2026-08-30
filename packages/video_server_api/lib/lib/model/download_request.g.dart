// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DownloadRequest extends DownloadRequest {
  @override
  final String inspectionId;
  @override
  final String formatId;

  factory _$DownloadRequest([void Function(DownloadRequestBuilder)? updates]) =>
      (DownloadRequestBuilder()..update(updates))._build();

  _$DownloadRequest._({required this.inspectionId, required this.formatId})
      : super._();
  @override
  DownloadRequest rebuild(void Function(DownloadRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DownloadRequestBuilder toBuilder() => DownloadRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DownloadRequest &&
        inspectionId == other.inspectionId &&
        formatId == other.formatId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, inspectionId.hashCode);
    _$hash = $jc(_$hash, formatId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DownloadRequest')
          ..add('inspectionId', inspectionId)
          ..add('formatId', formatId))
        .toString();
  }
}

class DownloadRequestBuilder
    implements Builder<DownloadRequest, DownloadRequestBuilder> {
  _$DownloadRequest? _$v;

  String? _inspectionId;
  String? get inspectionId => _$this._inspectionId;
  set inspectionId(String? inspectionId) => _$this._inspectionId = inspectionId;

  String? _formatId;
  String? get formatId => _$this._formatId;
  set formatId(String? formatId) => _$this._formatId = formatId;

  DownloadRequestBuilder() {
    DownloadRequest._defaults(this);
  }

  DownloadRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _inspectionId = $v.inspectionId;
      _formatId = $v.formatId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DownloadRequest other) {
    _$v = other as _$DownloadRequest;
  }

  @override
  void update(void Function(DownloadRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DownloadRequest build() => _build();

  _$DownloadRequest _build() {
    final _$result = _$v ??
        _$DownloadRequest._(
          inspectionId: BuiltValueNullFieldError.checkNotNull(
              inspectionId, r'DownloadRequest', 'inspectionId'),
          formatId: BuiltValueNullFieldError.checkNotNull(
              formatId, r'DownloadRequest', 'formatId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
