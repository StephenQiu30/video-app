//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'public_url_inspection_source.g.dart';

/// PublicUrlInspectionSource
///
/// Properties:
/// * [kind]
/// * [url] - 用户有权处理的公开、非 DRM HTTP(S) 媒体地址。
@BuiltValue()
abstract class PublicUrlInspectionSource
    implements
        Built<PublicUrlInspectionSource, PublicUrlInspectionSourceBuilder> {
  @BuiltValueField(wireName: r'kind')
  PublicUrlInspectionSourceKindEnum get kind;
  // enum kindEnum {  public_url,  };

  /// 用户有权处理的公开、非 DRM HTTP(S) 媒体地址。
  @BuiltValueField(wireName: r'url')
  String get url;

  PublicUrlInspectionSource._();

  factory PublicUrlInspectionSource(
          [void updates(PublicUrlInspectionSourceBuilder b)]) =
      _$PublicUrlInspectionSource;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PublicUrlInspectionSourceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PublicUrlInspectionSource> get serializer =>
      _$PublicUrlInspectionSourceSerializer();
}

class _$PublicUrlInspectionSourceSerializer
    implements PrimitiveSerializer<PublicUrlInspectionSource> {
  @override
  final Iterable<Type> types = const [
    PublicUrlInspectionSource,
    _$PublicUrlInspectionSource
  ];

  @override
  final String wireName = r'PublicUrlInspectionSource';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PublicUrlInspectionSource object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'kind';
    yield serializers.serialize(
      object.kind,
      specifiedType: const FullType(PublicUrlInspectionSourceKindEnum),
    );
    yield r'url';
    yield serializers.serialize(
      object.url,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PublicUrlInspectionSource object, {
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
    required PublicUrlInspectionSourceBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PublicUrlInspectionSourceKindEnum),
          ) as PublicUrlInspectionSourceKindEnum;
          result.kind = valueDes;
          break;
        case r'url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.url = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PublicUrlInspectionSource deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PublicUrlInspectionSourceBuilder();
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

class PublicUrlInspectionSourceKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'public_url')
  static const PublicUrlInspectionSourceKindEnum publicUrl =
      _$publicUrlInspectionSourceKindEnum_publicUrl;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const PublicUrlInspectionSourceKindEnum unknownDefaultOpenApi =
      _$publicUrlInspectionSourceKindEnum_unknownDefaultOpenApi;

  static Serializer<PublicUrlInspectionSourceKindEnum> get serializer =>
      _$publicUrlInspectionSourceKindEnumSerializer;

  const PublicUrlInspectionSourceKindEnum._(String name) : super(name);

  static BuiltSet<PublicUrlInspectionSourceKindEnum> get values =>
      _$publicUrlInspectionSourceKindEnumValues;
  static PublicUrlInspectionSourceKindEnum valueOf(String name) =>
      _$publicUrlInspectionSourceKindEnumValueOf(name);
}
