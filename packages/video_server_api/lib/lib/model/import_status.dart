//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'import_status.g.dart';

class ImportStatus extends EnumClass {
  @BuiltValueEnumConst(wireName: r'uploading')
  static const ImportStatus uploading = _$uploading;
  @BuiltValueEnumConst(wireName: r'verifying')
  static const ImportStatus verifying = _$verifying;
  @BuiltValueEnumConst(wireName: r'ready')
  static const ImportStatus ready = _$ready;
  @BuiltValueEnumConst(wireName: r'failed')
  static const ImportStatus failed = _$failed;
  @BuiltValueEnumConst(wireName: r'cancelled')
  static const ImportStatus cancelled = _$cancelled;
  @BuiltValueEnumConst(wireName: r'expired')
  static const ImportStatus expired = _$expired;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ImportStatus unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<ImportStatus> get serializer => _$importStatusSerializer;

  const ImportStatus._(String name) : super(name);

  static BuiltSet<ImportStatus> get values => _$values;
  static ImportStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ImportStatusMixin = Object with _$ImportStatusMixin;
