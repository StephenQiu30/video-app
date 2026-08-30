// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_source_format.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DocumentSourceFormat _$docx = const DocumentSourceFormat._('docx');
const DocumentSourceFormat _$pdf = const DocumentSourceFormat._('pdf');
const DocumentSourceFormat _$txt = const DocumentSourceFormat._('txt');
const DocumentSourceFormat _$markdown =
    const DocumentSourceFormat._('markdown');
const DocumentSourceFormat _$fountain =
    const DocumentSourceFormat._('fountain');
const DocumentSourceFormat _$unknownDefaultOpenApi =
    const DocumentSourceFormat._('unknownDefaultOpenApi');

DocumentSourceFormat _$valueOf(String name) {
  switch (name) {
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

final BuiltSet<DocumentSourceFormat> _$values =
    BuiltSet<DocumentSourceFormat>(const <DocumentSourceFormat>[
  _$docx,
  _$pdf,
  _$txt,
  _$markdown,
  _$fountain,
  _$unknownDefaultOpenApi,
]);

class _$DocumentSourceFormatMeta {
  const _$DocumentSourceFormatMeta();
  DocumentSourceFormat get docx => _$docx;
  DocumentSourceFormat get pdf => _$pdf;
  DocumentSourceFormat get txt => _$txt;
  DocumentSourceFormat get markdown => _$markdown;
  DocumentSourceFormat get fountain => _$fountain;
  DocumentSourceFormat get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  DocumentSourceFormat valueOf(String name) => _$valueOf(name);
  BuiltSet<DocumentSourceFormat> get values => _$values;
}

mixin _$DocumentSourceFormatMixin {
  // ignore: non_constant_identifier_names
  _$DocumentSourceFormatMeta get DocumentSourceFormat =>
      const _$DocumentSourceFormatMeta();
}

Serializer<DocumentSourceFormat> _$documentSourceFormatSerializer =
    _$DocumentSourceFormatSerializer();

class _$DocumentSourceFormatSerializer
    implements PrimitiveSerializer<DocumentSourceFormat> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'docx': 'docx',
    'pdf': 'pdf',
    'txt': 'txt',
    'markdown': 'markdown',
    'fountain': 'fountain',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'docx': 'docx',
    'pdf': 'pdf',
    'txt': 'txt',
    'markdown': 'markdown',
    'fountain': 'fountain',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[DocumentSourceFormat];
  @override
  final String wireName = 'DocumentSourceFormat';

  @override
  Object serialize(Serializers serializers, DocumentSourceFormat object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DocumentSourceFormat deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DocumentSourceFormat.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
