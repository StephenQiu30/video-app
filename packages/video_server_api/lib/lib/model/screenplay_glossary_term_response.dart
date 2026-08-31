//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'screenplay_glossary_term_response.g.dart';

/// ScreenplayGlossaryTermResponse
///
/// Properties:
/// * [source_]
/// * [target]
/// * [category]
@BuiltValue()
abstract class ScreenplayGlossaryTermResponse
    implements
        Built<ScreenplayGlossaryTermResponse,
            ScreenplayGlossaryTermResponseBuilder> {
  @BuiltValueField(wireName: r'source')
  String get source_;

  @BuiltValueField(wireName: r'target')
  String get target;

  @BuiltValueField(wireName: r'category')
  String get category;

  ScreenplayGlossaryTermResponse._();

  factory ScreenplayGlossaryTermResponse(
          [void updates(ScreenplayGlossaryTermResponseBuilder b)]) =
      _$ScreenplayGlossaryTermResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScreenplayGlossaryTermResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScreenplayGlossaryTermResponse> get serializer =>
      _$ScreenplayGlossaryTermResponseSerializer();
}

class _$ScreenplayGlossaryTermResponseSerializer
    implements PrimitiveSerializer<ScreenplayGlossaryTermResponse> {
  @override
  final Iterable<Type> types = const [
    ScreenplayGlossaryTermResponse,
    _$ScreenplayGlossaryTermResponse
  ];

  @override
  final String wireName = r'ScreenplayGlossaryTermResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScreenplayGlossaryTermResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'source';
    yield serializers.serialize(
      object.source_,
      specifiedType: const FullType(String),
    );
    yield r'target';
    yield serializers.serialize(
      object.target,
      specifiedType: const FullType(String),
    );
    yield r'category';
    yield serializers.serialize(
      object.category,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ScreenplayGlossaryTermResponse object, {
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
    required ScreenplayGlossaryTermResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'source':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.source_ = valueDes;
          break;
        case r'target':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.target = valueDes;
          break;
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.category = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ScreenplayGlossaryTermResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScreenplayGlossaryTermResponseBuilder();
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
