// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_provider_profile_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiProviderProfileListResponse extends AiProviderProfileListResponse {
  @override
  final BuiltList<AiProviderProfileResponse> items;
  @override
  final bool agentAvailable;

  factory _$AiProviderProfileListResponse(
          [void Function(AiProviderProfileListResponseBuilder)? updates]) =>
      (AiProviderProfileListResponseBuilder()..update(updates))._build();

  _$AiProviderProfileListResponse._(
      {required this.items, required this.agentAvailable})
      : super._();
  @override
  AiProviderProfileListResponse rebuild(
          void Function(AiProviderProfileListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiProviderProfileListResponseBuilder toBuilder() =>
      AiProviderProfileListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiProviderProfileListResponse &&
        items == other.items &&
        agentAvailable == other.agentAvailable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, agentAvailable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiProviderProfileListResponse')
          ..add('items', items)
          ..add('agentAvailable', agentAvailable))
        .toString();
  }
}

class AiProviderProfileListResponseBuilder
    implements
        Builder<AiProviderProfileListResponse,
            AiProviderProfileListResponseBuilder> {
  _$AiProviderProfileListResponse? _$v;

  ListBuilder<AiProviderProfileResponse>? _items;
  ListBuilder<AiProviderProfileResponse> get items =>
      _$this._items ??= ListBuilder<AiProviderProfileResponse>();
  set items(ListBuilder<AiProviderProfileResponse>? items) =>
      _$this._items = items;

  bool? _agentAvailable;
  bool? get agentAvailable => _$this._agentAvailable;
  set agentAvailable(bool? agentAvailable) =>
      _$this._agentAvailable = agentAvailable;

  AiProviderProfileListResponseBuilder() {
    AiProviderProfileListResponse._defaults(this);
  }

  AiProviderProfileListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _agentAvailable = $v.agentAvailable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiProviderProfileListResponse other) {
    _$v = other as _$AiProviderProfileListResponse;
  }

  @override
  void update(void Function(AiProviderProfileListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiProviderProfileListResponse build() => _build();

  _$AiProviderProfileListResponse _build() {
    _$AiProviderProfileListResponse _$result;
    try {
      _$result = _$v ??
          _$AiProviderProfileListResponse._(
            items: items.build(),
            agentAvailable: BuiltValueNullFieldError.checkNotNull(
                agentAvailable,
                r'AiProviderProfileListResponse',
                'agentAvailable'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiProviderProfileListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
