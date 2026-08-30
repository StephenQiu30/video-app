// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stored_file_category.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const StoredFileCategory _$video = const StoredFileCategory._('video');
const StoredFileCategory _$screenplay =
    const StoredFileCategory._('screenplay');
const StoredFileCategory _$analysisReport =
    const StoredFileCategory._('analysisReport');
const StoredFileCategory _$unknownDefaultOpenApi =
    const StoredFileCategory._('unknownDefaultOpenApi');

StoredFileCategory _$valueOf(String name) {
  switch (name) {
    case 'video':
      return _$video;
    case 'screenplay':
      return _$screenplay;
    case 'analysisReport':
      return _$analysisReport;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<StoredFileCategory> _$values =
    BuiltSet<StoredFileCategory>(const <StoredFileCategory>[
  _$video,
  _$screenplay,
  _$analysisReport,
  _$unknownDefaultOpenApi,
]);

class _$StoredFileCategoryMeta {
  const _$StoredFileCategoryMeta();
  StoredFileCategory get video => _$video;
  StoredFileCategory get screenplay => _$screenplay;
  StoredFileCategory get analysisReport => _$analysisReport;
  StoredFileCategory get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  StoredFileCategory valueOf(String name) => _$valueOf(name);
  BuiltSet<StoredFileCategory> get values => _$values;
}

mixin _$StoredFileCategoryMixin {
  // ignore: non_constant_identifier_names
  _$StoredFileCategoryMeta get StoredFileCategory =>
      const _$StoredFileCategoryMeta();
}

Serializer<StoredFileCategory> _$storedFileCategorySerializer =
    _$StoredFileCategorySerializer();

class _$StoredFileCategorySerializer
    implements PrimitiveSerializer<StoredFileCategory> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'video': 'video',
    'screenplay': 'screenplay',
    'analysisReport': 'analysis_report',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'video': 'video',
    'screenplay': 'screenplay',
    'analysis_report': 'analysisReport',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[StoredFileCategory];
  @override
  final String wireName = 'StoredFileCategory';

  @override
  Object serialize(Serializers serializers, StoredFileCategory object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  StoredFileCategory deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      StoredFileCategory.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
