// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InspectionRequest extends InspectionRequest {
  @override
  final ModelSource source_;

  factory _$InspectionRequest(
          [void Function(InspectionRequestBuilder)? updates]) =>
      (InspectionRequestBuilder()..update(updates))._build();

  _$InspectionRequest._({required this.source_}) : super._();
  @override
  InspectionRequest rebuild(void Function(InspectionRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InspectionRequestBuilder toBuilder() =>
      InspectionRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InspectionRequest && source_ == other.source_;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, source_.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InspectionRequest')
          ..add('source_', source_))
        .toString();
  }
}

class InspectionRequestBuilder
    implements Builder<InspectionRequest, InspectionRequestBuilder> {
  _$InspectionRequest? _$v;

  ModelSourceBuilder? _source_;
  ModelSourceBuilder get source_ => _$this._source_ ??= ModelSourceBuilder();
  set source_(ModelSourceBuilder? source_) => _$this._source_ = source_;

  InspectionRequestBuilder() {
    InspectionRequest._defaults(this);
  }

  InspectionRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _source_ = $v.source_.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InspectionRequest other) {
    _$v = other as _$InspectionRequest;
  }

  @override
  void update(void Function(InspectionRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InspectionRequest build() => _build();

  _$InspectionRequest _build() {
    _$InspectionRequest _$result;
    try {
      _$result = _$v ??
          _$InspectionRequest._(
            source_: source_.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'source_';
        source_.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'InspectionRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
