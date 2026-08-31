// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_document_import_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CompleteDocumentImportRequest extends CompleteDocumentImportRequest {
  @override
  final BuiltList<CompletedPartRequest> parts;

  factory _$CompleteDocumentImportRequest(
          [void Function(CompleteDocumentImportRequestBuilder)? updates]) =>
      (CompleteDocumentImportRequestBuilder()..update(updates))._build();

  _$CompleteDocumentImportRequest._({required this.parts}) : super._();
  @override
  CompleteDocumentImportRequest rebuild(
          void Function(CompleteDocumentImportRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompleteDocumentImportRequestBuilder toBuilder() =>
      CompleteDocumentImportRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompleteDocumentImportRequest && parts == other.parts;
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
    return (newBuiltValueToStringHelper(r'CompleteDocumentImportRequest')
          ..add('parts', parts))
        .toString();
  }
}

class CompleteDocumentImportRequestBuilder
    implements
        Builder<CompleteDocumentImportRequest,
            CompleteDocumentImportRequestBuilder> {
  _$CompleteDocumentImportRequest? _$v;

  ListBuilder<CompletedPartRequest>? _parts;
  ListBuilder<CompletedPartRequest> get parts =>
      _$this._parts ??= ListBuilder<CompletedPartRequest>();
  set parts(ListBuilder<CompletedPartRequest>? parts) => _$this._parts = parts;

  CompleteDocumentImportRequestBuilder() {
    CompleteDocumentImportRequest._defaults(this);
  }

  CompleteDocumentImportRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _parts = $v.parts.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompleteDocumentImportRequest other) {
    _$v = other as _$CompleteDocumentImportRequest;
  }

  @override
  void update(void Function(CompleteDocumentImportRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompleteDocumentImportRequest build() => _build();

  _$CompleteDocumentImportRequest _build() {
    _$CompleteDocumentImportRequest _$result;
    try {
      _$result = _$v ??
          _$CompleteDocumentImportRequest._(
            parts: parts.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'parts';
        parts.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CompleteDocumentImportRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
