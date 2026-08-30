// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovered_item_inspection_source.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DiscoveredItemInspectionSourceKindEnum
    _$discoveredItemInspectionSourceKindEnum_discoveredItem =
    const DiscoveredItemInspectionSourceKindEnum._('discoveredItem');
const DiscoveredItemInspectionSourceKindEnum
    _$discoveredItemInspectionSourceKindEnum_unknownDefaultOpenApi =
    const DiscoveredItemInspectionSourceKindEnum._('unknownDefaultOpenApi');

DiscoveredItemInspectionSourceKindEnum
    _$discoveredItemInspectionSourceKindEnumValueOf(String name) {
  switch (name) {
    case 'discoveredItem':
      return _$discoveredItemInspectionSourceKindEnum_discoveredItem;
    case 'unknownDefaultOpenApi':
      return _$discoveredItemInspectionSourceKindEnum_unknownDefaultOpenApi;
    default:
      return _$discoveredItemInspectionSourceKindEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<DiscoveredItemInspectionSourceKindEnum>
    _$discoveredItemInspectionSourceKindEnumValues = BuiltSet<
        DiscoveredItemInspectionSourceKindEnum>(const <DiscoveredItemInspectionSourceKindEnum>[
  _$discoveredItemInspectionSourceKindEnum_discoveredItem,
  _$discoveredItemInspectionSourceKindEnum_unknownDefaultOpenApi,
]);

Serializer<DiscoveredItemInspectionSourceKindEnum>
    _$discoveredItemInspectionSourceKindEnumSerializer =
    _$DiscoveredItemInspectionSourceKindEnumSerializer();

class _$DiscoveredItemInspectionSourceKindEnumSerializer
    implements PrimitiveSerializer<DiscoveredItemInspectionSourceKindEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'discoveredItem': 'discovered_item',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'discovered_item': 'discoveredItem',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    DiscoveredItemInspectionSourceKindEnum
  ];
  @override
  final String wireName = 'DiscoveredItemInspectionSourceKindEnum';

  @override
  Object serialize(Serializers serializers,
          DiscoveredItemInspectionSourceKindEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DiscoveredItemInspectionSourceKindEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DiscoveredItemInspectionSourceKindEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$DiscoveredItemInspectionSource extends DiscoveredItemInspectionSource {
  @override
  final DiscoveredItemInspectionSourceKindEnum kind;
  @override
  final String discoveryId;
  @override
  final String itemRef;

  factory _$DiscoveredItemInspectionSource(
          [void Function(DiscoveredItemInspectionSourceBuilder)? updates]) =>
      (DiscoveredItemInspectionSourceBuilder()..update(updates))._build();

  _$DiscoveredItemInspectionSource._(
      {required this.kind, required this.discoveryId, required this.itemRef})
      : super._();
  @override
  DiscoveredItemInspectionSource rebuild(
          void Function(DiscoveredItemInspectionSourceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiscoveredItemInspectionSourceBuilder toBuilder() =>
      DiscoveredItemInspectionSourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiscoveredItemInspectionSource &&
        kind == other.kind &&
        discoveryId == other.discoveryId &&
        itemRef == other.itemRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jc(_$hash, discoveryId.hashCode);
    _$hash = $jc(_$hash, itemRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DiscoveredItemInspectionSource')
          ..add('kind', kind)
          ..add('discoveryId', discoveryId)
          ..add('itemRef', itemRef))
        .toString();
  }
}

class DiscoveredItemInspectionSourceBuilder
    implements
        Builder<DiscoveredItemInspectionSource,
            DiscoveredItemInspectionSourceBuilder> {
  _$DiscoveredItemInspectionSource? _$v;

  DiscoveredItemInspectionSourceKindEnum? _kind;
  DiscoveredItemInspectionSourceKindEnum? get kind => _$this._kind;
  set kind(DiscoveredItemInspectionSourceKindEnum? kind) => _$this._kind = kind;

  String? _discoveryId;
  String? get discoveryId => _$this._discoveryId;
  set discoveryId(String? discoveryId) => _$this._discoveryId = discoveryId;

  String? _itemRef;
  String? get itemRef => _$this._itemRef;
  set itemRef(String? itemRef) => _$this._itemRef = itemRef;

  DiscoveredItemInspectionSourceBuilder() {
    DiscoveredItemInspectionSource._defaults(this);
  }

  DiscoveredItemInspectionSourceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kind = $v.kind;
      _discoveryId = $v.discoveryId;
      _itemRef = $v.itemRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiscoveredItemInspectionSource other) {
    _$v = other as _$DiscoveredItemInspectionSource;
  }

  @override
  void update(void Function(DiscoveredItemInspectionSourceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DiscoveredItemInspectionSource build() => _build();

  _$DiscoveredItemInspectionSource _build() {
    final _$result = _$v ??
        _$DiscoveredItemInspectionSource._(
          kind: BuiltValueNullFieldError.checkNotNull(
              kind, r'DiscoveredItemInspectionSource', 'kind'),
          discoveryId: BuiltValueNullFieldError.checkNotNull(
              discoveryId, r'DiscoveredItemInspectionSource', 'discoveryId'),
          itemRef: BuiltValueNullFieldError.checkNotNull(
              itemRef, r'DiscoveredItemInspectionSource', 'itemRef'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
