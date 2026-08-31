//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_role.g.dart';

class UserRole extends EnumClass {
  @BuiltValueEnumConst(wireName: r'admin')
  static const UserRole admin = _$admin;
  @BuiltValueEnumConst(wireName: r'user')
  static const UserRole user = _$user;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const UserRole unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<UserRole> get serializer => _$userRoleSerializer;

  const UserRole._(String name) : super(name);

  static BuiltSet<UserRole> get values => _$values;
  static UserRole valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class UserRoleMixin = Object with _$UserRoleMixin;
