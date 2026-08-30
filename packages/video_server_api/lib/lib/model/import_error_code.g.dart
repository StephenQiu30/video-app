// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_error_code.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ImportErrorCode _$importStorageUnavailable =
    const ImportErrorCode._('importStorageUnavailable');
const ImportErrorCode _$uploadSessionExpired =
    const ImportErrorCode._('uploadSessionExpired');
const ImportErrorCode _$uploadIncomplete =
    const ImportErrorCode._('uploadIncomplete');
const ImportErrorCode _$importSizeMismatch =
    const ImportErrorCode._('importSizeMismatch');
const ImportErrorCode _$importSha256Mismatch =
    const ImportErrorCode._('importSha256Mismatch');
const ImportErrorCode _$videoImportInvalid =
    const ImportErrorCode._('videoImportInvalid');
const ImportErrorCode _$documentFormatUnsupported =
    const ImportErrorCode._('documentFormatUnsupported');
const ImportErrorCode _$documentEncrypted =
    const ImportErrorCode._('documentEncrypted');
const ImportErrorCode _$documentArchiveUnsafe =
    const ImportErrorCode._('documentArchiveUnsafe');
const ImportErrorCode _$documentTextUnavailable =
    const ImportErrorCode._('documentTextUnavailable');
const ImportErrorCode _$documentStructureInvalid =
    const ImportErrorCode._('documentStructureInvalid');
const ImportErrorCode _$unknownDefaultOpenApi =
    const ImportErrorCode._('unknownDefaultOpenApi');

ImportErrorCode _$valueOf(String name) {
  switch (name) {
    case 'importStorageUnavailable':
      return _$importStorageUnavailable;
    case 'uploadSessionExpired':
      return _$uploadSessionExpired;
    case 'uploadIncomplete':
      return _$uploadIncomplete;
    case 'importSizeMismatch':
      return _$importSizeMismatch;
    case 'importSha256Mismatch':
      return _$importSha256Mismatch;
    case 'videoImportInvalid':
      return _$videoImportInvalid;
    case 'documentFormatUnsupported':
      return _$documentFormatUnsupported;
    case 'documentEncrypted':
      return _$documentEncrypted;
    case 'documentArchiveUnsafe':
      return _$documentArchiveUnsafe;
    case 'documentTextUnavailable':
      return _$documentTextUnavailable;
    case 'documentStructureInvalid':
      return _$documentStructureInvalid;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<ImportErrorCode> _$values =
    BuiltSet<ImportErrorCode>(const <ImportErrorCode>[
  _$importStorageUnavailable,
  _$uploadSessionExpired,
  _$uploadIncomplete,
  _$importSizeMismatch,
  _$importSha256Mismatch,
  _$videoImportInvalid,
  _$documentFormatUnsupported,
  _$documentEncrypted,
  _$documentArchiveUnsafe,
  _$documentTextUnavailable,
  _$documentStructureInvalid,
  _$unknownDefaultOpenApi,
]);

class _$ImportErrorCodeMeta {
  const _$ImportErrorCodeMeta();
  ImportErrorCode get importStorageUnavailable => _$importStorageUnavailable;
  ImportErrorCode get uploadSessionExpired => _$uploadSessionExpired;
  ImportErrorCode get uploadIncomplete => _$uploadIncomplete;
  ImportErrorCode get importSizeMismatch => _$importSizeMismatch;
  ImportErrorCode get importSha256Mismatch => _$importSha256Mismatch;
  ImportErrorCode get videoImportInvalid => _$videoImportInvalid;
  ImportErrorCode get documentFormatUnsupported => _$documentFormatUnsupported;
  ImportErrorCode get documentEncrypted => _$documentEncrypted;
  ImportErrorCode get documentArchiveUnsafe => _$documentArchiveUnsafe;
  ImportErrorCode get documentTextUnavailable => _$documentTextUnavailable;
  ImportErrorCode get documentStructureInvalid => _$documentStructureInvalid;
  ImportErrorCode get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  ImportErrorCode valueOf(String name) => _$valueOf(name);
  BuiltSet<ImportErrorCode> get values => _$values;
}

mixin _$ImportErrorCodeMixin {
  // ignore: non_constant_identifier_names
  _$ImportErrorCodeMeta get ImportErrorCode => const _$ImportErrorCodeMeta();
}

Serializer<ImportErrorCode> _$importErrorCodeSerializer =
    _$ImportErrorCodeSerializer();

class _$ImportErrorCodeSerializer
    implements PrimitiveSerializer<ImportErrorCode> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'importStorageUnavailable': 'import_storage_unavailable',
    'uploadSessionExpired': 'upload_session_expired',
    'uploadIncomplete': 'upload_incomplete',
    'importSizeMismatch': 'import_size_mismatch',
    'importSha256Mismatch': 'import_sha256_mismatch',
    'videoImportInvalid': 'video_import_invalid',
    'documentFormatUnsupported': 'document_format_unsupported',
    'documentEncrypted': 'document_encrypted',
    'documentArchiveUnsafe': 'document_archive_unsafe',
    'documentTextUnavailable': 'document_text_unavailable',
    'documentStructureInvalid': 'document_structure_invalid',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'import_storage_unavailable': 'importStorageUnavailable',
    'upload_session_expired': 'uploadSessionExpired',
    'upload_incomplete': 'uploadIncomplete',
    'import_size_mismatch': 'importSizeMismatch',
    'import_sha256_mismatch': 'importSha256Mismatch',
    'video_import_invalid': 'videoImportInvalid',
    'document_format_unsupported': 'documentFormatUnsupported',
    'document_encrypted': 'documentEncrypted',
    'document_archive_unsafe': 'documentArchiveUnsafe',
    'document_text_unavailable': 'documentTextUnavailable',
    'document_structure_invalid': 'documentStructureInvalid',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[ImportErrorCode];
  @override
  final String wireName = 'ImportErrorCode';

  @override
  Object serialize(Serializers serializers, ImportErrorCode object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ImportErrorCode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ImportErrorCode.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
