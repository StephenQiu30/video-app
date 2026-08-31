//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/provider_capability.dart';
import 'package:video_server_api/lib/model/provider_support_status.dart';
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/provider_access_mode.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'provider_status_response.g.dart';

/// ProviderStatusResponse
///
/// Properties:
/// * [key]
/// * [displayName]
/// * [registered]
/// * [extractorExists]
/// * [capabilities]
/// * [accessModes]
/// * [status]
/// * [lastCheckedAt]
/// * [lastCheckSucceeded]
/// * [downloadSupported]
/// * [downloadAvailable]
/// * [lastMediaVerifiedAt]
/// * [lastVerifiedAt]
/// * [userAction]
@BuiltValue()
abstract class ProviderStatusResponse
    implements Built<ProviderStatusResponse, ProviderStatusResponseBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'display_name')
  String get displayName;

  @BuiltValueField(wireName: r'registered')
  bool get registered;

  @BuiltValueField(wireName: r'extractor_exists')
  bool get extractorExists;

  @BuiltValueField(wireName: r'capabilities')
  BuiltList<ProviderCapability> get capabilities;

  @BuiltValueField(wireName: r'access_modes')
  BuiltList<ProviderAccessMode> get accessModes;

  @BuiltValueField(wireName: r'status')
  ProviderSupportStatus get status;
  // enum statusEnum {  unknown,  verified,  degraded,  access_required,  rate_limited,  blocked,  disabled,  unsupported,  };

  @BuiltValueField(wireName: r'last_checked_at')
  DateTime? get lastCheckedAt;

  @BuiltValueField(wireName: r'last_check_succeeded')
  bool? get lastCheckSucceeded;

  @BuiltValueField(wireName: r'download_supported')
  bool get downloadSupported;

  @BuiltValueField(wireName: r'download_available')
  bool get downloadAvailable;

  @BuiltValueField(wireName: r'last_media_verified_at')
  DateTime? get lastMediaVerifiedAt;

  @BuiltValueField(wireName: r'last_verified_at')
  DateTime? get lastVerifiedAt;

  @BuiltValueField(wireName: r'user_action')
  String? get userAction;

  ProviderStatusResponse._();

  factory ProviderStatusResponse(
          [void updates(ProviderStatusResponseBuilder b)]) =
      _$ProviderStatusResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProviderStatusResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProviderStatusResponse> get serializer =>
      _$ProviderStatusResponseSerializer();
}

class _$ProviderStatusResponseSerializer
    implements PrimitiveSerializer<ProviderStatusResponse> {
  @override
  final Iterable<Type> types = const [
    ProviderStatusResponse,
    _$ProviderStatusResponse
  ];

  @override
  final String wireName = r'ProviderStatusResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProviderStatusResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'display_name';
    yield serializers.serialize(
      object.displayName,
      specifiedType: const FullType(String),
    );
    yield r'registered';
    yield serializers.serialize(
      object.registered,
      specifiedType: const FullType(bool),
    );
    yield r'extractor_exists';
    yield serializers.serialize(
      object.extractorExists,
      specifiedType: const FullType(bool),
    );
    yield r'capabilities';
    yield serializers.serialize(
      object.capabilities,
      specifiedType: const FullType(BuiltList, [FullType(ProviderCapability)]),
    );
    yield r'access_modes';
    yield serializers.serialize(
      object.accessModes,
      specifiedType: const FullType(BuiltList, [FullType(ProviderAccessMode)]),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(ProviderSupportStatus),
    );
    yield r'last_checked_at';
    yield object.lastCheckedAt == null
        ? null
        : serializers.serialize(
            object.lastCheckedAt,
            specifiedType: const FullType.nullable(DateTime),
          );
    yield r'last_check_succeeded';
    yield object.lastCheckSucceeded == null
        ? null
        : serializers.serialize(
            object.lastCheckSucceeded,
            specifiedType: const FullType.nullable(bool),
          );
    yield r'download_supported';
    yield serializers.serialize(
      object.downloadSupported,
      specifiedType: const FullType(bool),
    );
    yield r'download_available';
    yield serializers.serialize(
      object.downloadAvailable,
      specifiedType: const FullType(bool),
    );
    yield r'last_media_verified_at';
    yield object.lastMediaVerifiedAt == null
        ? null
        : serializers.serialize(
            object.lastMediaVerifiedAt,
            specifiedType: const FullType.nullable(DateTime),
          );
    yield r'last_verified_at';
    yield object.lastVerifiedAt == null
        ? null
        : serializers.serialize(
            object.lastVerifiedAt,
            specifiedType: const FullType.nullable(DateTime),
          );
    yield r'user_action';
    yield object.userAction == null
        ? null
        : serializers.serialize(
            object.userAction,
            specifiedType: const FullType.nullable(String),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    ProviderStatusResponse object, {
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
    required ProviderStatusResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        case r'display_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.displayName = valueDes;
          break;
        case r'registered':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.registered = valueDes;
          break;
        case r'extractor_exists':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.extractorExists = valueDes;
          break;
        case r'capabilities':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(ProviderCapability)]),
          ) as BuiltList<ProviderCapability>;
          result.capabilities.replace(valueDes);
          break;
        case r'access_modes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(ProviderAccessMode)]),
          ) as BuiltList<ProviderAccessMode>;
          result.accessModes.replace(valueDes);
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ProviderSupportStatus),
          ) as ProviderSupportStatus;
          result.status = valueDes;
          break;
        case r'last_checked_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.lastCheckedAt = valueDes;
          break;
        case r'last_check_succeeded':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.lastCheckSucceeded = valueDes;
          break;
        case r'download_supported':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.downloadSupported = valueDes;
          break;
        case r'download_available':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.downloadAvailable = valueDes;
          break;
        case r'last_media_verified_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.lastMediaVerifiedAt = valueDes;
          break;
        case r'last_verified_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.lastVerifiedAt = valueDes;
          break;
        case r'user_action':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userAction = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProviderStatusResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProviderStatusResponseBuilder();
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
