// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_response_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AnalysisResponseResultKindEnum
    _$analysisResponseResultKindEnum_screenplayRewrite =
    const AnalysisResponseResultKindEnum._('screenplayRewrite');
const AnalysisResponseResultKindEnum
    _$analysisResponseResultKindEnum_unknownDefaultOpenApi =
    const AnalysisResponseResultKindEnum._('unknownDefaultOpenApi');

AnalysisResponseResultKindEnum _$analysisResponseResultKindEnumValueOf(
    String name) {
  switch (name) {
    case 'screenplayRewrite':
      return _$analysisResponseResultKindEnum_screenplayRewrite;
    case 'unknownDefaultOpenApi':
      return _$analysisResponseResultKindEnum_unknownDefaultOpenApi;
    default:
      return _$analysisResponseResultKindEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<AnalysisResponseResultKindEnum>
    _$analysisResponseResultKindEnumValues = BuiltSet<
        AnalysisResponseResultKindEnum>(const <AnalysisResponseResultKindEnum>[
  _$analysisResponseResultKindEnum_screenplayRewrite,
  _$analysisResponseResultKindEnum_unknownDefaultOpenApi,
]);

Serializer<AnalysisResponseResultKindEnum>
    _$analysisResponseResultKindEnumSerializer =
    _$AnalysisResponseResultKindEnumSerializer();

class _$AnalysisResponseResultKindEnumSerializer
    implements PrimitiveSerializer<AnalysisResponseResultKindEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'screenplayRewrite': 'screenplay_rewrite',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'screenplay_rewrite': 'screenplayRewrite',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[AnalysisResponseResultKindEnum];
  @override
  final String wireName = 'AnalysisResponseResultKindEnum';

  @override
  Object serialize(
          Serializers serializers, AnalysisResponseResultKindEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AnalysisResponseResultKindEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AnalysisResponseResultKindEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AnalysisResponseResult extends AnalysisResponseResult {
  @override
  final OneOf oneOf;

  factory _$AnalysisResponseResult(
          [void Function(AnalysisResponseResultBuilder)? updates]) =>
      (AnalysisResponseResultBuilder()..update(updates))._build();

  _$AnalysisResponseResult._({required this.oneOf}) : super._();
  @override
  AnalysisResponseResult rebuild(
          void Function(AnalysisResponseResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalysisResponseResultBuilder toBuilder() =>
      AnalysisResponseResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalysisResponseResult && oneOf == other.oneOf;
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
    return (newBuiltValueToStringHelper(r'AnalysisResponseResult')
          ..add('oneOf', oneOf))
        .toString();
  }
}

class AnalysisResponseResultBuilder
    implements Builder<AnalysisResponseResult, AnalysisResponseResultBuilder> {
  _$AnalysisResponseResult? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  AnalysisResponseResultBuilder() {
    AnalysisResponseResult._defaults(this);
  }

  AnalysisResponseResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalysisResponseResult other) {
    _$v = other as _$AnalysisResponseResult;
  }

  @override
  void update(void Function(AnalysisResponseResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalysisResponseResult build() => _build();

  _$AnalysisResponseResult _build() {
    final _$result = _$v ??
        _$AnalysisResponseResult._(
          oneOf: BuiltValueNullFieldError.checkNotNull(
              oneOf, r'AnalysisResponseResult', 'oneOf'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
