import 'package:dio/dio.dart';
import 'package:framegrab/features/upload/data/content_upload_repository.dart';
import 'package:framegrab/features/upload/data/local_content_picker.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';

final class FakeLocalContentPicker implements LocalContentPicker {
  FakeLocalContentPicker({this.error, this.file});

  Object? error;
  LocalContentFile? file;
  final List<ContentUploadKind> requestedKinds = [];

  @override
  Future<LocalContentFile?> pick(ContentUploadKind kind) async {
    requestedKinds.add(kind);
    if (error case final failure?) throw failure;
    return file;
  }
}

final class FakeContentUploadRepository implements ContentUploadRepository {
  FakeContentUploadRepository({this.error});

  Object? error;
  final List<ContentUploadKind> uploadedKinds = [];

  @override
  Future<ContentUploadResult> upload({
    required CancelToken cancelToken,
    required LocalContentFile file,
    required ContentUploadKind kind,
    required void Function(ContentUploadPhase) onPhase,
    required void Function(int) onProgress,
  }) async {
    uploadedKinds.add(kind);
    if (error case final failure?) throw failure;
    onPhase(ContentUploadPhase.hashing);
    onProgress(100);
    onPhase(ContentUploadPhase.uploading);
    onProgress(100);
    onPhase(ContentUploadPhase.completing);
    return ContentUploadResult(
      kind: kind,
      resourceId: kind == ContentUploadKind.video
          ? '00000000-0000-0000-0000-000000000321'
          : '00000000-0000-0000-0000-000000000501',
    );
  }
}
