//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:video_server_api/lib/model/identity_state.dart';
import 'package:built_collection/built_collection.dart';
import 'package:video_server_api/lib/model/format_response.dart';
import 'package:video_server_api/lib/model/rights_basis.dart';
import 'package:video_server_api/lib/model/protection_state.dart';
import 'package:video_server_api/lib/model/access_decision.dart';
import 'package:video_server_api/lib/model/entitlement_state.dart';
import 'package:video_server_api/lib/model/execution_mode.dart';
import 'package:video_server_api/lib/model/source_origin.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'inspection_response.g.dart';

/// Inspection resource with normalized semantic download formats.
///
/// Properties:
/// * [id]
/// * [extractorKey]
/// * [providerMediaId]
/// * [title]
/// * [durationSeconds]
/// * [thumbnailUrl]
/// * [expiresAt]
/// * [formats]
/// * [sourceOrigin]
/// * [executionMode]
/// * [accessDecision]
/// * [entitlementState]
/// * [identityState]
/// * [protectionState]
/// * [rightsBasis]
/// * [restrictionReason]
/// * [userAction]
@BuiltValue()
abstract class InspectionResponse
    implements Built<InspectionResponse, InspectionResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'extractor_key')
  String get extractorKey;

  @BuiltValueField(wireName: r'provider_media_id')
  String get providerMediaId;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'duration_seconds')
  int get durationSeconds;

  @BuiltValueField(wireName: r'thumbnail_url')
  String? get thumbnailUrl;

  @BuiltValueField(wireName: r'expires_at')
  DateTime get expiresAt;

  @BuiltValueField(wireName: r'formats')
  BuiltList<FormatResponse> get formats;

  @BuiltValueField(wireName: r'source_origin')
  SourceOrigin get sourceOrigin;
  // enum sourceOriginEnum {  public_url,  discovered_item,  official_asset,  verified_import,  };

  @BuiltValueField(wireName: r'execution_mode')
  ExecutionMode get executionMode;
  // enum executionModeEnum {  provider_runner,  article_native,  official_connector,  verified_import,  };

  @BuiltValueField(wireName: r'access_decision')
  AccessDecision get accessDecision;
  // enum accessDecisionEnum {  downloadable,  playback_only,  export_required,  blocked,  unsupported,  };

  @BuiltValueField(wireName: r'entitlement_state')
  EntitlementState get entitlementState;
  // enum entitlementStateEnum {  public_free,  official_download_grant,  restricted,  unknown,  };

  @BuiltValueField(wireName: r'identity_state')
  IdentityState get identityState;
  // enum identityStateEnum {  verified,  ambiguous,  unknown,  };

  @BuiltValueField(wireName: r'protection_state')
  ProtectionState get protectionState;
  // enum protectionStateEnum {  clear,  encrypted,  drm,  unknown,  };

  @BuiltValueField(wireName: r'rights_basis')
  RightsBasis? get rightsBasis;
  // enum rightsBasisEnum {  public_access,  owner_authorized_export,  official_asset_grant,  user_provided,  };

  @BuiltValueField(wireName: r'restriction_reason')
  String? get restrictionReason;

  @BuiltValueField(wireName: r'user_action')
  String? get userAction;

  InspectionResponse._();

  factory InspectionResponse([void updates(InspectionResponseBuilder b)]) =
      _$InspectionResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InspectionResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InspectionResponse> get serializer =>
      _$InspectionResponseSerializer();
}

class _$InspectionResponseSerializer
    implements PrimitiveSerializer<InspectionResponse> {
  @override
  final Iterable<Type> types = const [InspectionResponse, _$InspectionResponse];

  @override
  final String wireName = r'InspectionResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InspectionResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'extractor_key';
    yield serializers.serialize(
      object.extractorKey,
      specifiedType: const FullType(String),
    );
    yield r'provider_media_id';
    yield serializers.serialize(
      object.providerMediaId,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'duration_seconds';
    yield serializers.serialize(
      object.durationSeconds,
      specifiedType: const FullType(int),
    );
    yield r'thumbnail_url';
    yield object.thumbnailUrl == null
        ? null
        : serializers.serialize(
            object.thumbnailUrl,
            specifiedType: const FullType.nullable(String),
          );
    yield r'expires_at';
    yield serializers.serialize(
      object.expiresAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'formats';
    yield serializers.serialize(
      object.formats,
      specifiedType: const FullType(BuiltList, [FullType(FormatResponse)]),
    );
    yield r'source_origin';
    yield serializers.serialize(
      object.sourceOrigin,
      specifiedType: const FullType(SourceOrigin),
    );
    yield r'execution_mode';
    yield serializers.serialize(
      object.executionMode,
      specifiedType: const FullType(ExecutionMode),
    );
    yield r'access_decision';
    yield serializers.serialize(
      object.accessDecision,
      specifiedType: const FullType(AccessDecision),
    );
    yield r'entitlement_state';
    yield serializers.serialize(
      object.entitlementState,
      specifiedType: const FullType(EntitlementState),
    );
    yield r'identity_state';
    yield serializers.serialize(
      object.identityState,
      specifiedType: const FullType(IdentityState),
    );
    yield r'protection_state';
    yield serializers.serialize(
      object.protectionState,
      specifiedType: const FullType(ProtectionState),
    );
    yield r'rights_basis';
    yield object.rightsBasis == null
        ? null
        : serializers.serialize(
            object.rightsBasis,
            specifiedType: const FullType.nullable(RightsBasis),
          );
    yield r'restriction_reason';
    yield object.restrictionReason == null
        ? null
        : serializers.serialize(
            object.restrictionReason,
            specifiedType: const FullType.nullable(String),
          );
    yield r'user_action';
    yield object.userAction == null
        ? null
        : serializers.serialize(
            object.userAction,
            specifiedType: const FullType.nullable(String),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    InspectionResponse object, {
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
    required InspectionResponseBuilder result,
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
        case r'extractor_key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.extractorKey = valueDes;
          break;
        case r'provider_media_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.providerMediaId = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'duration_seconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.durationSeconds = valueDes;
          break;
        case r'thumbnail_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.thumbnailUrl = valueDes;
          break;
        case r'expires_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.expiresAt = valueDes;
          break;
        case r'formats':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(FormatResponse)]),
          ) as BuiltList<FormatResponse>;
          result.formats.replace(valueDes);
          break;
        case r'source_origin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SourceOrigin),
          ) as SourceOrigin;
          result.sourceOrigin = valueDes;
          break;
        case r'execution_mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ExecutionMode),
          ) as ExecutionMode;
          result.executionMode = valueDes;
          break;
        case r'access_decision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AccessDecision),
          ) as AccessDecision;
          result.accessDecision = valueDes;
          break;
        case r'entitlement_state':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EntitlementState),
          ) as EntitlementState;
          result.entitlementState = valueDes;
          break;
        case r'identity_state':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(IdentityState),
          ) as IdentityState;
          result.identityState = valueDes;
          break;
        case r'protection_state':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ProtectionState),
          ) as ProtectionState;
          result.protectionState = valueDes;
          break;
        case r'rights_basis':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(RightsBasis),
          ) as RightsBasis?;
          if (valueDes == null) continue;
          result.rightsBasis = valueDes;
          break;
        case r'restriction_reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.restrictionReason = valueDes;
          break;
        case r'user_action':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userAction = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InspectionResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InspectionResponseBuilder();
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
