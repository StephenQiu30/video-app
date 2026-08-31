// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenplay_rewrite_result_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ScreenplayRewriteResultResponseKindEnum
    _$screenplayRewriteResultResponseKindEnum_screenplayRewrite =
    const ScreenplayRewriteResultResponseKindEnum._('screenplayRewrite');
const ScreenplayRewriteResultResponseKindEnum
    _$screenplayRewriteResultResponseKindEnum_unknownDefaultOpenApi =
    const ScreenplayRewriteResultResponseKindEnum._('unknownDefaultOpenApi');

ScreenplayRewriteResultResponseKindEnum
    _$screenplayRewriteResultResponseKindEnumValueOf(String name) {
  switch (name) {
    case 'screenplayRewrite':
      return _$screenplayRewriteResultResponseKindEnum_screenplayRewrite;
    case 'unknownDefaultOpenApi':
      return _$screenplayRewriteResultResponseKindEnum_unknownDefaultOpenApi;
    default:
      return _$screenplayRewriteResultResponseKindEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ScreenplayRewriteResultResponseKindEnum>
    _$screenplayRewriteResultResponseKindEnumValues = BuiltSet<
        ScreenplayRewriteResultResponseKindEnum>(const <ScreenplayRewriteResultResponseKindEnum>[
  _$screenplayRewriteResultResponseKindEnum_screenplayRewrite,
  _$screenplayRewriteResultResponseKindEnum_unknownDefaultOpenApi,
]);

Serializer<ScreenplayRewriteResultResponseKindEnum>
    _$screenplayRewriteResultResponseKindEnumSerializer =
    _$ScreenplayRewriteResultResponseKindEnumSerializer();

class _$ScreenplayRewriteResultResponseKindEnumSerializer
    implements PrimitiveSerializer<ScreenplayRewriteResultResponseKindEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'screenplayRewrite': 'screenplay_rewrite',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'screenplay_rewrite': 'screenplayRewrite',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ScreenplayRewriteResultResponseKindEnum
  ];
  @override
  final String wireName = 'ScreenplayRewriteResultResponseKindEnum';

  @override
  Object serialize(Serializers serializers,
          ScreenplayRewriteResultResponseKindEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ScreenplayRewriteResultResponseKindEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ScreenplayRewriteResultResponseKindEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ScreenplayRewriteResultResponse
    extends ScreenplayRewriteResultResponse {
  @override
  final ScreenplayRewriteResultResponseKindEnum kind;
  @override
  final String sourceLanguage;
  @override
  final String targetLanguage;
  @override
  final int sourceSceneCount;
  @override
  final int outputSceneCount;
  @override
  final BuiltList<ScreenplayGlossaryTermResponse> glossary;
  @override
  final BuiltList<String> changeSummary;

  factory _$ScreenplayRewriteResultResponse(
          [void Function(ScreenplayRewriteResultResponseBuilder)? updates]) =>
      (ScreenplayRewriteResultResponseBuilder()..update(updates))._build();

  _$ScreenplayRewriteResultResponse._(
      {required this.kind,
      required this.sourceLanguage,
      required this.targetLanguage,
      required this.sourceSceneCount,
      required this.outputSceneCount,
      required this.glossary,
      required this.changeSummary})
      : super._();
  @override
  ScreenplayRewriteResultResponse rebuild(
          void Function(ScreenplayRewriteResultResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScreenplayRewriteResultResponseBuilder toBuilder() =>
      ScreenplayRewriteResultResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScreenplayRewriteResultResponse &&
        kind == other.kind &&
        sourceLanguage == other.sourceLanguage &&
        targetLanguage == other.targetLanguage &&
        sourceSceneCount == other.sourceSceneCount &&
        outputSceneCount == other.outputSceneCount &&
        glossary == other.glossary &&
        changeSummary == other.changeSummary;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jc(_$hash, sourceLanguage.hashCode);
    _$hash = $jc(_$hash, targetLanguage.hashCode);
    _$hash = $jc(_$hash, sourceSceneCount.hashCode);
    _$hash = $jc(_$hash, outputSceneCount.hashCode);
    _$hash = $jc(_$hash, glossary.hashCode);
    _$hash = $jc(_$hash, changeSummary.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScreenplayRewriteResultResponse')
          ..add('kind', kind)
          ..add('sourceLanguage', sourceLanguage)
          ..add('targetLanguage', targetLanguage)
          ..add('sourceSceneCount', sourceSceneCount)
          ..add('outputSceneCount', outputSceneCount)
          ..add('glossary', glossary)
          ..add('changeSummary', changeSummary))
        .toString();
  }
}

class ScreenplayRewriteResultResponseBuilder
    implements
        Builder<ScreenplayRewriteResultResponse,
            ScreenplayRewriteResultResponseBuilder> {
  _$ScreenplayRewriteResultResponse? _$v;

  ScreenplayRewriteResultResponseKindEnum? _kind;
  ScreenplayRewriteResultResponseKindEnum? get kind => _$this._kind;
  set kind(ScreenplayRewriteResultResponseKindEnum? kind) =>
      _$this._kind = kind;

  String? _sourceLanguage;
  String? get sourceLanguage => _$this._sourceLanguage;
  set sourceLanguage(String? sourceLanguage) =>
      _$this._sourceLanguage = sourceLanguage;

  String? _targetLanguage;
  String? get targetLanguage => _$this._targetLanguage;
  set targetLanguage(String? targetLanguage) =>
      _$this._targetLanguage = targetLanguage;

  int? _sourceSceneCount;
  int? get sourceSceneCount => _$this._sourceSceneCount;
  set sourceSceneCount(int? sourceSceneCount) =>
      _$this._sourceSceneCount = sourceSceneCount;

  int? _outputSceneCount;
  int? get outputSceneCount => _$this._outputSceneCount;
  set outputSceneCount(int? outputSceneCount) =>
      _$this._outputSceneCount = outputSceneCount;

  ListBuilder<ScreenplayGlossaryTermResponse>? _glossary;
  ListBuilder<ScreenplayGlossaryTermResponse> get glossary =>
      _$this._glossary ??= ListBuilder<ScreenplayGlossaryTermResponse>();
  set glossary(ListBuilder<ScreenplayGlossaryTermResponse>? glossary) =>
      _$this._glossary = glossary;

  ListBuilder<String>? _changeSummary;
  ListBuilder<String> get changeSummary =>
      _$this._changeSummary ??= ListBuilder<String>();
  set changeSummary(ListBuilder<String>? changeSummary) =>
      _$this._changeSummary = changeSummary;

  ScreenplayRewriteResultResponseBuilder() {
    ScreenplayRewriteResultResponse._defaults(this);
  }

  ScreenplayRewriteResultResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kind = $v.kind;
      _sourceLanguage = $v.sourceLanguage;
      _targetLanguage = $v.targetLanguage;
      _sourceSceneCount = $v.sourceSceneCount;
      _outputSceneCount = $v.outputSceneCount;
      _glossary = $v.glossary.toBuilder();
      _changeSummary = $v.changeSummary.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScreenplayRewriteResultResponse other) {
    _$v = other as _$ScreenplayRewriteResultResponse;
  }

  @override
  void update(void Function(ScreenplayRewriteResultResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScreenplayRewriteResultResponse build() => _build();

  _$ScreenplayRewriteResultResponse _build() {
    _$ScreenplayRewriteResultResponse _$result;
    try {
      _$result = _$v ??
          _$ScreenplayRewriteResultResponse._(
            kind: BuiltValueNullFieldError.checkNotNull(
                kind, r'ScreenplayRewriteResultResponse', 'kind'),
            sourceLanguage: BuiltValueNullFieldError.checkNotNull(
                sourceLanguage,
                r'ScreenplayRewriteResultResponse',
                'sourceLanguage'),
            targetLanguage: BuiltValueNullFieldError.checkNotNull(
                targetLanguage,
                r'ScreenplayRewriteResultResponse',
                'targetLanguage'),
            sourceSceneCount: BuiltValueNullFieldError.checkNotNull(
                sourceSceneCount,
                r'ScreenplayRewriteResultResponse',
                'sourceSceneCount'),
            outputSceneCount: BuiltValueNullFieldError.checkNotNull(
                outputSceneCount,
                r'ScreenplayRewriteResultResponse',
                'outputSceneCount'),
            glossary: glossary.build(),
            changeSummary: changeSummary.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'glossary';
        glossary.build();
        _$failedField = 'changeSummary';
        changeSummary.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ScreenplayRewriteResultResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
