//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'execution_mode.g.dart';

class ExecutionMode extends EnumClass {
  @BuiltValueEnumConst(wireName: r'provider_runner')
  static const ExecutionMode providerRunner = _$providerRunner;
  @BuiltValueEnumConst(wireName: r'article_native')
  static const ExecutionMode articleNative = _$articleNative;
  @BuiltValueEnumConst(wireName: r'official_connector')
  static const ExecutionMode officialConnector = _$officialConnector;
  @BuiltValueEnumConst(wireName: r'verified_import')
  static const ExecutionMode verifiedImport = _$verifiedImport;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ExecutionMode unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<ExecutionMode> get serializer => _$executionModeSerializer;

  const ExecutionMode._(String name) : super(name);

  static BuiltSet<ExecutionMode> get values => _$values;
  static ExecutionMode valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ExecutionModeMixin = Object with _$ExecutionModeMixin;
