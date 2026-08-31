//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'source_origin.g.dart';

class SourceOrigin extends EnumClass {
  @BuiltValueEnumConst(wireName: r'public_url')
  static const SourceOrigin publicUrl = _$publicUrl;
  @BuiltValueEnumConst(wireName: r'discovered_item')
  static const SourceOrigin discoveredItem = _$discoveredItem;
  @BuiltValueEnumConst(wireName: r'official_asset')
  static const SourceOrigin officialAsset = _$officialAsset;
  @BuiltValueEnumConst(wireName: r'verified_import')
  static const SourceOrigin verifiedImport = _$verifiedImport;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const SourceOrigin unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<SourceOrigin> get serializer => _$sourceOriginSerializer;

  const SourceOrigin._(String name) : super(name);

  static BuiltSet<SourceOrigin> get values => _$values;
  static SourceOrigin valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class SourceOriginMixin = Object with _$SourceOriginMixin;
