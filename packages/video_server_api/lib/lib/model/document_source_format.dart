//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'document_source_format.g.dart';

class DocumentSourceFormat extends EnumClass {
  @BuiltValueEnumConst(wireName: r'docx')
  static const DocumentSourceFormat docx = _$docx;
  @BuiltValueEnumConst(wireName: r'pdf')
  static const DocumentSourceFormat pdf = _$pdf;
  @BuiltValueEnumConst(wireName: r'txt')
  static const DocumentSourceFormat txt = _$txt;
  @BuiltValueEnumConst(wireName: r'markdown')
  static const DocumentSourceFormat markdown = _$markdown;
  @BuiltValueEnumConst(wireName: r'fountain')
  static const DocumentSourceFormat fountain = _$fountain;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DocumentSourceFormat unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<DocumentSourceFormat> get serializer =>
      _$documentSourceFormatSerializer;

  const DocumentSourceFormat._(String name) : super(name);

  static BuiltSet<DocumentSourceFormat> get values => _$values;
  static DocumentSourceFormat valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DocumentSourceFormatMixin = Object
    with _$DocumentSourceFormatMixin;
