//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:video_server_api/lib/model/model_source.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'inspection_request.g.dart';

/// One explicitly selected, owner-authorized inspection source.
///
/// Properties:
/// * [source_]
@BuiltValue()
abstract class InspectionRequest
    implements Built<InspectionRequest, InspectionRequestBuilder> {
  @BuiltValueField(wireName: r'source')
  ModelSource get source_;

  InspectionRequest._();

  factory InspectionRequest([void updates(InspectionRequestBuilder b)]) =
      _$InspectionRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InspectionRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InspectionRequest> get serializer =>
      _$InspectionRequestSerializer();
}

class _$InspectionRequestSerializer
    implements PrimitiveSerializer<InspectionRequest> {
  @override
  final Iterable<Type> types = const [InspectionRequest, _$InspectionRequest];

  @override
  final String wireName = r'InspectionRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InspectionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'source';
    yield serializers.serialize(
      object.source_,
      specifiedType: const FullType(ModelSource),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    InspectionRequest object, {
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
    required InspectionRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'source':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ModelSource),
          ) as ModelSource;
          result.source_.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InspectionRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InspectionRequestBuilder();
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
