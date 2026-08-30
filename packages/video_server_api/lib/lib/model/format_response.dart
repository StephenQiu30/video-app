//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:video_server_api/lib/model/semantic_plan_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'format_response.g.dart';

/// FormatResponse
///
/// Properties:
/// * [id]
/// * [displayName]
/// * [plan]
@BuiltValue()
abstract class FormatResponse
    implements Built<FormatResponse, FormatResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'display_name')
  String get displayName;

  @BuiltValueField(wireName: r'plan')
  SemanticPlanResponse get plan;

  FormatResponse._();

  factory FormatResponse([void updates(FormatResponseBuilder b)]) =
      _$FormatResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FormatResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FormatResponse> get serializer =>
      _$FormatResponseSerializer();
}

class _$FormatResponseSerializer
    implements PrimitiveSerializer<FormatResponse> {
  @override
  final Iterable<Type> types = const [FormatResponse, _$FormatResponse];

  @override
  final String wireName = r'FormatResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FormatResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'display_name';
    yield serializers.serialize(
      object.displayName,
      specifiedType: const FullType(String),
    );
    yield r'plan';
    yield serializers.serialize(
      object.plan,
      specifiedType: const FullType(SemanticPlanResponse),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    FormatResponse object, {
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
    required FormatResponseBuilder result,
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
        case r'display_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.displayName = valueDes;
          break;
        case r'plan':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SemanticPlanResponse),
          ) as SemanticPlanResponse;
          result.plan.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FormatResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FormatResponseBuilder();
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
