//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_status.g.dart';

class DownloadStatus extends EnumClass {
  @BuiltValueEnumConst(wireName: r'queued')
  static const DownloadStatus queued = _$queued;
  @BuiltValueEnumConst(wireName: r'running')
  static const DownloadStatus running = _$running;
  @BuiltValueEnumConst(wireName: r'retry_wait')
  static const DownloadStatus retryWait = _$retryWait;
  @BuiltValueEnumConst(wireName: r'succeeded')
  static const DownloadStatus succeeded = _$succeeded;
  @BuiltValueEnumConst(wireName: r'failed')
  static const DownloadStatus failed = _$failed;
  @BuiltValueEnumConst(wireName: r'cancelled')
  static const DownloadStatus cancelled = _$cancelled;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DownloadStatus unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<DownloadStatus> get serializer =>
      _$downloadStatusSerializer;

  const DownloadStatus._(String name) : super(name);

  static BuiltSet<DownloadStatus> get values => _$values;
  static DownloadStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DownloadStatusMixin = Object with _$DownloadStatusMixin;
