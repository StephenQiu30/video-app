// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenplay_structure_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ScreenplayStructureResponse extends ScreenplayStructureResponse {
  @override
  final BuiltList<ScreenplayEvidenceItemResponse> acts;
  @override
  final BuiltList<ScreenplayEvidenceItemResponse> turningPoints;
  @override
  final String pacingSummary;

  factory _$ScreenplayStructureResponse(
          [void Function(ScreenplayStructureResponseBuilder)? updates]) =>
      (ScreenplayStructureResponseBuilder()..update(updates))._build();

  _$ScreenplayStructureResponse._(
      {required this.acts,
      required this.turningPoints,
      required this.pacingSummary})
      : super._();
  @override
  ScreenplayStructureResponse rebuild(
          void Function(ScreenplayStructureResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScreenplayStructureResponseBuilder toBuilder() =>
      ScreenplayStructureResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScreenplayStructureResponse &&
        acts == other.acts &&
        turningPoints == other.turningPoints &&
        pacingSummary == other.pacingSummary;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, acts.hashCode);
    _$hash = $jc(_$hash, turningPoints.hashCode);
    _$hash = $jc(_$hash, pacingSummary.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScreenplayStructureResponse')
          ..add('acts', acts)
          ..add('turningPoints', turningPoints)
          ..add('pacingSummary', pacingSummary))
        .toString();
  }
}

class ScreenplayStructureResponseBuilder
    implements
        Builder<ScreenplayStructureResponse,
            ScreenplayStructureResponseBuilder> {
  _$ScreenplayStructureResponse? _$v;

  ListBuilder<ScreenplayEvidenceItemResponse>? _acts;
  ListBuilder<ScreenplayEvidenceItemResponse> get acts =>
      _$this._acts ??= ListBuilder<ScreenplayEvidenceItemResponse>();
  set acts(ListBuilder<ScreenplayEvidenceItemResponse>? acts) =>
      _$this._acts = acts;

  ListBuilder<ScreenplayEvidenceItemResponse>? _turningPoints;
  ListBuilder<ScreenplayEvidenceItemResponse> get turningPoints =>
      _$this._turningPoints ??= ListBuilder<ScreenplayEvidenceItemResponse>();
  set turningPoints(
          ListBuilder<ScreenplayEvidenceItemResponse>? turningPoints) =>
      _$this._turningPoints = turningPoints;

  String? _pacingSummary;
  String? get pacingSummary => _$this._pacingSummary;
  set pacingSummary(String? pacingSummary) =>
      _$this._pacingSummary = pacingSummary;

  ScreenplayStructureResponseBuilder() {
    ScreenplayStructureResponse._defaults(this);
  }

  ScreenplayStructureResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _acts = $v.acts.toBuilder();
      _turningPoints = $v.turningPoints.toBuilder();
      _pacingSummary = $v.pacingSummary;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScreenplayStructureResponse other) {
    _$v = other as _$ScreenplayStructureResponse;
  }

  @override
  void update(void Function(ScreenplayStructureResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScreenplayStructureResponse build() => _build();

  _$ScreenplayStructureResponse _build() {
    _$ScreenplayStructureResponse _$result;
    try {
      _$result = _$v ??
          _$ScreenplayStructureResponse._(
            acts: acts.build(),
            turningPoints: turningPoints.build(),
            pacingSummary: BuiltValueNullFieldError.checkNotNull(
                pacingSummary, r'ScreenplayStructureResponse', 'pacingSummary'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'acts';
        acts.build();
        _$failedField = 'turningPoints';
        turningPoints.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ScreenplayStructureResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
