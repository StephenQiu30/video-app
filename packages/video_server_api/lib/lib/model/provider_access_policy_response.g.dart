// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_access_policy_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProviderAccessPolicyResponse extends ProviderAccessPolicyResponse {
  @override
  final ProviderAccessPolicy id;
  @override
  final bool configured;

  factory _$ProviderAccessPolicyResponse(
          [void Function(ProviderAccessPolicyResponseBuilder)? updates]) =>
      (ProviderAccessPolicyResponseBuilder()..update(updates))._build();

  _$ProviderAccessPolicyResponse._({required this.id, required this.configured})
      : super._();
  @override
  ProviderAccessPolicyResponse rebuild(
          void Function(ProviderAccessPolicyResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProviderAccessPolicyResponseBuilder toBuilder() =>
      ProviderAccessPolicyResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProviderAccessPolicyResponse &&
        id == other.id &&
        configured == other.configured;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, configured.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProviderAccessPolicyResponse')
          ..add('id', id)
          ..add('configured', configured))
        .toString();
  }
}

class ProviderAccessPolicyResponseBuilder
    implements
        Builder<ProviderAccessPolicyResponse,
            ProviderAccessPolicyResponseBuilder> {
  _$ProviderAccessPolicyResponse? _$v;

  ProviderAccessPolicy? _id;
  ProviderAccessPolicy? get id => _$this._id;
  set id(ProviderAccessPolicy? id) => _$this._id = id;

  bool? _configured;
  bool? get configured => _$this._configured;
  set configured(bool? configured) => _$this._configured = configured;

  ProviderAccessPolicyResponseBuilder() {
    ProviderAccessPolicyResponse._defaults(this);
  }

  ProviderAccessPolicyResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _configured = $v.configured;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProviderAccessPolicyResponse other) {
    _$v = other as _$ProviderAccessPolicyResponse;
  }

  @override
  void update(void Function(ProviderAccessPolicyResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProviderAccessPolicyResponse build() => _build();

  _$ProviderAccessPolicyResponse _build() {
    final _$result = _$v ??
        _$ProviderAccessPolicyResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ProviderAccessPolicyResponse', 'id'),
          configured: BuiltValueNullFieldError.checkNotNull(
              configured, r'ProviderAccessPolicyResponse', 'configured'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
