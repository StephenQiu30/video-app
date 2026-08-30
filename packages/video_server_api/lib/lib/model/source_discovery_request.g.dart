// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_discovery_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SourceDiscoveryRequestKindEnum
    _$sourceDiscoveryRequestKindEnum_wechatOfficialAccountArticle =
    const SourceDiscoveryRequestKindEnum._('wechatOfficialAccountArticle');
const SourceDiscoveryRequestKindEnum
    _$sourceDiscoveryRequestKindEnum_unknownDefaultOpenApi =
    const SourceDiscoveryRequestKindEnum._('unknownDefaultOpenApi');

SourceDiscoveryRequestKindEnum _$sourceDiscoveryRequestKindEnumValueOf(
    String name) {
  switch (name) {
    case 'wechatOfficialAccountArticle':
      return _$sourceDiscoveryRequestKindEnum_wechatOfficialAccountArticle;
    case 'unknownDefaultOpenApi':
      return _$sourceDiscoveryRequestKindEnum_unknownDefaultOpenApi;
    default:
      return _$sourceDiscoveryRequestKindEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<SourceDiscoveryRequestKindEnum>
    _$sourceDiscoveryRequestKindEnumValues = BuiltSet<
        SourceDiscoveryRequestKindEnum>(const <SourceDiscoveryRequestKindEnum>[
  _$sourceDiscoveryRequestKindEnum_wechatOfficialAccountArticle,
  _$sourceDiscoveryRequestKindEnum_unknownDefaultOpenApi,
]);

Serializer<SourceDiscoveryRequestKindEnum>
    _$sourceDiscoveryRequestKindEnumSerializer =
    _$SourceDiscoveryRequestKindEnumSerializer();

class _$SourceDiscoveryRequestKindEnumSerializer
    implements PrimitiveSerializer<SourceDiscoveryRequestKindEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'wechatOfficialAccountArticle': 'wechat_official_account_article',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'wechat_official_account_article': 'wechatOfficialAccountArticle',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[SourceDiscoveryRequestKindEnum];
  @override
  final String wireName = 'SourceDiscoveryRequestKindEnum';

  @override
  Object serialize(
          Serializers serializers, SourceDiscoveryRequestKindEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SourceDiscoveryRequestKindEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SourceDiscoveryRequestKindEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$SourceDiscoveryRequest extends SourceDiscoveryRequest {
  @override
  final SourceDiscoveryRequestKindEnum kind;
  @override
  final String url;

  factory _$SourceDiscoveryRequest(
          [void Function(SourceDiscoveryRequestBuilder)? updates]) =>
      (SourceDiscoveryRequestBuilder()..update(updates))._build();

  _$SourceDiscoveryRequest._({required this.kind, required this.url})
      : super._();
  @override
  SourceDiscoveryRequest rebuild(
          void Function(SourceDiscoveryRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SourceDiscoveryRequestBuilder toBuilder() =>
      SourceDiscoveryRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SourceDiscoveryRequest &&
        kind == other.kind &&
        url == other.url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SourceDiscoveryRequest')
          ..add('kind', kind)
          ..add('url', url))
        .toString();
  }
}

class SourceDiscoveryRequestBuilder
    implements Builder<SourceDiscoveryRequest, SourceDiscoveryRequestBuilder> {
  _$SourceDiscoveryRequest? _$v;

  SourceDiscoveryRequestKindEnum? _kind;
  SourceDiscoveryRequestKindEnum? get kind => _$this._kind;
  set kind(SourceDiscoveryRequestKindEnum? kind) => _$this._kind = kind;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  SourceDiscoveryRequestBuilder() {
    SourceDiscoveryRequest._defaults(this);
  }

  SourceDiscoveryRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kind = $v.kind;
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SourceDiscoveryRequest other) {
    _$v = other as _$SourceDiscoveryRequest;
  }

  @override
  void update(void Function(SourceDiscoveryRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SourceDiscoveryRequest build() => _build();

  _$SourceDiscoveryRequest _build() {
    final _$result = _$v ??
        _$SourceDiscoveryRequest._(
          kind: BuiltValueNullFieldError.checkNotNull(
              kind, r'SourceDiscoveryRequest', 'kind'),
          url: BuiltValueNullFieldError.checkNotNull(
              url, r'SourceDiscoveryRequest', 'url'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
