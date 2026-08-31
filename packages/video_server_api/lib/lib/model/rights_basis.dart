//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'rights_basis.g.dart';

class RightsBasis extends EnumClass {
  @BuiltValueEnumConst(wireName: r'public_access')
  static const RightsBasis publicAccess = _$publicAccess;
  @BuiltValueEnumConst(wireName: r'owner_authorized_export')
  static const RightsBasis ownerAuthorizedExport = _$ownerAuthorizedExport;
  @BuiltValueEnumConst(wireName: r'official_asset_grant')
  static const RightsBasis officialAssetGrant = _$officialAssetGrant;
  @BuiltValueEnumConst(wireName: r'user_provided')
  static const RightsBasis userProvided = _$userProvided;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const RightsBasis unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<RightsBasis> get serializer => _$rightsBasisSerializer;

  const RightsBasis._(String name) : super(name);

  static BuiltSet<RightsBasis> get values => _$values;
  static RightsBasis valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class RightsBasisMixin = Object with _$RightsBasisMixin;
