import 'package:file_selector/file_selector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';

final localContentPickerProvider = Provider<LocalContentPicker>(
  (_) => const SystemLocalContentPicker(),
);

abstract interface class LocalContentPicker {
  Future<LocalContentFile?> pick(ContentUploadKind kind);
}

final class SystemLocalContentPicker implements LocalContentPicker {
  const SystemLocalContentPicker();

  @override
  Future<LocalContentFile?> pick(ContentUploadKind kind) async {
    final group = XTypeGroup(
      label: kind == ContentUploadKind.video ? 'MP4 video' : 'Screenplay',
      extensions: kind == ContentUploadKind.video
          ? const ['mp4']
          : const ['docx', 'pdf', 'txt', 'md', 'markdown', 'fountain'],
    );
    final picked = await openFile(acceptedTypeGroups: [group]);
    if (picked == null) return null;
    final path = picked.path;
    if (path.isEmpty) {
      throw const ContentUploadFailure(
        ContentUploadFailureCode.inaccessibleFile,
      );
    }
    return LocalContentFile(
      name: picked.name,
      path: path,
      size: await picked.length(),
    );
  }
}
