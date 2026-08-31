//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/upload_part_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'document_upload_session_response.g.dart';

/// DocumentUploadSessionResponse
///
/// Properties:
/// * [resourceId]
/// * [attempt]
/// * [partSizeBytes]
/// * [partCount]
/// * [maxConcurrency]
/// * [expiresAt]
/// * [parts]
@BuiltValue()
abstract class DocumentUploadSessionResponse
    implements
        Built<DocumentUploadSessionResponse,
            DocumentUploadSessionResponseBuilder> {
  @BuiltValueField(wireName: r'resource_id')
  String get resourceId;

  @BuiltValueField(wireName: r'attempt')
  int get attempt;

  @BuiltValueField(wireName: r'part_size_bytes')
  int get partSizeBytes;

  @BuiltValueField(wireName: r'part_count')
  int get partCount;

  @BuiltValueField(wireName: r'max_concurrency')
  int get maxConcurrency;

  @BuiltValueField(wireName: r'expires_at')
  DateTime get expiresAt;

  @BuiltValueField(wireName: r'parts')
  BuiltList<UploadPartResponse> get parts;

  DocumentUploadSessionResponse._();

  factory DocumentUploadSessionResponse(
          [void updates(DocumentUploadSessionResponseBuilder b)]) =
      _$DocumentUploadSessionResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DocumentUploadSessionResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DocumentUploadSessionResponse> get serializer =>
      _$DocumentUploadSessionResponseSerializer();
}

class _$DocumentUploadSessionResponseSerializer
    implements PrimitiveSerializer<DocumentUploadSessionResponse> {
  @override
  final Iterable<Type> types = const [
    DocumentUploadSessionResponse,
    _$DocumentUploadSessionResponse
  ];

  @override
  final String wireName = r'DocumentUploadSessionResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DocumentUploadSessionResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'resource_id';
    yield serializers.serialize(
      object.resourceId,
      specifiedType: const FullType(String),
    );
    yield r'attempt';
    yield serializers.serialize(
      object.attempt,
      specifiedType: const FullType(int),
    );
    yield r'part_size_bytes';
    yield serializers.serialize(
      object.partSizeBytes,
      specifiedType: const FullType(int),
    );
    yield r'part_count';
    yield serializers.serialize(
      object.partCount,
      specifiedType: const FullType(int),
    );
    yield r'max_concurrency';
    yield serializers.serialize(
      object.maxConcurrency,
      specifiedType: const FullType(int),
    );
    yield r'expires_at';
    yield serializers.serialize(
      object.expiresAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'parts';
    yield serializers.serialize(
      object.parts,
      specifiedType: const FullType(BuiltList, [FullType(UploadPartResponse)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DocumentUploadSessionResponse object, {
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
    required DocumentUploadSessionResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'resource_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.resourceId = valueDes;
          break;
        case r'attempt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.attempt = valueDes;
          break;
        case r'part_size_bytes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.partSizeBytes = valueDes;
          break;
        case r'part_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.partCount = valueDes;
          break;
        case r'max_concurrency':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.maxConcurrency = valueDes;
          break;
        case r'expires_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.expiresAt = valueDes;
          break;
        case r'parts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(UploadPartResponse)]),
          ) as BuiltList<UploadPartResponse>;
          result.parts.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DocumentUploadSessionResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DocumentUploadSessionResponseBuilder();
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
