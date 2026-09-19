//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_quota_settings.g.dart';

/// UserQuotaSettings
///
/// Properties:
/// * [exempt]
/// * [maxActivePerOwner]
/// * [dailyTasks]
/// * [dailyBytes]
/// * [storageBytes]
/// * [dailyAnalysisAttempts]
@BuiltValue()
abstract class UserQuotaSettings
    implements Built<UserQuotaSettings, UserQuotaSettingsBuilder> {
  @BuiltValueField(wireName: r'exempt')
  bool? get exempt;

  @BuiltValueField(wireName: r'max_active_per_owner')
  int? get maxActivePerOwner;

  @BuiltValueField(wireName: r'daily_tasks')
  int? get dailyTasks;

  @BuiltValueField(wireName: r'daily_bytes')
  int? get dailyBytes;

  @BuiltValueField(wireName: r'storage_bytes')
  int? get storageBytes;

  @BuiltValueField(wireName: r'daily_analysis_attempts')
  int? get dailyAnalysisAttempts;

  UserQuotaSettings._();

  factory UserQuotaSettings([void updates(UserQuotaSettingsBuilder b)]) =
      _$UserQuotaSettings;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserQuotaSettingsBuilder b) => b..exempt = false;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserQuotaSettings> get serializer =>
      _$UserQuotaSettingsSerializer();
}

class _$UserQuotaSettingsSerializer
    implements PrimitiveSerializer<UserQuotaSettings> {
  @override
  final Iterable<Type> types = const [UserQuotaSettings, _$UserQuotaSettings];

  @override
  final String wireName = r'UserQuotaSettings';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserQuotaSettings object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.exempt != null) {
      yield r'exempt';
      yield serializers.serialize(
        object.exempt,
        specifiedType: const FullType(bool),
      );
    }
    if (object.maxActivePerOwner != null) {
      yield r'max_active_per_owner';
      yield serializers.serialize(
        object.maxActivePerOwner,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.dailyTasks != null) {
      yield r'daily_tasks';
      yield serializers.serialize(
        object.dailyTasks,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.dailyBytes != null) {
      yield r'daily_bytes';
      yield serializers.serialize(
        object.dailyBytes,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.storageBytes != null) {
      yield r'storage_bytes';
      yield serializers.serialize(
        object.storageBytes,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.dailyAnalysisAttempts != null) {
      yield r'daily_analysis_attempts';
      yield serializers.serialize(
        object.dailyAnalysisAttempts,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserQuotaSettings object, {
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
    required UserQuotaSettingsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'exempt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.exempt = valueDes;
          break;
        case r'max_active_per_owner':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.maxActivePerOwner = valueDes;
          break;
        case r'daily_tasks':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.dailyTasks = valueDes;
          break;
        case r'daily_bytes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.dailyBytes = valueDes;
          break;
        case r'storage_bytes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.storageBytes = valueDes;
          break;
        case r'daily_analysis_attempts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.dailyAnalysisAttempts = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserQuotaSettings deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserQuotaSettingsBuilder();
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
