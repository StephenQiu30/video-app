// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_source.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ModelSourceKindEnum _$modelSourceKindEnum_discoveredItem =
    const ModelSourceKindEnum._('discoveredItem');
const ModelSourceKindEnum _$modelSourceKindEnum_unknownDefaultOpenApi =
    const ModelSourceKindEnum._('unknownDefaultOpenApi');

ModelSourceKindEnum _$modelSourceKindEnumValueOf(String name) {
  switch (name) {
    case 'discoveredItem':
      return _$modelSourceKindEnum_discoveredItem;
    case 'unknownDefaultOpenApi':
      return _$modelSourceKindEnum_unknownDefaultOpenApi;
    default:
      return _$modelSourceKindEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ModelSourceKindEnum> _$modelSourceKindEnumValues =
    BuiltSet<ModelSourceKindEnum>(const <ModelSourceKindEnum>[
  _$modelSourceKindEnum_discoveredItem,
  _$modelSourceKindEnum_unknownDefaultOpenApi,
]);

Serializer<ModelSourceKindEnum> _$modelSourceKindEnumSerializer =
    _$ModelSourceKindEnumSerializer();

class _$ModelSourceKindEnumSerializer
    implements PrimitiveSerializer<ModelSourceKindEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'discoveredItem': 'discovered_item',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'discovered_item': 'discoveredItem',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ModelSourceKindEnum];
  @override
  final String wireName = 'ModelSourceKindEnum';

  @override
  Object serialize(Serializers serializers, ModelSourceKindEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ModelSourceKindEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ModelSourceKindEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ModelSource extends ModelSource {
  @override
  final OneOf oneOf;

  factory _$ModelSource([void Function(ModelSourceBuilder)? updates]) =>
      (ModelSourceBuilder()..update(updates))._build();

  _$ModelSource._({required this.oneOf}) : super._();
  @override
  ModelSource rebuild(void Function(ModelSourceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelSourceBuilder toBuilder() => ModelSourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelSource && oneOf == other.oneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelSource')..add('oneOf', oneOf))
        .toString();
  }
}

class ModelSourceBuilder implements Builder<ModelSource, ModelSourceBuilder> {
  _$ModelSource? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  ModelSourceBuilder() {
    ModelSource._defaults(this);
  }

  ModelSourceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelSource other) {
    _$v = other as _$ModelSource;
  }

  @override
  void update(void Function(ModelSourceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelSource build() => _build();

  _$ModelSource _build() {
    final _$result = _$v ??
        _$ModelSource._(
          oneOf: BuiltValueNullFieldError.checkNotNull(
              oneOf, r'ModelSource', 'oneOf'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
