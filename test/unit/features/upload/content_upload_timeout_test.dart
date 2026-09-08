import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/upload/application/content_upload_controller.dart';
import 'package:framegrab/features/upload/data/content_upload_repository.dart';
import 'package:framegrab/features/upload/data/local_content_picker.dart';
import 'package:framegrab/features/upload/data/multipart_uploader.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';

import '../../../support/upload_fakes.dart';
import '../../../support/upload_http_fixture.dart';

void main() {
  test(
    'an expired upload budget shows failure rather than user cancellation',
    () async {
      final fixture = await UploadHttpFixture.create();
      addTearDown(fixture.close);
      fixture.intercept = (request) async =>
          request.uri.path == fixture.createPath;
      final container = ProviderContainer(
        overrides: [
          contentUploadRepositoryProvider.overrideWithValue(
            GeneratedContentUploadRepository(
              fixture.request,
              MultipartUploader(),
              uploadTimeout: const Duration(milliseconds: 150),
            ),
          ),
          localContentPickerProvider.overrideWithValue(
            FakeLocalContentPicker(file: fixture.file),
          ),
        ],
      );
      addTearDown(container.dispose);
      await container
          .read(contentUploadControllerProvider.notifier)
          .start(ContentUploadKind.video);
      final state = container.read(contentUploadControllerProvider);
      expect(state.phase, ContentUploadPhase.failed);
      expect(state.failure, ContentUploadFailureCode.uploadFailed);
      expect(state.busy, isFalse);
      expect(state.result, isNull);
    },
  );
}
