enum ContentUploadKind { video, screenplay }

enum ContentUploadPhase {
  idle,
  picking,
  hashing,
  creating,
  uploading,
  completing,
  succeeded,
  failed,
}

enum ContentUploadFailureCode {
  emptyFile,
  invalidVideo,
  invalidDocument,
  documentTooLarge,
  inaccessibleFile,
  invalidSession,
  uploadFailed,
}

final class LocalContentFile {
  const LocalContentFile({
    required this.name,
    required this.path,
    required this.size,
  });

  final String name;
  final String path;
  final int size;
}

final class ContentUploadResult {
  const ContentUploadResult({required this.kind, required this.resourceId});

  final ContentUploadKind kind;
  final String resourceId;
}

final class ContentUploadFailure implements Exception {
  const ContentUploadFailure(this.code);

  final ContentUploadFailureCode code;
}

ContentUploadFailure? validateContentFile(
  LocalContentFile file,
  ContentUploadKind kind,
) {
  if (file.size <= 0) {
    return const ContentUploadFailure(ContentUploadFailureCode.emptyFile);
  }
  final name = file.name.toLowerCase();
  if (kind == ContentUploadKind.video) {
    return name.endsWith('.mp4')
        ? null
        : const ContentUploadFailure(ContentUploadFailureCode.invalidVideo);
  }
  if (file.size > 50 * 1024 * 1024) {
    return const ContentUploadFailure(
      ContentUploadFailureCode.documentTooLarge,
    );
  }
  const extensions = ['.docx', '.pdf', '.txt', '.md', '.markdown', '.fountain'];
  return extensions.any(name.endsWith)
      ? null
      : const ContentUploadFailure(ContentUploadFailureCode.invalidDocument);
}
