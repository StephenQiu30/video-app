//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/dynamic_range.dart';
import 'package:video_server_api/lib/model/compatibility_profile.dart';
import 'package:video_server_api/lib/model/video_codec_family.dart';
import 'package:video_server_api/lib/model/container_preference.dart';
import 'package:video_server_api/lib/model/fps_bucket.dart';
import 'package:video_server_api/lib/model/audio_codec_family.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'semantic_plan_response.g.dart';

/// SemanticPlanResponse
///
/// Properties:
/// * [height]
/// * [width]
/// * [fpsBucket]
/// * [dynamicRange]
/// * [videoCodecFamily]
/// * [audioCodecFamily]
/// * [audioLanguage]
/// * [containerPreference]
/// * [compatibilityProfile]
@BuiltValue()
abstract class SemanticPlanResponse
    implements Built<SemanticPlanResponse, SemanticPlanResponseBuilder> {
  @BuiltValueField(wireName: r'height')
  int get height;

  @BuiltValueField(wireName: r'width')
  int get width;

  @BuiltValueField(wireName: r'fps_bucket')
  FpsBucket get fpsBucket;
  // enum fpsBucketEnum {  fps_30,  fps_60,  above_60,  };

  @BuiltValueField(wireName: r'dynamic_range')
  DynamicRange get dynamicRange;
  // enum dynamicRangeEnum {  sdr,  hdr,  };

  @BuiltValueField(wireName: r'video_codec_family')
  VideoCodecFamily get videoCodecFamily;
  // enum videoCodecFamilyEnum {  h264,  hevc,  vp9,  av1,  other,  };

  @BuiltValueField(wireName: r'audio_codec_family')
  AudioCodecFamily get audioCodecFamily;
  // enum audioCodecFamilyEnum {  aac,  opus,  vorbis,  other,  };

  @BuiltValueField(wireName: r'audio_language')
  String? get audioLanguage;

  @BuiltValueField(wireName: r'container_preference')
  ContainerPreference get containerPreference;
  // enum containerPreferenceEnum {  mp4,  webm,  source,  };

  @BuiltValueField(wireName: r'compatibility_profile')
  CompatibilityProfile get compatibilityProfile;
  // enum compatibilityProfileEnum {  balanced,  quality,  smallest,  };

  SemanticPlanResponse._();

  factory SemanticPlanResponse([void updates(SemanticPlanResponseBuilder b)]) =
      _$SemanticPlanResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SemanticPlanResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SemanticPlanResponse> get serializer =>
      _$SemanticPlanResponseSerializer();
}

class _$SemanticPlanResponseSerializer
    implements PrimitiveSerializer<SemanticPlanResponse> {
  @override
  final Iterable<Type> types = const [
    SemanticPlanResponse,
    _$SemanticPlanResponse
  ];

  @override
  final String wireName = r'SemanticPlanResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SemanticPlanResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'height';
    yield serializers.serialize(
      object.height,
      specifiedType: const FullType(int),
    );
    yield r'width';
    yield serializers.serialize(
      object.width,
      specifiedType: const FullType(int),
    );
    yield r'fps_bucket';
    yield serializers.serialize(
      object.fpsBucket,
      specifiedType: const FullType(FpsBucket),
    );
    yield r'dynamic_range';
    yield serializers.serialize(
      object.dynamicRange,
      specifiedType: const FullType(DynamicRange),
    );
    yield r'video_codec_family';
    yield serializers.serialize(
      object.videoCodecFamily,
      specifiedType: const FullType(VideoCodecFamily),
    );
    yield r'audio_codec_family';
    yield serializers.serialize(
      object.audioCodecFamily,
      specifiedType: const FullType(AudioCodecFamily),
    );
    yield r'audio_language';
    yield object.audioLanguage == null
        ? null
        : serializers.serialize(
            object.audioLanguage,
            specifiedType: const FullType.nullable(String),
          );
    yield r'container_preference';
    yield serializers.serialize(
      object.containerPreference,
      specifiedType: const FullType(ContainerPreference),
    );
    yield r'compatibility_profile';
    yield serializers.serialize(
      object.compatibilityProfile,
      specifiedType: const FullType(CompatibilityProfile),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SemanticPlanResponse object, {
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
    required SemanticPlanResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'height':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.height = valueDes;
          break;
        case r'width':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.width = valueDes;
          break;
        case r'fps_bucket':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FpsBucket),
          ) as FpsBucket;
          result.fpsBucket = valueDes;
          break;
        case r'dynamic_range':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DynamicRange),
          ) as DynamicRange;
          result.dynamicRange = valueDes;
          break;
        case r'video_codec_family':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VideoCodecFamily),
          ) as VideoCodecFamily;
          result.videoCodecFamily = valueDes;
          break;
        case r'audio_codec_family':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AudioCodecFamily),
          ) as AudioCodecFamily;
          result.audioCodecFamily = valueDes;
          break;
        case r'audio_language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.audioLanguage = valueDes;
          break;
        case r'container_preference':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ContainerPreference),
          ) as ContainerPreference;
          result.containerPreference = valueDes;
          break;
        case r'compatibility_profile':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CompatibilityProfile),
          ) as CompatibilityProfile;
          result.compatibilityProfile = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SemanticPlanResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SemanticPlanResponseBuilder();
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
