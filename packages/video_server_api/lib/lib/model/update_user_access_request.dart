//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/user_role.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_user_access_request.g.dart';

/// UpdateUserAccessRequest
///
/// Properties:
/// * [role]
/// * [isActive]
@BuiltValue()
abstract class UpdateUserAccessRequest
    implements Built<UpdateUserAccessRequest, UpdateUserAccessRequestBuilder> {
  @BuiltValueField(wireName: r'role')
  UserRole? get role;
  // enum roleEnum {  admin,  user,  };

  @BuiltValueField(wireName: r'is_active')
  bool? get isActive;

  UpdateUserAccessRequest._();

  factory UpdateUserAccessRequest(
          [void updates(UpdateUserAccessRequestBuilder b)]) =
      _$UpdateUserAccessRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateUserAccessRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateUserAccessRequest> get serializer =>
      _$UpdateUserAccessRequestSerializer();
}

class _$UpdateUserAccessRequestSerializer
    implements PrimitiveSerializer<UpdateUserAccessRequest> {
  @override
  final Iterable<Type> types = const [
    UpdateUserAccessRequest,
    _$UpdateUserAccessRequest
  ];

  @override
  final String wireName = r'UpdateUserAccessRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateUserAccessRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.role != null) {
      yield r'role';
      yield serializers.serialize(
        object.role,
        specifiedType: const FullType.nullable(UserRole),
      );
    }
    if (object.isActive != null) {
      yield r'is_active';
      yield serializers.serialize(
        object.isActive,
        specifiedType: const FullType.nullable(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateUserAccessRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateUserAccessRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(UserRole),
          ) as UserRole?;
          if (valueDes == null) continue;
          result.role = valueDes;
          break;
        case r'is_active':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isActive = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateUserAccessRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateUserAccessRequestBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
