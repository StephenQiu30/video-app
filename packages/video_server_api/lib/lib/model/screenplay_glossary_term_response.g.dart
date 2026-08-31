// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenplay_glossary_term_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ScreenplayGlossaryTermResponse extends ScreenplayGlossaryTermResponse {
  @override
  final String source_;
  @override
  final String target;
  @override
  final String category;

  factory _$ScreenplayGlossaryTermResponse(
          [void Function(ScreenplayGlossaryTermResponseBuilder)? updates]) =>
      (ScreenplayGlossaryTermResponseBuilder()..update(updates))._build();

  _$ScreenplayGlossaryTermResponse._(
      {required this.source_, required this.target, required this.category})
      : super._();
  @override
  ScreenplayGlossaryTermResponse rebuild(
          void Function(ScreenplayGlossaryTermResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScreenplayGlossaryTermResponseBuilder toBuilder() =>
      ScreenplayGlossaryTermResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScreenplayGlossaryTermResponse &&
        source_ == other.source_ &&
        target == other.target &&
        category == other.category;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, source_.hashCode);
    _$hash = $jc(_$hash, target.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScreenplayGlossaryTermResponse')
          ..add('source_', source_)
          ..add('target', target)
          ..add('category', category))
        .toString();
  }
}

class ScreenplayGlossaryTermResponseBuilder
    implements
        Builder<ScreenplayGlossaryTermResponse,
            ScreenplayGlossaryTermResponseBuilder> {
  _$ScreenplayGlossaryTermResponse? _$v;

  String? _source_;
  String? get source_ => _$this._source_;
  set source_(String? source_) => _$this._source_ = source_;

  String? _target;
  String? get target => _$this._target;
  set target(String? target) => _$this._target = target;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  ScreenplayGlossaryTermResponseBuilder() {
    ScreenplayGlossaryTermResponse._defaults(this);
  }

  ScreenplayGlossaryTermResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _source_ = $v.source_;
      _target = $v.target;
      _category = $v.category;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScreenplayGlossaryTermResponse other) {
    _$v = other as _$ScreenplayGlossaryTermResponse;
  }

  @override
  void update(void Function(ScreenplayGlossaryTermResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScreenplayGlossaryTermResponse build() => _build();

  _$ScreenplayGlossaryTermResponse _build() {
    final _$result = _$v ??
        _$ScreenplayGlossaryTermResponse._(
          source_: BuiltValueNullFieldError.checkNotNull(
              source_, r'ScreenplayGlossaryTermResponse', 'source_'),
          target: BuiltValueNullFieldError.checkNotNull(
              target, r'ScreenplayGlossaryTermResponse', 'target'),
          category: BuiltValueNullFieldError.checkNotNull(
              category, r'ScreenplayGlossaryTermResponse', 'category'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
