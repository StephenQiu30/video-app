//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'problem_details.g.dart';

/// RFC 9457 error document returned by public API operations.
///
/// Properties:
/// * [type] - 稳定的服务错误类型 URI。
/// * [title] - 面向调用方的简短错误标题。
/// * [status] - HTTP 状态码。
/// * [detail] - 不包含敏感信息的错误说明。
/// * [code] - 供客户端分支处理的稳定错误码。
/// * [instance] - 产生错误的请求路径。
@BuiltValue()
abstract class ProblemDetails
    implements Built<ProblemDetails, ProblemDetailsBuilder> {
  /// 稳定的服务错误类型 URI。
  @BuiltValueField(wireName: r'type')
  String get type;

  /// 面向调用方的简短错误标题。
  @BuiltValueField(wireName: r'title')
  String get title;

  /// HTTP 状态码。
  @BuiltValueField(wireName: r'status')
  int get status;

  /// 不包含敏感信息的错误说明。
  @BuiltValueField(wireName: r'detail')
  String get detail;

  /// 供客户端分支处理的稳定错误码。
  @BuiltValueField(wireName: r'code')
  String get code;

  /// 产生错误的请求路径。
  @BuiltValueField(wireName: r'instance')
  String get instance;

  ProblemDetails._();

  factory ProblemDetails([void updates(ProblemDetailsBuilder b)]) =
      _$ProblemDetails;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProblemDetailsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProblemDetails> get serializer =>
      _$ProblemDetailsSerializer();
}

class _$ProblemDetailsSerializer
    implements PrimitiveSerializer<ProblemDetails> {
  @override
  final Iterable<Type> types = const [ProblemDetails, _$ProblemDetails];

  @override
  final String wireName = r'ProblemDetails';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProblemDetails object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(int),
    );
    yield r'detail';
    yield serializers.serialize(
      object.detail,
      specifiedType: const FullType(String),
    );
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'instance';
    yield serializers.serialize(
      object.instance,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ProblemDetails object, {
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
    required ProblemDetailsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.status = valueDes;
          break;
        case r'detail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.detail = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'instance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.instance = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProblemDetails deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProblemDetailsBuilder();
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
