// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visual_asset_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VisualAssetResponse extends VisualAssetResponse {
  @override
  final String id;
  @override
  final String type;
  @override
  final String label;
  @override
  final String description;
  @override
  final int firstSeenMs;
  @override
  final BuiltList<String> evidenceShotIds;

  factory _$VisualAssetResponse(
          [void Function(VisualAssetResponseBuilder)? updates]) =>
      (VisualAssetResponseBuilder()..update(updates))._build();

  _$VisualAssetResponse._(
      {required this.id,
      required this.type,
      required this.label,
      required this.description,
      required this.firstSeenMs,
      required this.evidenceShotIds})
      : super._();
  @override
  VisualAssetResponse rebuild(
          void Function(VisualAssetResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VisualAssetResponseBuilder toBuilder() =>
      VisualAssetResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VisualAssetResponse &&
        id == other.id &&
        type == other.type &&
        label == other.label &&
        description == other.description &&
        firstSeenMs == other.firstSeenMs &&
        evidenceShotIds == other.evidenceShotIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, firstSeenMs.hashCode);
    _$hash = $jc(_$hash, evidenceShotIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VisualAssetResponse')
          ..add('id', id)
          ..add('type', type)
          ..add('label', label)
          ..add('description', description)
          ..add('firstSeenMs', firstSeenMs)
          ..add('evidenceShotIds', evidenceShotIds))
        .toString();
  }
}

class VisualAssetResponseBuilder
    implements Builder<VisualAssetResponse, VisualAssetResponseBuilder> {
  _$VisualAssetResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _firstSeenMs;
  int? get firstSeenMs => _$this._firstSeenMs;
  set firstSeenMs(int? firstSeenMs) => _$this._firstSeenMs = firstSeenMs;

  ListBuilder<String>? _evidenceShotIds;
  ListBuilder<String> get evidenceShotIds =>
      _$this._evidenceShotIds ??= ListBuilder<String>();
  set evidenceShotIds(ListBuilder<String>? evidenceShotIds) =>
      _$this._evidenceShotIds = evidenceShotIds;

  VisualAssetResponseBuilder() {
    VisualAssetResponse._defaults(this);
  }

  VisualAssetResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _label = $v.label;
      _description = $v.description;
      _firstSeenMs = $v.firstSeenMs;
      _evidenceShotIds = $v.evidenceShotIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VisualAssetResponse other) {
    _$v = other as _$VisualAssetResponse;
  }

  @override
  void update(void Function(VisualAssetResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VisualAssetResponse build() => _build();

  _$VisualAssetResponse _build() {
    _$VisualAssetResponse _$result;
    try {
      _$result = _$v ??
          _$VisualAssetResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'VisualAssetResponse', 'id'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'VisualAssetResponse', 'type'),
            label: BuiltValueNullFieldError.checkNotNull(
                label, r'VisualAssetResponse', 'label'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'VisualAssetResponse', 'description'),
            firstSeenMs: BuiltValueNullFieldError.checkNotNull(
                firstSeenMs, r'VisualAssetResponse', 'firstSeenMs'),
            evidenceShotIds: evidenceShotIds.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'evidenceShotIds';
        evidenceShotIds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VisualAssetResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
