//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/intent_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'intent_response.g.dart';

/// IntentResponse
///
/// Properties:
/// * [id]
/// * [version]
/// * [status]
/// * [reasonCode]
/// * [nextAction]
/// * [retryAt]
/// * [deadline]
/// * [inspectionId]
/// * [jobId]
@BuiltValue()
abstract class IntentResponse
    implements Built<IntentResponse, IntentResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'version')
  int get version;

  @BuiltValueField(wireName: r'status')
  IntentStatus get status;
  // enum statusEnum {  queued,  preparing,  resolving,  retry_wait,  action_required,  ready,  handed_off,  cancelled,  expired,  failed,  };

  @BuiltValueField(wireName: r'reason_code')
  String? get reasonCode;

  @BuiltValueField(wireName: r'next_action')
  IntentResponseNextActionEnum? get nextAction;
  // enum nextActionEnum {  none,  };

  @BuiltValueField(wireName: r'retry_at')
  DateTime? get retryAt;

  @BuiltValueField(wireName: r'deadline')
  DateTime get deadline;

  @BuiltValueField(wireName: r'inspection_id')
  String? get inspectionId;

  @BuiltValueField(wireName: r'job_id')
  String? get jobId;

  IntentResponse._();

  factory IntentResponse([void updates(IntentResponseBuilder b)]) =
      _$IntentResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IntentResponseBuilder b) =>
      b..nextAction = IntentResponseNextActionEnum.valueOf('none');

  @BuiltValueSerializer(custom: true)
  static Serializer<IntentResponse> get serializer =>
      _$IntentResponseSerializer();
}

class _$IntentResponseSerializer
    implements PrimitiveSerializer<IntentResponse> {
  @override
  final Iterable<Type> types = const [IntentResponse, _$IntentResponse];

  @override
  final String wireName = r'IntentResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IntentResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(int),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(IntentStatus),
    );
    yield r'reason_code';
    yield object.reasonCode == null
        ? null
        : serializers.serialize(
            object.reasonCode,
            specifiedType: const FullType.nullable(String),
          );
    if (object.nextAction != null) {
      yield r'next_action';
      yield serializers.serialize(
        object.nextAction,
        specifiedType: const FullType(IntentResponseNextActionEnum),
      );
    }
    yield r'retry_at';
    yield object.retryAt == null
        ? null
        : serializers.serialize(
            object.retryAt,
            specifiedType: const FullType.nullable(DateTime),
          );
    yield r'deadline';
    yield serializers.serialize(
      object.deadline,
      specifiedType: const FullType(DateTime),
    );
    yield r'inspection_id';
    yield object.inspectionId == null
        ? null
        : serializers.serialize(
            object.inspectionId,
            specifiedType: const FullType.nullable(String),
          );
    yield r'job_id';
    yield object.jobId == null
        ? null
        : serializers.serialize(
            object.jobId,
            specifiedType: const FullType.nullable(String),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    IntentResponse object, {
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
    required IntentResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.version = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(IntentStatus),
          ) as IntentStatus;
          result.status = valueDes;
          break;
        case r'reason_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reasonCode = valueDes;
          break;
        case r'next_action':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(IntentResponseNextActionEnum),
          ) as IntentResponseNextActionEnum;
          result.nextAction = valueDes;
          break;
        case r'retry_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.retryAt = valueDes;
          break;
        case r'deadline':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.deadline = valueDes;
          break;
        case r'inspection_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.inspectionId = valueDes;
          break;
        case r'job_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.jobId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IntentResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IntentResponseBuilder();
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

class IntentResponseNextActionEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'none')
  static const IntentResponseNextActionEnum none =
      _$intentResponseNextActionEnum_none;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const IntentResponseNextActionEnum unknownDefaultOpenApi =
      _$intentResponseNextActionEnum_unknownDefaultOpenApi;

  static Serializer<IntentResponseNextActionEnum> get serializer =>
      _$intentResponseNextActionEnumSerializer;

  const IntentResponseNextActionEnum._(String name) : super(name);

  static BuiltSet<IntentResponseNextActionEnum> get values =>
      _$intentResponseNextActionEnumValues;
  static IntentResponseNextActionEnum valueOf(String name) =>
      _$intentResponseNextActionEnumValueOf(name);
}
