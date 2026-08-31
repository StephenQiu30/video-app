import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';

void main() {
  test('accepts MP4 and the documented screenplay extensions', () {
    const video = LocalContentFile(name: 'clip.MP4', path: '/clip', size: 8);
    expect(validateContentFile(video, ContentUploadKind.video), isNull);

    for (final name in [
      'draft.docx',
      'draft.pdf',
      'draft.txt',
      'draft.md',
      'draft.markdown',
      'draft.fountain',
    ]) {
      final file = LocalContentFile(name: name, path: '/$name', size: 8);
      expect(validateContentFile(file, ContentUploadKind.screenplay), isNull);
    }
  });

  test('rejects unsupported or oversized uploads', () {
    const webm = LocalContentFile(name: 'clip.webm', path: '/clip', size: 8);
    expect(
      validateContentFile(webm, ContentUploadKind.video)?.code,
      ContentUploadFailureCode.invalidVideo,
    );
    const archive = LocalContentFile(
      name: 'draft.zip',
      path: '/draft',
      size: 8,
    );
    expect(
      validateContentFile(archive, ContentUploadKind.screenplay)?.code,
      ContentUploadFailureCode.invalidDocument,
    );
    const large = LocalContentFile(
      name: 'draft.pdf',
      path: '/draft',
      size: 50 * 1024 * 1024 + 1,
    );
    expect(
      validateContentFile(large, ContentUploadKind.screenplay)?.code,
      ContentUploadFailureCode.documentTooLarge,
    );
  });
}
