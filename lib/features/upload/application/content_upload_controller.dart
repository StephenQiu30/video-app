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
    ref.watch(
      authSessionProvider.select(
        (session) => (session.user?.id, session.isSignedIn),
      ),
    );
    ref.watch(contentUploadRepositoryProvider);
    ref.watch(localContentPickerProvider);
    ref.onDispose(() {
      _cancelToken?.cancel();
      _cancelToken = null;
    });
    return const ContentUploadState();
  }

  Future<void> start(ContentUploadKind kind) async {
    if (state.busy) return;
    final token = CancelToken();
    _cancelToken = token;
    final generation = ref.read(authSessionProvider.notifier).sessionGeneration;
    final picker = ref.read(localContentPickerProvider);
    final repository = ref.read(contentUploadRepositoryProvider);
    bool current() =>
        ref.mounted &&
        identical(_cancelToken, token) &&
        ref.read(authSessionProvider.notifier).sessionGeneration == generation;
    bool active() => current() && !token.isCancelled;
    state = ContentUploadState(kind: kind, phase: ContentUploadPhase.picking);
    try {
      final file = await picker.pick(kind);
      if (!active()) return;
      if (file == null) {
        state = const ContentUploadState();
        return;
      }
      final validation = validateContentFile(file, kind);
      if (validation != null) throw validation;
      final result = await repository.upload(
        cancelToken: token,
        file: file,
        kind: kind,
        onPhase: (phase) {
          if (active()) state = state.copyWith(phase: phase, progress: 0);
        },
        onProgress: (value) {
          if (active()) state = state.copyWith(progress: value);
        },
      );
      if (!active()) return;
      state = ContentUploadState(
        kind: kind,
        phase: ContentUploadPhase.succeeded,
        progress: 100,
        result: result,
      );
    } on ContentUploadFailure catch (error) {
      if (!current()) return;
      state = ContentUploadState(
        failure: error.code,
        kind: kind,
        phase: ContentUploadPhase.failed,
      );
    } on DioException catch (error) {
      if (!current()) return;
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
      if (!current()) return;
      state = ContentUploadState(
        failure: ContentUploadFailureCode.uploadFailed,
        kind: kind,
        phase: ContentUploadPhase.failed,
      );
    } finally {
      if (identical(_cancelToken, token)) _cancelToken = null;
    }
  }

  void cancel() {
    _cancelToken?.cancel('Upload cancelled by user');
    _cancelToken = null;
    state = const ContentUploadState();
  }

  void reset() {
    if (!state.busy) state = const ContentUploadState();
  }
}
