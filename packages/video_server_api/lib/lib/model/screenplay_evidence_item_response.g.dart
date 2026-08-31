// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenplay_evidence_item_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ScreenplayEvidenceItemResponse extends ScreenplayEvidenceItemResponse {
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final BuiltList<String> evidenceSceneIds;

  factory _$ScreenplayEvidenceItemResponse(
          [void Function(ScreenplayEvidenceItemResponseBuilder)? updates]) =>
      (ScreenplayEvidenceItemResponseBuilder()..update(updates))._build();

  _$ScreenplayEvidenceItemResponse._(
      {required this.id,
      required this.title,
      required this.description,
      required this.evidenceSceneIds})
      : super._();
  @override
  ScreenplayEvidenceItemResponse rebuild(
          void Function(ScreenplayEvidenceItemResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScreenplayEvidenceItemResponseBuilder toBuilder() =>
      ScreenplayEvidenceItemResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScreenplayEvidenceItemResponse &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        evidenceSceneIds == other.evidenceSceneIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, evidenceSceneIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScreenplayEvidenceItemResponse')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('evidenceSceneIds', evidenceSceneIds))
        .toString();
  }
}

class ScreenplayEvidenceItemResponseBuilder
    implements
        Builder<ScreenplayEvidenceItemResponse,
            ScreenplayEvidenceItemResponseBuilder> {
  _$ScreenplayEvidenceItemResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<String>? _evidenceSceneIds;
  ListBuilder<String> get evidenceSceneIds =>
      _$this._evidenceSceneIds ??= ListBuilder<String>();
  set evidenceSceneIds(ListBuilder<String>? evidenceSceneIds) =>
      _$this._evidenceSceneIds = evidenceSceneIds;

  ScreenplayEvidenceItemResponseBuilder() {
    ScreenplayEvidenceItemResponse._defaults(this);
  }

  ScreenplayEvidenceItemResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _evidenceSceneIds = $v.evidenceSceneIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScreenplayEvidenceItemResponse other) {
    _$v = other as _$ScreenplayEvidenceItemResponse;
  }

  @override
  void update(void Function(ScreenplayEvidenceItemResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScreenplayEvidenceItemResponse build() => _build();

  _$ScreenplayEvidenceItemResponse _build() {
    _$ScreenplayEvidenceItemResponse _$result;
    try {
      _$result = _$v ??
          _$ScreenplayEvidenceItemResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ScreenplayEvidenceItemResponse', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'ScreenplayEvidenceItemResponse', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'ScreenplayEvidenceItemResponse', 'description'),
            evidenceSceneIds: evidenceSceneIds.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'evidenceSceneIds';
        evidenceSceneIds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ScreenplayEvidenceItemResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
