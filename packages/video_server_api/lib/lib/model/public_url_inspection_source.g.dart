// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_url_inspection_source.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PublicUrlInspectionSourceKindEnum
    _$publicUrlInspectionSourceKindEnum_publicUrl =
    const PublicUrlInspectionSourceKindEnum._('publicUrl');
const PublicUrlInspectionSourceKindEnum
    _$publicUrlInspectionSourceKindEnum_unknownDefaultOpenApi =
    const PublicUrlInspectionSourceKindEnum._('unknownDefaultOpenApi');

PublicUrlInspectionSourceKindEnum _$publicUrlInspectionSourceKindEnumValueOf(
    String name) {
  switch (name) {
    case 'publicUrl':
      return _$publicUrlInspectionSourceKindEnum_publicUrl;
    case 'unknownDefaultOpenApi':
      return _$publicUrlInspectionSourceKindEnum_unknownDefaultOpenApi;
    default:
      return _$publicUrlInspectionSourceKindEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<PublicUrlInspectionSourceKindEnum>
    _$publicUrlInspectionSourceKindEnumValues = BuiltSet<
        PublicUrlInspectionSourceKindEnum>(const <PublicUrlInspectionSourceKindEnum>[
  _$publicUrlInspectionSourceKindEnum_publicUrl,
  _$publicUrlInspectionSourceKindEnum_unknownDefaultOpenApi,
]);

Serializer<PublicUrlInspectionSourceKindEnum>
    _$publicUrlInspectionSourceKindEnumSerializer =
    _$PublicUrlInspectionSourceKindEnumSerializer();

class _$PublicUrlInspectionSourceKindEnumSerializer
    implements PrimitiveSerializer<PublicUrlInspectionSourceKindEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'publicUrl': 'public_url',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'public_url': 'publicUrl',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[PublicUrlInspectionSourceKindEnum];
  @override
  final String wireName = 'PublicUrlInspectionSourceKindEnum';

  @override
  Object serialize(
          Serializers serializers, PublicUrlInspectionSourceKindEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PublicUrlInspectionSourceKindEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PublicUrlInspectionSourceKindEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$PublicUrlInspectionSource extends PublicUrlInspectionSource {
  @override
  final PublicUrlInspectionSourceKindEnum kind;
  @override
  final String url;

  factory _$PublicUrlInspectionSource(
          [void Function(PublicUrlInspectionSourceBuilder)? updates]) =>
      (PublicUrlInspectionSourceBuilder()..update(updates))._build();

  _$PublicUrlInspectionSource._({required this.kind, required this.url})
      : super._();
  @override
  PublicUrlInspectionSource rebuild(
          void Function(PublicUrlInspectionSourceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicUrlInspectionSourceBuilder toBuilder() =>
      PublicUrlInspectionSourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicUrlInspectionSource &&
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
    return (newBuiltValueToStringHelper(r'PublicUrlInspectionSource')
          ..add('kind', kind)
          ..add('url', url))
        .toString();
  }
}

class PublicUrlInspectionSourceBuilder
    implements
        Builder<PublicUrlInspectionSource, PublicUrlInspectionSourceBuilder> {
  _$PublicUrlInspectionSource? _$v;

  PublicUrlInspectionSourceKindEnum? _kind;
  PublicUrlInspectionSourceKindEnum? get kind => _$this._kind;
  set kind(PublicUrlInspectionSourceKindEnum? kind) => _$this._kind = kind;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  PublicUrlInspectionSourceBuilder() {
    PublicUrlInspectionSource._defaults(this);
  }

  PublicUrlInspectionSourceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kind = $v.kind;
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PublicUrlInspectionSource other) {
    _$v = other as _$PublicUrlInspectionSource;
  }

  @override
  void update(void Function(PublicUrlInspectionSourceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicUrlInspectionSource build() => _build();

  _$PublicUrlInspectionSource _build() {
    final _$result = _$v ??
        _$PublicUrlInspectionSource._(
          kind: BuiltValueNullFieldError.checkNotNull(
              kind, r'PublicUrlInspectionSource', 'kind'),
          url: BuiltValueNullFieldError.checkNotNull(
              url, r'PublicUrlInspectionSource', 'url'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
