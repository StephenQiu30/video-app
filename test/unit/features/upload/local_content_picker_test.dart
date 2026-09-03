import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/upload/data/local_content_picker.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';

void main() {
  test('provides platform filters for MP4 selection', () {
    final group = contentUploadTypeGroup(ContentUploadKind.video);

    expect(group.extensions, ['mp4']);
    expect(group.mimeTypes, ['video/mp4']);
    expect(group.uniformTypeIdentifiers, ['public.mpeg-4']);
  });

  test('provides iOS UTIs for every supported screenplay family', () {
    final group = contentUploadTypeGroup(ContentUploadKind.screenplay);

    expect(group.extensions, [
      'docx',
      'pdf',
      'txt',
      'md',
      'markdown',
      'fountain',
    ]);
    expect(group.mimeTypes, [
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'application/pdf',
      'text/plain',
      'text/markdown',
    ]);
    expect(group.uniformTypeIdentifiers, [
      'org.openxmlformats.wordprocessingml.document',
      'com.adobe.pdf',
      'public.plain-text',
      'net.daringfireball.markdown',
      'com.stephenqiu.framegrab.fountain',
    ]);
  });

  test('passes the complete platform filter to the system picker', () async {
    List<XTypeGroup>? observedGroups;
    final picker = SystemLocalContentPicker(
      fileOpener: (groups) async {
        observedGroups = groups;
        return null;
      },
    );

    expect(await picker.pick(ContentUploadKind.screenplay), isNull);
    expect(observedGroups, hasLength(1));
    expect(
      observedGroups!.single.uniformTypeIdentifiers,
      contains('com.stephenqiu.framegrab.fountain'),
    );
  });

  test('reports picker failures separately from upload failures', () async {
    final picker = SystemLocalContentPicker(
      fileOpener: (_) async => throw ArgumentError('unsupported type group'),
    );

    await expectLater(
      picker.pick(ContentUploadKind.screenplay),
      throwsA(
        isA<ContentUploadFailure>().having(
          (failure) => failure.code,
          'code',
          ContentUploadFailureCode.fileSelectionFailed,
        ),
      ),
    );
  });

  test('returns readable metadata for a selected screenplay', () async {
    final directory = await Directory.systemTemp.createTemp(
      'framegrab-picker-test',
    );
    addTearDown(() => directory.delete(recursive: true));
    final file = File('${directory.path}/scene.fountain');
    await file.writeAsString('INT. TEST ROOM - DAY\n\nA file can be read.\n');
    final picker = SystemLocalContentPicker(
      fileOpener: (_) async => XFile(file.path),
    );

    final selected = await picker.pick(ContentUploadKind.screenplay);

    expect(selected?.name, 'scene.fountain');
    expect(selected?.path, file.path);
    expect(selected?.size, await file.length());
  });

  test('reports an inaccessible selected file accurately', () async {
    final picker = SystemLocalContentPicker(
      fileOpener: (_) async => XFile('/missing/scene.fountain'),
    );

    await expectLater(
      picker.pick(ContentUploadKind.screenplay),
      throwsA(
        isA<ContentUploadFailure>().having(
          (failure) => failure.code,
          'code',
          ContentUploadFailureCode.inaccessibleFile,
        ),
      ),
    );
  });
}
