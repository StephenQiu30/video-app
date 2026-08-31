//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'declared_origin.g.dart';

class DeclaredOrigin extends EnumClass {
  @BuiltValueEnumConst(wireName: r'user_file')
  static const DeclaredOrigin userFile = _$userFile;
  @BuiltValueEnumConst(wireName: r'wechat_channels')
  static const DeclaredOrigin wechatChannels = _$wechatChannels;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DeclaredOrigin unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<DeclaredOrigin> get serializer =>
      _$declaredOriginSerializer;

  const DeclaredOrigin._(String name) : super(name);

  static BuiltSet<DeclaredOrigin> get values => _$values;
  static DeclaredOrigin valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DeclaredOriginMixin = Object with _$DeclaredOriginMixin;
