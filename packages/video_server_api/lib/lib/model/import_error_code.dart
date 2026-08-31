//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_element_parameter
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'import_error_code.g.dart';

class ImportErrorCode extends EnumClass {
  @BuiltValueEnumConst(wireName: r'import_storage_unavailable')
  static const ImportErrorCode importStorageUnavailable =
      _$importStorageUnavailable;
  @BuiltValueEnumConst(wireName: r'upload_session_expired')
  static const ImportErrorCode uploadSessionExpired = _$uploadSessionExpired;
  @BuiltValueEnumConst(wireName: r'upload_incomplete')
  static const ImportErrorCode uploadIncomplete = _$uploadIncomplete;
  @BuiltValueEnumConst(wireName: r'import_size_mismatch')
  static const ImportErrorCode importSizeMismatch = _$importSizeMismatch;
  @BuiltValueEnumConst(wireName: r'import_sha256_mismatch')
  static const ImportErrorCode importSha256Mismatch = _$importSha256Mismatch;
  @BuiltValueEnumConst(wireName: r'video_import_invalid')
  static const ImportErrorCode videoImportInvalid = _$videoImportInvalid;
  @BuiltValueEnumConst(wireName: r'document_format_unsupported')
  static const ImportErrorCode documentFormatUnsupported =
      _$documentFormatUnsupported;
  @BuiltValueEnumConst(wireName: r'document_encrypted')
  static const ImportErrorCode documentEncrypted = _$documentEncrypted;
  @BuiltValueEnumConst(wireName: r'document_archive_unsafe')
  static const ImportErrorCode documentArchiveUnsafe = _$documentArchiveUnsafe;
  @BuiltValueEnumConst(wireName: r'document_text_unavailable')
  static const ImportErrorCode documentTextUnavailable =
      _$documentTextUnavailable;
  @BuiltValueEnumConst(wireName: r'document_structure_invalid')
  static const ImportErrorCode documentStructureInvalid =
      _$documentStructureInvalid;
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const ImportErrorCode unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<ImportErrorCode> get serializer =>
      _$importErrorCodeSerializer;

  const ImportErrorCode._(String name) : super(name);

  static BuiltSet<ImportErrorCode> get values => _$values;
  static ImportErrorCode valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ImportErrorCodeMixin = Object with _$ImportErrorCodeMixin;
