// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'format_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FormatResponse extends FormatResponse {
  @override
  final String id;
  @override
  final String displayName;
  @override
  final SemanticPlanResponse plan;

  factory _$FormatResponse([void Function(FormatResponseBuilder)? updates]) =>
      (FormatResponseBuilder()..update(updates))._build();

  _$FormatResponse._(
      {required this.id, required this.displayName, required this.plan})
      : super._();
  @override
  FormatResponse rebuild(void Function(FormatResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FormatResponseBuilder toBuilder() => FormatResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FormatResponse &&
        id == other.id &&
        displayName == other.displayName &&
        plan == other.plan;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, plan.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FormatResponse')
          ..add('id', id)
          ..add('displayName', displayName)
          ..add('plan', plan))
        .toString();
  }
}

class FormatResponseBuilder
    implements Builder<FormatResponse, FormatResponseBuilder> {
  _$FormatResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  SemanticPlanResponseBuilder? _plan;
  SemanticPlanResponseBuilder get plan =>
      _$this._plan ??= SemanticPlanResponseBuilder();
  set plan(SemanticPlanResponseBuilder? plan) => _$this._plan = plan;

  FormatResponseBuilder() {
    FormatResponse._defaults(this);
  }

  FormatResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _displayName = $v.displayName;
      _plan = $v.plan.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FormatResponse other) {
    _$v = other as _$FormatResponse;
  }

  @override
  void update(void Function(FormatResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FormatResponse build() => _build();

  _$FormatResponse _build() {
    _$FormatResponse _$result;
    try {
      _$result = _$v ??
          _$FormatResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'FormatResponse', 'id'),
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName, r'FormatResponse', 'displayName'),
            plan: plan.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'plan';
        plan.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FormatResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
