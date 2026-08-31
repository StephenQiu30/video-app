//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/discovery_decision_hint.dart';
import 'package:video_server_api/lib/model/discovery_item_status.dart';
import 'package:video_server_api/lib/model/discovery_item_kind.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'source_discovery_item_response.g.dart';

/// SourceDiscoveryItemResponse
///
/// Properties:
/// * [itemRef]
/// * [kind]
/// * [title]
/// * [durationMs]
/// * [decisionHint]
/// * [status]
@BuiltValue()
abstract class SourceDiscoveryItemResponse
    implements
        Built<SourceDiscoveryItemResponse, SourceDiscoveryItemResponseBuilder> {
  @BuiltValueField(wireName: r'item_ref')
  String get itemRef;

  @BuiltValueField(wireName: r'kind')
  DiscoveryItemKind get kind;
  // enum kindEnum {  official_account_native,  tencent_video,  wechat_channels,  unknown,  };

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'duration_ms')
  int? get durationMs;

  @BuiltValueField(wireName: r'decision_hint')
  DiscoveryDecisionHint get decisionHint;
  // enum decisionHintEnum {  candidate,  export_required,  unsupported,  };

  @BuiltValueField(wireName: r'status')
  DiscoveryItemStatus get status;
  // enum statusEnum {  ready,  identity_unverified,  };

  SourceDiscoveryItemResponse._();

  factory SourceDiscoveryItemResponse(
          [void updates(SourceDiscoveryItemResponseBuilder b)]) =
      _$SourceDiscoveryItemResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SourceDiscoveryItemResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SourceDiscoveryItemResponse> get serializer =>
      _$SourceDiscoveryItemResponseSerializer();
}

class _$SourceDiscoveryItemResponseSerializer
    implements PrimitiveSerializer<SourceDiscoveryItemResponse> {
  @override
  final Iterable<Type> types = const [
    SourceDiscoveryItemResponse,
    _$SourceDiscoveryItemResponse
  ];

  @override
  final String wireName = r'SourceDiscoveryItemResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SourceDiscoveryItemResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'item_ref';
    yield serializers.serialize(
      object.itemRef,
      specifiedType: const FullType(String),
    );
    yield r'kind';
    yield serializers.serialize(
      object.kind,
      specifiedType: const FullType(DiscoveryItemKind),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'duration_ms';
    yield object.durationMs == null
        ? null
        : serializers.serialize(
            object.durationMs,
            specifiedType: const FullType.nullable(int),
          );
    yield r'decision_hint';
    yield serializers.serialize(
      object.decisionHint,
      specifiedType: const FullType(DiscoveryDecisionHint),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(DiscoveryItemStatus),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SourceDiscoveryItemResponse object, {
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
    required SourceDiscoveryItemResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'item_ref':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.itemRef = valueDes;
          break;
        case r'kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DiscoveryItemKind),
          ) as DiscoveryItemKind;
          result.kind = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'duration_ms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.durationMs = valueDes;
          break;
        case r'decision_hint':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DiscoveryDecisionHint),
          ) as DiscoveryDecisionHint;
          result.decisionHint = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DiscoveryItemStatus),
          ) as DiscoveryItemStatus;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SourceDiscoveryItemResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SourceDiscoveryItemResponseBuilder();
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
