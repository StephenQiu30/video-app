import 'dart:developer' as developer;

import 'package:file_selector/file_selector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';

typedef LocalFileOpener =
    Future<XFile?> Function(List<XTypeGroup> acceptedTypeGroups);

final localContentPickerProvider = Provider<LocalContentPicker>(
  (_) => const SystemLocalContentPicker(),
);

abstract interface class LocalContentPicker {
  Future<LocalContentFile?> pick(ContentUploadKind kind);
}

final class SystemLocalContentPicker implements LocalContentPicker {
  const SystemLocalContentPicker({this.fileOpener = _openLocalFile});

  final LocalFileOpener fileOpener;

  @override
  Future<LocalContentFile?> pick(ContentUploadKind kind) async {
    final XFile? picked;
    try {
      picked = await fileOpener([contentUploadTypeGroup(kind)]);
    } catch (error) {
      _logPickerFailure('open', error);
      throw const ContentUploadFailure(
        ContentUploadFailureCode.fileSelectionFailed,
      );
    }
    if (picked == null) return null;
    final path = picked.path;
    if (path.isEmpty) {
      throw const ContentUploadFailure(
        ContentUploadFailureCode.inaccessibleFile,
      );
    }
    final int size;
    try {
      size = await picked.length();
    } catch (error) {
      _logPickerFailure('read', error);
      throw const ContentUploadFailure(
        ContentUploadFailureCode.inaccessibleFile,
      );
    }
    return LocalContentFile(name: picked.name, path: path, size: size);
  }
}

XTypeGroup contentUploadTypeGroup(ContentUploadKind kind) => switch (kind) {
  ContentUploadKind.video => const XTypeGroup(
    label: 'MP4 video',
    extensions: ['mp4'],
    mimeTypes: ['video/mp4'],
    uniformTypeIdentifiers: ['public.mpeg-4'],
  ),
  ContentUploadKind.screenplay => const XTypeGroup(
    label: 'Screenplay',
    extensions: ['docx', 'pdf', 'txt', 'md', 'markdown', 'fountain'],
    mimeTypes: [
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'application/pdf',
      'text/plain',
      'text/markdown',
    ],
    uniformTypeIdentifiers: [
      'org.openxmlformats.wordprocessingml.document',
      'com.adobe.pdf',
      'public.plain-text',
      'net.daringfireball.markdown',
      'com.stephenqiu.framegrab.fountain',
    ],
  ),
};

Future<XFile?> _openLocalFile(List<XTypeGroup> acceptedTypeGroups) =>
    openFile(acceptedTypeGroups: acceptedTypeGroups);

void _logPickerFailure(String operation, Object error) {
  developer.log(
    'System file picker $operation failed',
    name: 'framegrab.upload',
    error: error.runtimeType,
  );
}
