// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_advice_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProductionAdviceResponse extends ProductionAdviceResponse {
  @override
  final String summary;
  @override
  final BuiltList<String> priorityShotIds;
  @override
  final BuiltList<String> recommendedExtensions;

  factory _$ProductionAdviceResponse(
          [void Function(ProductionAdviceResponseBuilder)? updates]) =>
      (ProductionAdviceResponseBuilder()..update(updates))._build();

  _$ProductionAdviceResponse._(
      {required this.summary,
      required this.priorityShotIds,
      required this.recommendedExtensions})
      : super._();
  @override
  ProductionAdviceResponse rebuild(
          void Function(ProductionAdviceResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductionAdviceResponseBuilder toBuilder() =>
      ProductionAdviceResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductionAdviceResponse &&
        summary == other.summary &&
        priorityShotIds == other.priorityShotIds &&
        recommendedExtensions == other.recommendedExtensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, priorityShotIds.hashCode);
    _$hash = $jc(_$hash, recommendedExtensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductionAdviceResponse')
          ..add('summary', summary)
          ..add('priorityShotIds', priorityShotIds)
          ..add('recommendedExtensions', recommendedExtensions))
        .toString();
  }
}

class ProductionAdviceResponseBuilder
    implements
        Builder<ProductionAdviceResponse, ProductionAdviceResponseBuilder> {
  _$ProductionAdviceResponse? _$v;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  ListBuilder<String>? _priorityShotIds;
  ListBuilder<String> get priorityShotIds =>
      _$this._priorityShotIds ??= ListBuilder<String>();
  set priorityShotIds(ListBuilder<String>? priorityShotIds) =>
      _$this._priorityShotIds = priorityShotIds;

  ListBuilder<String>? _recommendedExtensions;
  ListBuilder<String> get recommendedExtensions =>
      _$this._recommendedExtensions ??= ListBuilder<String>();
  set recommendedExtensions(ListBuilder<String>? recommendedExtensions) =>
      _$this._recommendedExtensions = recommendedExtensions;

  ProductionAdviceResponseBuilder() {
    ProductionAdviceResponse._defaults(this);
  }

  ProductionAdviceResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _summary = $v.summary;
      _priorityShotIds = $v.priorityShotIds.toBuilder();
      _recommendedExtensions = $v.recommendedExtensions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductionAdviceResponse other) {
    _$v = other as _$ProductionAdviceResponse;
  }

  @override
  void update(void Function(ProductionAdviceResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductionAdviceResponse build() => _build();

  _$ProductionAdviceResponse _build() {
    _$ProductionAdviceResponse _$result;
    try {
      _$result = _$v ??
          _$ProductionAdviceResponse._(
            summary: BuiltValueNullFieldError.checkNotNull(
                summary, r'ProductionAdviceResponse', 'summary'),
            priorityShotIds: priorityShotIds.build(),
            recommendedExtensions: recommendedExtensions.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'priorityShotIds';
        priorityShotIds.build();
        _$failedField = 'recommendedExtensions';
        recommendedExtensions.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ProductionAdviceResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
