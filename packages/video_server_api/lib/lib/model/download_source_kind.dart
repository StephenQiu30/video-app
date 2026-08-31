//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_source_kind.g.dart';

class DownloadSourceKind extends EnumClass {
  @BuiltValueEnumConst(wireName: r'remote_provider')
  static const DownloadSourceKind remoteProvider = _$remoteProvider;
  @BuiltValueEnumConst(wireName: r'browser_import')
  static const DownloadSourceKind browserImport = _$browserImport;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DownloadSourceKind unknownDefaultOpenApi =
      _$unknownDefaultOpenApi;

  static Serializer<DownloadSourceKind> get serializer =>
      _$downloadSourceKindSerializer;

  const DownloadSourceKind._(String name) : super(name);

  static BuiltSet<DownloadSourceKind> get values => _$values;
  static DownloadSourceKind valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DownloadSourceKindMixin = Object with _$DownloadSourceKindMixin;
