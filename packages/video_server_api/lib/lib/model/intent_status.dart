//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'intent_status.g.dart';

class IntentStatus extends EnumClass {
  @BuiltValueEnumConst(wireName: r'queued')
  static const IntentStatus queued = _$queued;
  @BuiltValueEnumConst(wireName: r'preparing')
  static const IntentStatus preparing = _$preparing;
  @BuiltValueEnumConst(wireName: r'resolving')
  static const IntentStatus resolving = _$resolving;
  @BuiltValueEnumConst(wireName: r'retry_wait')
  static const IntentStatus retryWait = _$retryWait;
  @BuiltValueEnumConst(wireName: r'action_required')
  static const IntentStatus actionRequired = _$actionRequired;
  @BuiltValueEnumConst(wireName: r'ready')
  static const IntentStatus ready = _$ready;
  @BuiltValueEnumConst(wireName: r'handed_off')
  static const IntentStatus handedOff = _$handedOff;
  @BuiltValueEnumConst(wireName: r'cancelled')
  static const IntentStatus cancelled = _$cancelled;
  @BuiltValueEnumConst(wireName: r'expired')
  static const IntentStatus expired = _$expired;
  @BuiltValueEnumConst(wireName: r'failed')
  static const IntentStatus failed = _$failed;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const IntentStatus unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<IntentStatus> get serializer => _$intentStatusSerializer;

  const IntentStatus._(String name) : super(name);

  static BuiltSet<IntentStatus> get values => _$values;
  static IntentStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class IntentStatusMixin = Object with _$IntentStatusMixin;
