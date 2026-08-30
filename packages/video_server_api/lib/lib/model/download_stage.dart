//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_stage.g.dart';

class DownloadStage extends EnumClass {
  @BuiltValueEnumConst(wireName: r'revalidating')
  static const DownloadStage revalidating = _$revalidating;
  @BuiltValueEnumConst(wireName: r'downloading')
  static const DownloadStage downloading = _$downloading;
  @BuiltValueEnumConst(wireName: r'remuxing')
  static const DownloadStage remuxing = _$remuxing;
  @BuiltValueEnumConst(wireName: r'verifying')
  static const DownloadStage verifying = _$verifying;
  @BuiltValueEnumConst(wireName: r'uploading')
  static const DownloadStage uploading = _$uploading;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const DownloadStage unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<DownloadStage> get serializer => _$downloadStageSerializer;

  const DownloadStage._(String name) : super(name);

  static BuiltSet<DownloadStage> get values => _$values;
  static DownloadStage valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DownloadStageMixin = Object with _$DownloadStageMixin;
