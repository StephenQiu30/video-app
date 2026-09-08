import 'dart:async';

import 'package:dio/dio.dart';
import 'package:framegrab/features/upload/data/content_upload_repository.dart';
import 'package:framegrab/features/upload/data/local_content_picker.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';

const uploadTestFile = LocalContentFile(
  name: 'clip.mp4',
  path: '/fixture/clip.mp4',
  size: 4,
);

final class DeferredContentPicker implements LocalContentPicker {
  final result = Completer<LocalContentFile?>();

  @override
  Future<LocalContentFile?> pick(ContentUploadKind kind) => result.future;
}

final class DeferredContentUploadRepository implements ContentUploadRepository {
  final operations = <DeferredUpload>[];

  @override
  Future<ContentUploadResult> upload({
    required CancelToken cancelToken,
    required LocalContentFile file,
    required ContentUploadKind kind,
    required void Function(ContentUploadPhase) onPhase,
    required void Function(int) onProgress,
  }) {
    final operation = DeferredUpload(cancelToken, onPhase, onProgress);
    operations.add(operation);
    onPhase(ContentUploadPhase.uploading);
    return operation.result.future;
  }
}

final class DeferredUpload {
  DeferredUpload(this.token, this.onPhase, this.onProgress);

  final CancelToken token;
  final void Function(ContentUploadPhase) onPhase;
  final void Function(int) onProgress;
  final result = Completer<ContentUploadResult>();

  void succeed() => result.complete(
    const ContentUploadResult(
      kind: ContentUploadKind.video,
      resourceId: 'uploaded-video',
    ),
  );
}
