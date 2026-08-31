//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/user_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'native_session_response.g.dart';

/// NativeSessionResponse
///
/// Properties:
/// * [user]
/// * [accessToken]
/// * [refreshToken]
/// * [tokenType]
/// * [accessExpiresAt]
/// * [refreshExpiresAt]
@BuiltValue()
abstract class NativeSessionResponse
    implements Built<NativeSessionResponse, NativeSessionResponseBuilder> {
  @BuiltValueField(wireName: r'user')
  UserResponse get user;

  @BuiltValueField(wireName: r'access_token')
  String get accessToken;

  @BuiltValueField(wireName: r'refresh_token')
  String get refreshToken;

  @BuiltValueField(wireName: r'token_type')
  NativeSessionResponseTokenTypeEnum get tokenType;
  // enum tokenTypeEnum {  Bearer,  };

  @BuiltValueField(wireName: r'access_expires_at')
  DateTime get accessExpiresAt;

  @BuiltValueField(wireName: r'refresh_expires_at')
  DateTime get refreshExpiresAt;

  NativeSessionResponse._();

  factory NativeSessionResponse(
      [void updates(NativeSessionResponseBuilder b)]) = _$NativeSessionResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NativeSessionResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NativeSessionResponse> get serializer =>
      _$NativeSessionResponseSerializer();
}

class _$NativeSessionResponseSerializer
    implements PrimitiveSerializer<NativeSessionResponse> {
  @override
  final Iterable<Type> types = const [
    NativeSessionResponse,
    _$NativeSessionResponse
  ];

  @override
  final String wireName = r'NativeSessionResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NativeSessionResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user';
    yield serializers.serialize(
      object.user,
      specifiedType: const FullType(UserResponse),
    );
    yield r'access_token';
    yield serializers.serialize(
      object.accessToken,
      specifiedType: const FullType(String),
    );
    yield r'refresh_token';
    yield serializers.serialize(
      object.refreshToken,
      specifiedType: const FullType(String),
    );
    yield r'token_type';
    yield serializers.serialize(
      object.tokenType,
      specifiedType: const FullType(NativeSessionResponseTokenTypeEnum),
    );
    yield r'access_expires_at';
    yield serializers.serialize(
      object.accessExpiresAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'refresh_expires_at';
    yield serializers.serialize(
      object.refreshExpiresAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NativeSessionResponse object, {
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
    required NativeSessionResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserResponse),
          ) as UserResponse;
          result.user.replace(valueDes);
          break;
        case r'access_token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.accessToken = valueDes;
          break;
        case r'refresh_token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.refreshToken = valueDes;
          break;
        case r'token_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(NativeSessionResponseTokenTypeEnum),
          ) as NativeSessionResponseTokenTypeEnum;
          result.tokenType = valueDes;
          break;
        case r'access_expires_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.accessExpiresAt = valueDes;
          break;
        case r'refresh_expires_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.refreshExpiresAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NativeSessionResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NativeSessionResponseBuilder();
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

class NativeSessionResponseTokenTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'Bearer')
  static const NativeSessionResponseTokenTypeEnum bearer =
      _$nativeSessionResponseTokenTypeEnum_bearer;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const NativeSessionResponseTokenTypeEnum unknownDefaultOpenApi =
      _$nativeSessionResponseTokenTypeEnum_unknownDefaultOpenApi;

  static Serializer<NativeSessionResponseTokenTypeEnum> get serializer =>
      _$nativeSessionResponseTokenTypeEnumSerializer;

  const NativeSessionResponseTokenTypeEnum._(String name) : super(name);

  static BuiltSet<NativeSessionResponseTokenTypeEnum> get values =>
      _$nativeSessionResponseTokenTypeEnumValues;
  static NativeSessionResponseTokenTypeEnum valueOf(String name) =>
      _$nativeSessionResponseTokenTypeEnumValueOf(name);
}
