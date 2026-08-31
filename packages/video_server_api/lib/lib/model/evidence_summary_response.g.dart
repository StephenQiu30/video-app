// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evidence_summary_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EvidenceSummaryResponse extends EvidenceSummaryResponse {
  @override
  final String text;
  @override
  final BuiltList<String> evidenceShotIds;

  factory _$EvidenceSummaryResponse(
          [void Function(EvidenceSummaryResponseBuilder)? updates]) =>
      (EvidenceSummaryResponseBuilder()..update(updates))._build();

  _$EvidenceSummaryResponse._(
      {required this.text, required this.evidenceShotIds})
      : super._();
  @override
  EvidenceSummaryResponse rebuild(
          void Function(EvidenceSummaryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EvidenceSummaryResponseBuilder toBuilder() =>
      EvidenceSummaryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EvidenceSummaryResponse &&
        text == other.text &&
        evidenceShotIds == other.evidenceShotIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, evidenceShotIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EvidenceSummaryResponse')
          ..add('text', text)
          ..add('evidenceShotIds', evidenceShotIds))
        .toString();
  }
}

class EvidenceSummaryResponseBuilder
    implements
        Builder<EvidenceSummaryResponse, EvidenceSummaryResponseBuilder> {
  _$EvidenceSummaryResponse? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  ListBuilder<String>? _evidenceShotIds;
  ListBuilder<String> get evidenceShotIds =>
      _$this._evidenceShotIds ??= ListBuilder<String>();
  set evidenceShotIds(ListBuilder<String>? evidenceShotIds) =>
      _$this._evidenceShotIds = evidenceShotIds;

  EvidenceSummaryResponseBuilder() {
    EvidenceSummaryResponse._defaults(this);
  }

  EvidenceSummaryResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _evidenceShotIds = $v.evidenceShotIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EvidenceSummaryResponse other) {
    _$v = other as _$EvidenceSummaryResponse;
  }

  @override
  void update(void Function(EvidenceSummaryResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EvidenceSummaryResponse build() => _build();

  _$EvidenceSummaryResponse _build() {
    _$EvidenceSummaryResponse _$result;
    try {
      _$result = _$v ??
          _$EvidenceSummaryResponse._(
            text: BuiltValueNullFieldError.checkNotNull(
                text, r'EvidenceSummaryResponse', 'text'),
            evidenceShotIds: evidenceShotIds.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'evidenceShotIds';
        evidenceShotIds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'EvidenceSummaryResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
