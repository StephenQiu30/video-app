// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_stage.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DownloadStage _$revalidating = const DownloadStage._('revalidating');
const DownloadStage _$downloading = const DownloadStage._('downloading');
const DownloadStage _$remuxing = const DownloadStage._('remuxing');
const DownloadStage _$verifying = const DownloadStage._('verifying');
const DownloadStage _$uploading = const DownloadStage._('uploading');
const DownloadStage _$unknownDefaultOpenApi =
    const DownloadStage._('unknownDefaultOpenApi');

DownloadStage _$valueOf(String name) {
  switch (name) {
    case 'revalidating':
      return _$revalidating;
    case 'downloading':
      return _$downloading;
    case 'remuxing':
      return _$remuxing;
    case 'verifying':
      return _$verifying;
    case 'uploading':
      return _$uploading;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<DownloadStage> _$values =
    BuiltSet<DownloadStage>(const <DownloadStage>[
  _$revalidating,
  _$downloading,
  _$remuxing,
  _$verifying,
  _$uploading,
  _$unknownDefaultOpenApi,
]);

class _$DownloadStageMeta {
  const _$DownloadStageMeta();
  DownloadStage get revalidating => _$revalidating;
  DownloadStage get downloading => _$downloading;
  DownloadStage get remuxing => _$remuxing;
  DownloadStage get verifying => _$verifying;
  DownloadStage get uploading => _$uploading;
  DownloadStage get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  DownloadStage valueOf(String name) => _$valueOf(name);
  BuiltSet<DownloadStage> get values => _$values;
}

mixin _$DownloadStageMixin {
  // ignore: non_constant_identifier_names
  _$DownloadStageMeta get DownloadStage => const _$DownloadStageMeta();
}

Serializer<DownloadStage> _$downloadStageSerializer =
    _$DownloadStageSerializer();

class _$DownloadStageSerializer implements PrimitiveSerializer<DownloadStage> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'revalidating': 'revalidating',
    'downloading': 'downloading',
    'remuxing': 'remuxing',
    'verifying': 'verifying',
    'uploading': 'uploading',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'revalidating': 'revalidating',
    'downloading': 'downloading',
    'remuxing': 'remuxing',
    'verifying': 'verifying',
    'uploading': 'uploading',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[DownloadStage];
  @override
  final String wireName = 'DownloadStage';

  @override
  Object serialize(Serializers serializers, DownloadStage object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DownloadStage deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DownloadStage.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
