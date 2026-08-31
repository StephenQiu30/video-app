//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'import_source_format.g.dart';

class ImportSourceFormat extends EnumClass {
  @BuiltValueEnumConst(wireName: r'mp4')
  static const ImportSourceFormat mp4 = _$mp4;
  @BuiltValueEnumConst(wireName: r'docx')
  static const ImportSourceFormat docx = _$docx;
  @BuiltValueEnumConst(wireName: r'pdf')
  static const ImportSourceFormat pdf = _$pdf;
  @BuiltValueEnumConst(wireName: r'txt')
  static const ImportSourceFormat txt = _$txt;
  @BuiltValueEnumConst(wireName: r'markdown')
  static const ImportSourceFormat markdown = _$markdown;
  @BuiltValueEnumConst(wireName: r'fountain')
  static const ImportSourceFormat fountain = _$fountain;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ImportSourceFormat unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<ImportSourceFormat> get serializer =>
      _$importSourceFormatSerializer;

  const ImportSourceFormat._(String name) : super(name);

  static BuiltSet<ImportSourceFormat> get values => _$values;
  static ImportSourceFormat valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ImportSourceFormatMixin = Object with _$ImportSourceFormatMixin;
