import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/download/data/download_intent_repository.dart';
import 'package:video_server_api/video_server_api.dart';

final class DownloadIntentHistoryState {
  const DownloadIntentHistoryState({
    this.error,
    this.items = const [],
    this.loaded = false,
    this.loading = false,
    this.nextCursor,
  });

  final Object? error;
  final List<IntentHistoryItemResponse> items;
  final bool loaded;
  final bool loading;
  final String? nextCursor;

  bool get hasMore => nextCursor != null;
}

final downloadIntentHistoryProvider =
    NotifierProvider<
      DownloadIntentHistoryController,
      DownloadIntentHistoryState
    >(DownloadIntentHistoryController.new);

final class DownloadIntentHistoryController
    extends Notifier<DownloadIntentHistoryState> {
  String? _owner;
  int _generation = 0;

  @override
  DownloadIntentHistoryState build() {
    _owner = ref.read(authSessionProvider).user?.id;
    ref.listen(authSessionProvider.select((session) => session.user?.id), (
      previous,
      next,
    ) {
      if (previous == next) return;
      _generation++;
      _owner = next;
      state = const DownloadIntentHistoryState();
      if (next != null) unawaited(load());
    });
    return const DownloadIntentHistoryState();
  }

  Future<void> load({bool more = false}) async {
    final owner = _owner;
    if (owner == null || state.loading || (more && !state.hasMore)) return;
    final generation = _generation;
    final before = more ? state.nextCursor : null;
    state = DownloadIntentHistoryState(
      items: state.items,
      loaded: state.loaded,
      loading: true,
      nextCursor: state.nextCursor,
    );
    try {
      final page = await ref
          .read(downloadIntentRepositoryProvider)
          .history(before: before);
      if (!ref.mounted || generation != _generation || owner != _owner) return;
      final items = more
          ? [
              ...state.items,
              ...page.items.where(
                (item) => !state.items.any((current) => current.id == item.id),
              ),
            ]
          : page.items.toList();
      state = DownloadIntentHistoryState(
        items: List.unmodifiable(items),
        loaded: true,
        nextCursor: page.nextCursor,
      );
    } catch (error) {
      if (ref.mounted && generation == _generation && owner == _owner) {
        state = DownloadIntentHistoryState(
          error: error,
          items: state.items,
          loaded: state.loaded,
          nextCursor: state.nextCursor,
        );
      }
    }
  }
}
