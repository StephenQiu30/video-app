// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_source_format.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ImportSourceFormat _$mp4 = const ImportSourceFormat._('mp4');
const ImportSourceFormat _$docx = const ImportSourceFormat._('docx');
const ImportSourceFormat _$pdf = const ImportSourceFormat._('pdf');
const ImportSourceFormat _$txt = const ImportSourceFormat._('txt');
const ImportSourceFormat _$markdown = const ImportSourceFormat._('markdown');
const ImportSourceFormat _$fountain = const ImportSourceFormat._('fountain');
const ImportSourceFormat _$unknownDefaultOpenApi =
    const ImportSourceFormat._('unknownDefaultOpenApi');

ImportSourceFormat _$valueOf(String name) {
  switch (name) {
    case 'mp4':
      return _$mp4;
    case 'docx':
      return _$docx;
    case 'pdf':
      return _$pdf;
    case 'txt':
      return _$txt;
    case 'markdown':
      return _$markdown;
    case 'fountain':
      return _$fountain;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<ImportSourceFormat> _$values =
    BuiltSet<ImportSourceFormat>(const <ImportSourceFormat>[
  _$mp4,
  _$docx,
  _$pdf,
  _$txt,
  _$markdown,
  _$fountain,
  _$unknownDefaultOpenApi,
]);

class _$ImportSourceFormatMeta {
  const _$ImportSourceFormatMeta();
  ImportSourceFormat get mp4 => _$mp4;
  ImportSourceFormat get docx => _$docx;
  ImportSourceFormat get pdf => _$pdf;
  ImportSourceFormat get txt => _$txt;
  ImportSourceFormat get markdown => _$markdown;
  ImportSourceFormat get fountain => _$fountain;
  ImportSourceFormat get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  ImportSourceFormat valueOf(String name) => _$valueOf(name);
  BuiltSet<ImportSourceFormat> get values => _$values;
}

mixin _$ImportSourceFormatMixin {
  // ignore: non_constant_identifier_names
  _$ImportSourceFormatMeta get ImportSourceFormat =>
      const _$ImportSourceFormatMeta();
}

Serializer<ImportSourceFormat> _$importSourceFormatSerializer =
    _$ImportSourceFormatSerializer();

class _$ImportSourceFormatSerializer
    implements PrimitiveSerializer<ImportSourceFormat> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'mp4': 'mp4',
    'docx': 'docx',
    'pdf': 'pdf',
    'txt': 'txt',
    'markdown': 'markdown',
    'fountain': 'fountain',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'mp4': 'mp4',
    'docx': 'docx',
    'pdf': 'pdf',
    'txt': 'txt',
    'markdown': 'markdown',
    'fountain': 'fountain',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ImportSourceFormat];
  @override
  final String wireName = 'ImportSourceFormat';

  @override
  Object serialize(Serializers serializers, ImportSourceFormat object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ImportSourceFormat deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ImportSourceFormat.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
