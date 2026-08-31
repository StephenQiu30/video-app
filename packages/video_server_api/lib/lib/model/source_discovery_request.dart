//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'source_discovery_request.g.dart';

/// SourceDiscoveryRequest
///
/// Properties:
/// * [kind]
/// * [url]
@BuiltValue()
abstract class SourceDiscoveryRequest
    implements Built<SourceDiscoveryRequest, SourceDiscoveryRequestBuilder> {
  @BuiltValueField(wireName: r'kind')
  SourceDiscoveryRequestKindEnum get kind;
  // enum kindEnum {  wechat_official_account_article,  };

  @BuiltValueField(wireName: r'url')
  String get url;

  SourceDiscoveryRequest._();

  factory SourceDiscoveryRequest(
          [void updates(SourceDiscoveryRequestBuilder b)]) =
      _$SourceDiscoveryRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SourceDiscoveryRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SourceDiscoveryRequest> get serializer =>
      _$SourceDiscoveryRequestSerializer();
}

class _$SourceDiscoveryRequestSerializer
    implements PrimitiveSerializer<SourceDiscoveryRequest> {
  @override
  final Iterable<Type> types = const [
    SourceDiscoveryRequest,
    _$SourceDiscoveryRequest
  ];

  @override
  final String wireName = r'SourceDiscoveryRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SourceDiscoveryRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'kind';
    yield serializers.serialize(
      object.kind,
      specifiedType: const FullType(SourceDiscoveryRequestKindEnum),
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
    SourceDiscoveryRequest object, {
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
    required SourceDiscoveryRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SourceDiscoveryRequestKindEnum),
          ) as SourceDiscoveryRequestKindEnum;
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
  SourceDiscoveryRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SourceDiscoveryRequestBuilder();
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

class SourceDiscoveryRequestKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'wechat_official_account_article')
  static const SourceDiscoveryRequestKindEnum wechatOfficialAccountArticle =
      _$sourceDiscoveryRequestKindEnum_wechatOfficialAccountArticle;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const SourceDiscoveryRequestKindEnum unknownDefaultOpenApi =
      _$sourceDiscoveryRequestKindEnum_unknownDefaultOpenApi;

  static Serializer<SourceDiscoveryRequestKindEnum> get serializer =>
      _$sourceDiscoveryRequestKindEnumSerializer;

  const SourceDiscoveryRequestKindEnum._(String name) : super(name);

  static BuiltSet<SourceDiscoveryRequestKindEnum> get values =>
      _$sourceDiscoveryRequestKindEnumValues;
  static SourceDiscoveryRequestKindEnum valueOf(String name) =>
      _$sourceDiscoveryRequestKindEnumValueOf(name);
}
