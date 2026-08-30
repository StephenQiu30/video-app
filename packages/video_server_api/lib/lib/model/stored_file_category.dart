//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stored_file_category.g.dart';

class StoredFileCategory extends EnumClass {
  @BuiltValueEnumConst(wireName: r'video')
  static const StoredFileCategory video = _$video;
  @BuiltValueEnumConst(wireName: r'screenplay')
  static const StoredFileCategory screenplay = _$screenplay;
  @BuiltValueEnumConst(wireName: r'analysis_report')
  static const StoredFileCategory analysisReport = _$analysisReport;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const StoredFileCategory unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<StoredFileCategory> get serializer =>
      _$storedFileCategorySerializer;

  const StoredFileCategory._(String name) : super(name);

  static BuiltSet<StoredFileCategory> get values => _$values;
  static StoredFileCategory valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class StoredFileCategoryMixin = Object with _$StoredFileCategoryMixin;
