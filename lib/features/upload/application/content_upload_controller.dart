import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/upload/data/content_upload_repository.dart';
import 'package:framegrab/features/upload/data/local_content_picker.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';

final class ContentUploadState {
  const ContentUploadState({
    this.failure,
    this.kind,
    this.phase = ContentUploadPhase.idle,
    this.progress = 0,
    this.result,
  });

  final ContentUploadFailureCode? failure;
  final ContentUploadKind? kind;
  final ContentUploadPhase phase;
  final int progress;
  final ContentUploadResult? result;

  bool get busy => switch (phase) {
    ContentUploadPhase.picking ||
    ContentUploadPhase.hashing ||
    ContentUploadPhase.creating ||
    ContentUploadPhase.uploading ||
    ContentUploadPhase.completing => true,
    _ => false,
  };

  ContentUploadState copyWith({
    ContentUploadFailureCode? failure,
    ContentUploadKind? kind,
    ContentUploadPhase? phase,
    int? progress,
    ContentUploadResult? result,
  }) => ContentUploadState(
    failure: failure,
    kind: kind ?? this.kind,
    phase: phase ?? this.phase,
    progress: progress ?? this.progress,
    result: result ?? this.result,
  );
}

final contentUploadControllerProvider =
    NotifierProvider<ContentUploadController, ContentUploadState>(
      ContentUploadController.new,
    );

final class ContentUploadController extends Notifier<ContentUploadState> {
  CancelToken? _cancelToken;

  @override
  ContentUploadState build() {
    ref.watch(authSessionProvider.select((session) => session.user?.id));
    ref.watch(contentUploadRepositoryProvider);
    ref.watch(localContentPickerProvider);
    ref.onDispose(() => _cancelToken?.cancel());
    return const ContentUploadState();
  }

  Future<void> start(ContentUploadKind kind) async {
    if (state.busy) return;
    state = ContentUploadState(kind: kind, phase: ContentUploadPhase.picking);
    try {
      final file = await ref.read(localContentPickerProvider).pick(kind);
      if (file == null) {
        state = const ContentUploadState();
        return;
      }
      final validation = validateContentFile(file, kind);
      if (validation != null) throw validation;
      final token = CancelToken();
      _cancelToken = token;
      final result = await ref
          .read(contentUploadRepositoryProvider)
          .upload(
            cancelToken: token,
            file: file,
            kind: kind,
            onPhase: (phase) =>
                state = state.copyWith(phase: phase, progress: 0),
            onProgress: (value) => state = state.copyWith(progress: value),
          );
      state = ContentUploadState(
        kind: kind,
        phase: ContentUploadPhase.succeeded,
        progress: 100,
        result: result,
      );
    } on ContentUploadFailure catch (error) {
      state = ContentUploadState(
        failure: error.code,
        kind: kind,
        phase: ContentUploadPhase.failed,
      );
    } on DioException catch (error) {
      if (CancelToken.isCancel(error)) {
        state = const ContentUploadState();
      } else {
        state = ContentUploadState(
          failure: ContentUploadFailureCode.uploadFailed,
          kind: kind,
          phase: ContentUploadPhase.failed,
        );
      }
    } catch (_) {
      state = ContentUploadState(
        failure: ContentUploadFailureCode.uploadFailed,
        kind: kind,
        phase: ContentUploadPhase.failed,
      );
    } finally {
      _cancelToken = null;
    }
  }

  void reset() {
    if (!state.busy) state = const ContentUploadState();
  }
}
