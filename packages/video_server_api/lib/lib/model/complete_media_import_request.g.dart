// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_media_import_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CompleteMediaImportRequest extends CompleteMediaImportRequest {
  @override
  final BuiltList<CompletedPartRequest> parts;

  factory _$CompleteMediaImportRequest(
          [void Function(CompleteMediaImportRequestBuilder)? updates]) =>
      (CompleteMediaImportRequestBuilder()..update(updates))._build();

  _$CompleteMediaImportRequest._({required this.parts}) : super._();
  @override
  CompleteMediaImportRequest rebuild(
          void Function(CompleteMediaImportRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompleteMediaImportRequestBuilder toBuilder() =>
      CompleteMediaImportRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompleteMediaImportRequest && parts == other.parts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, parts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompleteMediaImportRequest')
          ..add('parts', parts))
        .toString();
  }
}

class CompleteMediaImportRequestBuilder
    implements
        Builder<CompleteMediaImportRequest, CompleteMediaImportRequestBuilder> {
  _$CompleteMediaImportRequest? _$v;

  ListBuilder<CompletedPartRequest>? _parts;
  ListBuilder<CompletedPartRequest> get parts =>
      _$this._parts ??= ListBuilder<CompletedPartRequest>();
  set parts(ListBuilder<CompletedPartRequest>? parts) => _$this._parts = parts;

  CompleteMediaImportRequestBuilder() {
    CompleteMediaImportRequest._defaults(this);
  }

  CompleteMediaImportRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _parts = $v.parts.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompleteMediaImportRequest other) {
    _$v = other as _$CompleteMediaImportRequest;
  }

  @override
  void update(void Function(CompleteMediaImportRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompleteMediaImportRequest build() => _build();

  _$CompleteMediaImportRequest _build() {
    _$CompleteMediaImportRequest _$result;
    try {
      _$result = _$v ??
          _$CompleteMediaImportRequest._(
            parts: parts.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'parts';
        parts.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CompleteMediaImportRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
