//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/intent_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'intent_history_item_response.g.dart';

/// IntentHistoryItemResponse
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
/// * [createdAt]
/// * [title]
@BuiltValue()
abstract class IntentHistoryItemResponse
    implements
        Built<IntentHistoryItemResponse, IntentHistoryItemResponseBuilder> {
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
  IntentHistoryItemResponseNextActionEnum? get nextAction;
  // enum nextActionEnum {  none,  };

  @BuiltValueField(wireName: r'retry_at')
  DateTime? get retryAt;

  @BuiltValueField(wireName: r'deadline')
  DateTime get deadline;

  @BuiltValueField(wireName: r'inspection_id')
  String? get inspectionId;

  @BuiltValueField(wireName: r'job_id')
  String? get jobId;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'title')
  String? get title;

  IntentHistoryItemResponse._();

  factory IntentHistoryItemResponse(
          [void updates(IntentHistoryItemResponseBuilder b)]) =
      _$IntentHistoryItemResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IntentHistoryItemResponseBuilder b) =>
      b..nextAction = IntentHistoryItemResponseNextActionEnum.valueOf('none');

  @BuiltValueSerializer(custom: true)
  static Serializer<IntentHistoryItemResponse> get serializer =>
      _$IntentHistoryItemResponseSerializer();
}

class _$IntentHistoryItemResponseSerializer
    implements PrimitiveSerializer<IntentHistoryItemResponse> {
  @override
  final Iterable<Type> types = const [
    IntentHistoryItemResponse,
    _$IntentHistoryItemResponse
  ];

  @override
  final String wireName = r'IntentHistoryItemResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IntentHistoryItemResponse object, {
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
        specifiedType: const FullType(IntentHistoryItemResponseNextActionEnum),
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
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'title';
    yield object.title == null
        ? null
        : serializers.serialize(
            object.title,
            specifiedType: const FullType.nullable(String),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    IntentHistoryItemResponse object, {
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
    required IntentHistoryItemResponseBuilder result,
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
            specifiedType:
                const FullType(IntentHistoryItemResponseNextActionEnum),
          ) as IntentHistoryItemResponseNextActionEnum;
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
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.title = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IntentHistoryItemResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IntentHistoryItemResponseBuilder();
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

class IntentHistoryItemResponseNextActionEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'none')
  static const IntentHistoryItemResponseNextActionEnum none =
      _$intentHistoryItemResponseNextActionEnum_none;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const IntentHistoryItemResponseNextActionEnum unknownDefaultOpenApi =
      _$intentHistoryItemResponseNextActionEnum_unknownDefaultOpenApi;

  static Serializer<IntentHistoryItemResponseNextActionEnum> get serializer =>
      _$intentHistoryItemResponseNextActionEnumSerializer;

  const IntentHistoryItemResponseNextActionEnum._(String name) : super(name);

  static BuiltSet<IntentHistoryItemResponseNextActionEnum> get values =>
      _$intentHistoryItemResponseNextActionEnumValues;
  static IntentHistoryItemResponseNextActionEnum valueOf(String name) =>
      _$intentHistoryItemResponseNextActionEnumValueOf(name);
}
