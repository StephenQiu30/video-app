// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_history_item_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DownloadHistoryItemResponse extends DownloadHistoryItemResponse {
  @override
  final String id;
  @override
  final String title;
  @override
  final String? thumbnailUrl;
  @override
  final String formatName;
  @override
  final DownloadStatus status;
  @override
  final int progress;
  @override
  final DownloadErrorCode? errorCode;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? finishedAt;
  @override
  final bool fileAvailable;
  @override
  final DownloadSourceKind sourceKind;
  @override
  final String sourceLabel;

  factory _$DownloadHistoryItemResponse(
          [void Function(DownloadHistoryItemResponseBuilder)? updates]) =>
      (DownloadHistoryItemResponseBuilder()..update(updates))._build();

  _$DownloadHistoryItemResponse._(
      {required this.id,
      required this.title,
      this.thumbnailUrl,
      required this.formatName,
      required this.status,
      required this.progress,
      this.errorCode,
      required this.createdAt,
      required this.updatedAt,
      this.finishedAt,
      required this.fileAvailable,
      required this.sourceKind,
      required this.sourceLabel})
      : super._();
  @override
  DownloadHistoryItemResponse rebuild(
          void Function(DownloadHistoryItemResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DownloadHistoryItemResponseBuilder toBuilder() =>
      DownloadHistoryItemResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DownloadHistoryItemResponse &&
        id == other.id &&
        title == other.title &&
        thumbnailUrl == other.thumbnailUrl &&
        formatName == other.formatName &&
        status == other.status &&
        progress == other.progress &&
        errorCode == other.errorCode &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        finishedAt == other.finishedAt &&
        fileAvailable == other.fileAvailable &&
        sourceKind == other.sourceKind &&
        sourceLabel == other.sourceLabel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, thumbnailUrl.hashCode);
    _$hash = $jc(_$hash, formatName.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, progress.hashCode);
    _$hash = $jc(_$hash, errorCode.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, finishedAt.hashCode);
    _$hash = $jc(_$hash, fileAvailable.hashCode);
    _$hash = $jc(_$hash, sourceKind.hashCode);
    _$hash = $jc(_$hash, sourceLabel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DownloadHistoryItemResponse')
          ..add('id', id)
          ..add('title', title)
          ..add('thumbnailUrl', thumbnailUrl)
          ..add('formatName', formatName)
          ..add('status', status)
          ..add('progress', progress)
          ..add('errorCode', errorCode)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('finishedAt', finishedAt)
          ..add('fileAvailable', fileAvailable)
          ..add('sourceKind', sourceKind)
          ..add('sourceLabel', sourceLabel))
        .toString();
  }
}

class DownloadHistoryItemResponseBuilder
    implements
        Builder<DownloadHistoryItemResponse,
            DownloadHistoryItemResponseBuilder> {
  _$DownloadHistoryItemResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _thumbnailUrl;
  String? get thumbnailUrl => _$this._thumbnailUrl;
  set thumbnailUrl(String? thumbnailUrl) => _$this._thumbnailUrl = thumbnailUrl;

  String? _formatName;
  String? get formatName => _$this._formatName;
  set formatName(String? formatName) => _$this._formatName = formatName;

  DownloadStatus? _status;
  DownloadStatus? get status => _$this._status;
  set status(DownloadStatus? status) => _$this._status = status;

  int? _progress;
  int? get progress => _$this._progress;
  set progress(int? progress) => _$this._progress = progress;

  DownloadErrorCode? _errorCode;
  DownloadErrorCode? get errorCode => _$this._errorCode;
  set errorCode(DownloadErrorCode? errorCode) => _$this._errorCode = errorCode;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  DateTime? _finishedAt;
  DateTime? get finishedAt => _$this._finishedAt;
  set finishedAt(DateTime? finishedAt) => _$this._finishedAt = finishedAt;

  bool? _fileAvailable;
  bool? get fileAvailable => _$this._fileAvailable;
  set fileAvailable(bool? fileAvailable) =>
      _$this._fileAvailable = fileAvailable;

  DownloadSourceKind? _sourceKind;
  DownloadSourceKind? get sourceKind => _$this._sourceKind;
  set sourceKind(DownloadSourceKind? sourceKind) =>
      _$this._sourceKind = sourceKind;

  String? _sourceLabel;
  String? get sourceLabel => _$this._sourceLabel;
  set sourceLabel(String? sourceLabel) => _$this._sourceLabel = sourceLabel;

  DownloadHistoryItemResponseBuilder() {
    DownloadHistoryItemResponse._defaults(this);
  }

  DownloadHistoryItemResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _thumbnailUrl = $v.thumbnailUrl;
      _formatName = $v.formatName;
      _status = $v.status;
      _progress = $v.progress;
      _errorCode = $v.errorCode;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _finishedAt = $v.finishedAt;
      _fileAvailable = $v.fileAvailable;
      _sourceKind = $v.sourceKind;
      _sourceLabel = $v.sourceLabel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DownloadHistoryItemResponse other) {
    _$v = other as _$DownloadHistoryItemResponse;
  }

  @override
  void update(void Function(DownloadHistoryItemResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DownloadHistoryItemResponse build() => _build();

  _$DownloadHistoryItemResponse _build() {
    final _$result = _$v ??
        _$DownloadHistoryItemResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'DownloadHistoryItemResponse', 'id'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'DownloadHistoryItemResponse', 'title'),
          thumbnailUrl: thumbnailUrl,
          formatName: BuiltValueNullFieldError.checkNotNull(
              formatName, r'DownloadHistoryItemResponse', 'formatName'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'DownloadHistoryItemResponse', 'status'),
          progress: BuiltValueNullFieldError.checkNotNull(
              progress, r'DownloadHistoryItemResponse', 'progress'),
          errorCode: errorCode,
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'DownloadHistoryItemResponse', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'DownloadHistoryItemResponse', 'updatedAt'),
          finishedAt: finishedAt,
          fileAvailable: BuiltValueNullFieldError.checkNotNull(
              fileAvailable, r'DownloadHistoryItemResponse', 'fileAvailable'),
          sourceKind: BuiltValueNullFieldError.checkNotNull(
              sourceKind, r'DownloadHistoryItemResponse', 'sourceKind'),
          sourceLabel: BuiltValueNullFieldError.checkNotNull(
              sourceLabel, r'DownloadHistoryItemResponse', 'sourceLabel'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
