// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenplay_analysis_result_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ScreenplayAnalysisResultResponseKindEnum
    _$screenplayAnalysisResultResponseKindEnum_screenplayAnalysis =
    const ScreenplayAnalysisResultResponseKindEnum._('screenplayAnalysis');
const ScreenplayAnalysisResultResponseKindEnum
    _$screenplayAnalysisResultResponseKindEnum_unknownDefaultOpenApi =
    const ScreenplayAnalysisResultResponseKindEnum._('unknownDefaultOpenApi');

ScreenplayAnalysisResultResponseKindEnum
    _$screenplayAnalysisResultResponseKindEnumValueOf(String name) {
  switch (name) {
    case 'screenplayAnalysis':
      return _$screenplayAnalysisResultResponseKindEnum_screenplayAnalysis;
    case 'unknownDefaultOpenApi':
      return _$screenplayAnalysisResultResponseKindEnum_unknownDefaultOpenApi;
    default:
      return _$screenplayAnalysisResultResponseKindEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<ScreenplayAnalysisResultResponseKindEnum>
    _$screenplayAnalysisResultResponseKindEnumValues = BuiltSet<
        ScreenplayAnalysisResultResponseKindEnum>(const <ScreenplayAnalysisResultResponseKindEnum>[
  _$screenplayAnalysisResultResponseKindEnum_screenplayAnalysis,
  _$screenplayAnalysisResultResponseKindEnum_unknownDefaultOpenApi,
]);

Serializer<ScreenplayAnalysisResultResponseKindEnum>
    _$screenplayAnalysisResultResponseKindEnumSerializer =
    _$ScreenplayAnalysisResultResponseKindEnumSerializer();

class _$ScreenplayAnalysisResultResponseKindEnumSerializer
    implements PrimitiveSerializer<ScreenplayAnalysisResultResponseKindEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'screenplayAnalysis': 'screenplay_analysis',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'screenplay_analysis': 'screenplayAnalysis',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ScreenplayAnalysisResultResponseKindEnum
  ];
  @override
  final String wireName = 'ScreenplayAnalysisResultResponseKindEnum';

  @override
  Object serialize(Serializers serializers,
          ScreenplayAnalysisResultResponseKindEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ScreenplayAnalysisResultResponseKindEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ScreenplayAnalysisResultResponseKindEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ScreenplayAnalysisResultResponse
    extends ScreenplayAnalysisResultResponse {
  @override
  final ScreenplayAnalysisResultResponseKindEnum kind;
  @override
  final String language;
  @override
  final String title;
  @override
  final String logline;
  @override
  final String synopsis;
  @override
  final ScreenplayStructureResponse structure;
  @override
  final BuiltList<ScreenplayCharacterResponse> characters;
  @override
  final BuiltList<ScreenplaySceneResponse> scenes;
  @override
  final BuiltList<ScreenplayEvidenceItemResponse> dialogueFindings;
  @override
  final BuiltList<ScreenplayEvidenceItemResponse> strengths;
  @override
  final BuiltList<ScreenplayEvidenceItemResponse> priorityRevisions;

  factory _$ScreenplayAnalysisResultResponse(
          [void Function(ScreenplayAnalysisResultResponseBuilder)? updates]) =>
      (ScreenplayAnalysisResultResponseBuilder()..update(updates))._build();

  _$ScreenplayAnalysisResultResponse._(
      {required this.kind,
      required this.language,
      required this.title,
      required this.logline,
      required this.synopsis,
      required this.structure,
      required this.characters,
      required this.scenes,
      required this.dialogueFindings,
      required this.strengths,
      required this.priorityRevisions})
      : super._();
  @override
  ScreenplayAnalysisResultResponse rebuild(
          void Function(ScreenplayAnalysisResultResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScreenplayAnalysisResultResponseBuilder toBuilder() =>
      ScreenplayAnalysisResultResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScreenplayAnalysisResultResponse &&
        kind == other.kind &&
        language == other.language &&
        title == other.title &&
        logline == other.logline &&
        synopsis == other.synopsis &&
        structure == other.structure &&
        characters == other.characters &&
        scenes == other.scenes &&
        dialogueFindings == other.dialogueFindings &&
        strengths == other.strengths &&
        priorityRevisions == other.priorityRevisions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, logline.hashCode);
    _$hash = $jc(_$hash, synopsis.hashCode);
    _$hash = $jc(_$hash, structure.hashCode);
    _$hash = $jc(_$hash, characters.hashCode);
    _$hash = $jc(_$hash, scenes.hashCode);
    _$hash = $jc(_$hash, dialogueFindings.hashCode);
    _$hash = $jc(_$hash, strengths.hashCode);
    _$hash = $jc(_$hash, priorityRevisions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScreenplayAnalysisResultResponse')
          ..add('kind', kind)
          ..add('language', language)
          ..add('title', title)
          ..add('logline', logline)
          ..add('synopsis', synopsis)
          ..add('structure', structure)
          ..add('characters', characters)
          ..add('scenes', scenes)
          ..add('dialogueFindings', dialogueFindings)
          ..add('strengths', strengths)
          ..add('priorityRevisions', priorityRevisions))
        .toString();
  }
}

class ScreenplayAnalysisResultResponseBuilder
    implements
        Builder<ScreenplayAnalysisResultResponse,
            ScreenplayAnalysisResultResponseBuilder> {
  _$ScreenplayAnalysisResultResponse? _$v;

  ScreenplayAnalysisResultResponseKindEnum? _kind;
  ScreenplayAnalysisResultResponseKindEnum? get kind => _$this._kind;
  set kind(ScreenplayAnalysisResultResponseKindEnum? kind) =>
      _$this._kind = kind;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _logline;
  String? get logline => _$this._logline;
  set logline(String? logline) => _$this._logline = logline;

  String? _synopsis;
  String? get synopsis => _$this._synopsis;
  set synopsis(String? synopsis) => _$this._synopsis = synopsis;

  ScreenplayStructureResponseBuilder? _structure;
  ScreenplayStructureResponseBuilder get structure =>
      _$this._structure ??= ScreenplayStructureResponseBuilder();
  set structure(ScreenplayStructureResponseBuilder? structure) =>
      _$this._structure = structure;

  ListBuilder<ScreenplayCharacterResponse>? _characters;
  ListBuilder<ScreenplayCharacterResponse> get characters =>
      _$this._characters ??= ListBuilder<ScreenplayCharacterResponse>();
  set characters(ListBuilder<ScreenplayCharacterResponse>? characters) =>
      _$this._characters = characters;

  ListBuilder<ScreenplaySceneResponse>? _scenes;
  ListBuilder<ScreenplaySceneResponse> get scenes =>
      _$this._scenes ??= ListBuilder<ScreenplaySceneResponse>();
  set scenes(ListBuilder<ScreenplaySceneResponse>? scenes) =>
      _$this._scenes = scenes;

  ListBuilder<ScreenplayEvidenceItemResponse>? _dialogueFindings;
  ListBuilder<ScreenplayEvidenceItemResponse> get dialogueFindings =>
      _$this._dialogueFindings ??=
          ListBuilder<ScreenplayEvidenceItemResponse>();
  set dialogueFindings(
          ListBuilder<ScreenplayEvidenceItemResponse>? dialogueFindings) =>
      _$this._dialogueFindings = dialogueFindings;

  ListBuilder<ScreenplayEvidenceItemResponse>? _strengths;
  ListBuilder<ScreenplayEvidenceItemResponse> get strengths =>
      _$this._strengths ??= ListBuilder<ScreenplayEvidenceItemResponse>();
  set strengths(ListBuilder<ScreenplayEvidenceItemResponse>? strengths) =>
      _$this._strengths = strengths;

  ListBuilder<ScreenplayEvidenceItemResponse>? _priorityRevisions;
  ListBuilder<ScreenplayEvidenceItemResponse> get priorityRevisions =>
      _$this._priorityRevisions ??=
          ListBuilder<ScreenplayEvidenceItemResponse>();
  set priorityRevisions(
          ListBuilder<ScreenplayEvidenceItemResponse>? priorityRevisions) =>
      _$this._priorityRevisions = priorityRevisions;

  ScreenplayAnalysisResultResponseBuilder() {
    ScreenplayAnalysisResultResponse._defaults(this);
  }

  ScreenplayAnalysisResultResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kind = $v.kind;
      _language = $v.language;
      _title = $v.title;
      _logline = $v.logline;
      _synopsis = $v.synopsis;
      _structure = $v.structure.toBuilder();
      _characters = $v.characters.toBuilder();
      _scenes = $v.scenes.toBuilder();
      _dialogueFindings = $v.dialogueFindings.toBuilder();
      _strengths = $v.strengths.toBuilder();
      _priorityRevisions = $v.priorityRevisions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScreenplayAnalysisResultResponse other) {
    _$v = other as _$ScreenplayAnalysisResultResponse;
  }

  @override
  void update(void Function(ScreenplayAnalysisResultResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScreenplayAnalysisResultResponse build() => _build();

  _$ScreenplayAnalysisResultResponse _build() {
    _$ScreenplayAnalysisResultResponse _$result;
    try {
      _$result = _$v ??
          _$ScreenplayAnalysisResultResponse._(
            kind: BuiltValueNullFieldError.checkNotNull(
                kind, r'ScreenplayAnalysisResultResponse', 'kind'),
            language: BuiltValueNullFieldError.checkNotNull(
                language, r'ScreenplayAnalysisResultResponse', 'language'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'ScreenplayAnalysisResultResponse', 'title'),
            logline: BuiltValueNullFieldError.checkNotNull(
                logline, r'ScreenplayAnalysisResultResponse', 'logline'),
            synopsis: BuiltValueNullFieldError.checkNotNull(
                synopsis, r'ScreenplayAnalysisResultResponse', 'synopsis'),
            structure: structure.build(),
            characters: characters.build(),
            scenes: scenes.build(),
            dialogueFindings: dialogueFindings.build(),
            strengths: strengths.build(),
            priorityRevisions: priorityRevisions.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'structure';
        structure.build();
        _$failedField = 'characters';
        characters.build();
        _$failedField = 'scenes';
        scenes.build();
        _$failedField = 'dialogueFindings';
        dialogueFindings.build();
        _$failedField = 'strengths';
        strengths.build();
        _$failedField = 'priorityRevisions';
        priorityRevisions.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ScreenplayAnalysisResultResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
