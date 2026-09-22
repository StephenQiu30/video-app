import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/download/application/public_input.dart';
import 'package:framegrab/features/download/data/download_intake_repository.dart';
import 'package:framegrab/features/download/data/download_intent_repository.dart';
import 'package:video_server_api/video_server_api.dart';

enum DownloadIntakePhase { idle, inspecting, selecting, creating }

final class DownloadIntakeState {
  const DownloadIntakeState({
    this.discovery,
    this.error,
    this.inspection,
    this.intent,
    this.phase = DownloadIntakePhase.idle,
    this.selectedFormatId,
  });

  final SourceDiscoveryResponse? discovery;
  final Object? error;
  final InspectionResponse? inspection;
  final IntentResponse? intent;
  final DownloadIntakePhase phase;
  final String? selectedFormatId;

  bool get busy => phase != DownloadIntakePhase.idle;

  DownloadIntakeState copyWith({
    SourceDiscoveryResponse? discovery,
    bool clearDiscovery = false,
    Object? error,
    bool clearError = false,
    InspectionResponse? inspection,
    IntentResponse? intent,
    bool clearIntent = false,
    bool clearInspection = false,
    DownloadIntakePhase? phase,
    String? selectedFormatId,
    bool clearSelectedFormat = false,
  }) => DownloadIntakeState(
    discovery: clearDiscovery ? null : discovery ?? this.discovery,
    error: clearError ? null : error ?? this.error,
    inspection: clearInspection ? null : inspection ?? this.inspection,
    intent: clearIntent ? null : intent ?? this.intent,
    phase: phase ?? this.phase,
    selectedFormatId: clearSelectedFormat
        ? null
        : selectedFormatId ?? this.selectedFormatId,
  );
}

final downloadIntakeControllerProvider =
    NotifierProvider<DownloadIntakeController, DownloadIntakeState>(
      DownloadIntakeController.new,
    );

final class DownloadIntakeController extends Notifier<DownloadIntakeState> {
  final _keys = _StableKeys();
  Timer? _pollTimer;
  int? _pollingGeneration;
  bool _foreground = true;
  int _generation = 0;
  String? _owner;
  String? _uncertainKey;

  DownloadIntakeRepository get _repository =>
      ref.read(downloadIntakeRepositoryProvider);
  DownloadIntentRepository get _intents =>
      ref.read(downloadIntentRepositoryProvider);

  @override
  DownloadIntakeState build() {
    final owner = ref.read(
      authSessionProvider.select((session) => session.user?.id),
    );
    ref.listen(authSessionProvider.select((session) => session.user?.id), (
      previous,
      next,
    ) {
      if (previous == next) return;
      _generation++;
      _pollTimer?.cancel();
      _keys.clear();
      _uncertainKey = null;
      _owner = next;
      state = const DownloadIntakeState();
    });
    ref.watch(downloadIntakeRepositoryProvider);
    ref.watch(downloadIntentRepositoryProvider);
    _pollTimer?.cancel();
    _generation++;
    if (_owner != owner) _keys.clear();
    if (_owner != owner) _uncertainKey = null;
    _owner = owner;
    ref.onDispose(() => _pollTimer?.cancel());
    return const DownloadIntakeState();
  }

  void clearResult() {
    if (state.busy) return;
    _generation++;
    _pollTimer?.cancel();
    _keys.forget('intent');
    _uncertainKey = null;
    state = const DownloadIntakeState();
  }

  void selectFormat(String id) {
    if (state.busy ||
        !(state.inspection?.formats.any((format) => format.id == id) ??
            false)) {
      return;
    }
    state = state.copyWith(selectedFormatId: id, clearError: true);
  }

  Future<void> resume(String id) async {
    if (state.busy || _owner == null) return;
    final generation = ++_generation;
    final previous = state.intent;
    _pollTimer?.cancel();
    state = DownloadIntakeState(
      intent: previous?.id == id ? previous : null,
      phase: DownloadIntakePhase.inspecting,
    );
    try {
      final intent = await _intents.get(id);
      if (generation == _generation) await _adopt(intent, generation);
    } catch (error) {
      if (generation == _generation) {
        state = state.copyWith(error: error, phase: DownloadIntakePhase.idle);
      }
    }
  }

  Future<void> refreshIntent() async {
    final current = state.intent;
    if (state.busy || current == null || current.status != IntentStatus.ready) {
      return;
    }
    final generation = ++_generation;
    final previousInspection = state.inspection;
    _pollTimer?.cancel();
    state = state.copyWith(
      phase: DownloadIntakePhase.inspecting,
      clearInspection: true,
      clearSelectedFormat: true,
      clearError: true,
    );
    try {
      final refreshed = await _intents.refresh(current.id);
      if (generation == _generation) await _adopt(refreshed, generation);
    } catch (error) {
      if (generation != _generation) return;
      if (error is DataRequestFailure &&
          error.statusCode != null &&
          error.statusCode! >= 400 &&
          error.statusCode! < 500) {
        state = state.copyWith(
          error: error,
          inspection: previousInspection,
          phase: DownloadIntakePhase.idle,
        );
        return;
      }
      // The server may have accepted an update before the response was lost.
      try {
        final snapshot = await _intents.get(current.id);
        if (generation != _generation) return;
        if (snapshot.version > current.version ||
            snapshot.status != current.status ||
            snapshot.inspectionId != current.inspectionId) {
          await _adopt(snapshot, generation);
        } else {
          state = state.copyWith(
            error: error,
            inspection: previousInspection,
            phase: DownloadIntakePhase.idle,
          );
        }
      } catch (_) {
        if (generation == _generation) {
          state = state.copyWith(
            error: error,
            inspection: previousInspection,
            phase: DownloadIntakePhase.idle,
          );
        }
      }
    }
  }

  Future<void> cancelIntent() async {
    final current = state.intent;
    if (state.busy || current == null) return;
    final generation = ++_generation;
    _pollTimer?.cancel();
    state = state.copyWith(
      phase: DownloadIntakePhase.inspecting,
      clearError: true,
    );
    try {
      final cancelled = await _intents.cancel(current.id);
      if (generation == _generation) await _adopt(cancelled, generation);
    } catch (error) {
      if (generation != _generation) return;
      try {
        final snapshot = await _intents.get(current.id);
        if (generation != _generation) return;
        await _adopt(snapshot, generation);
        if (snapshot.status != IntentStatus.cancelled) {
          state = state.copyWith(error: error);
        }
      } catch (_) {
        if (generation != _generation) return;
        state = state.copyWith(error: error, phase: DownloadIntakePhase.idle);
        _schedulePoll(current);
      }
    }
  }

  void setForeground(bool foreground) {
    _foreground = foreground;
    if (!foreground) {
      _pollTimer?.cancel();
    } else {
      unawaited(pollIntent());
    }
  }

  Future<void> pollIntent() async {
    final current = state.intent;
    if (!_foreground || state.busy || current == null) return;
    final generation = _generation;
    if (_pollingGeneration == generation) return;
    _pollingGeneration = generation;
    try {
      final updated = await _intents.get(current.id);
      if (generation == _generation) await _adopt(updated, generation);
    } catch (error) {
      if (generation == _generation) state = state.copyWith(error: error);
    } finally {
      if (_pollingGeneration == generation) _pollingGeneration = null;
    }
  }

  Future<void> _adopt(IntentResponse next, int generation) async {
    if (generation != _generation) return;
    final current = state.intent;
    if (current != null &&
        current.id == next.id &&
        current.version > next.version) {
      return;
    }
    state = state.copyWith(
      intent: next,
      phase: DownloadIntakePhase.idle,
      clearInspection: true,
      clearSelectedFormat: true,
      clearError: true,
    );
    if (next.status == IntentStatus.ready && next.inspectionId != null) {
      try {
        final result = await _intents.inspection(next.inspectionId!);
        if (generation != _generation || state.intent?.id != next.id) return;
        state = state.copyWith(
          inspection: result,
          selectedFormatId: result.expiresAt.isAfter(DateTime.now())
              ? result.formats.firstOrNull?.id
              : null,
        );
      } catch (error) {
        if (generation == _generation) state = state.copyWith(error: error);
      }
    }
    _schedulePoll(next);
  }

  void _schedulePoll(IntentResponse intent) {
    if (_foreground &&
        (intent.status == IntentStatus.queued ||
            intent.status == IntentStatus.preparing ||
            intent.status == IntentStatus.resolving ||
            intent.status == IntentStatus.retryWait)) {
      _pollTimer?.cancel();
      _pollTimer = Timer.periodic(
        const Duration(seconds: 2),
        (_) => unawaited(pollIntent()),
      );
    } else {
      _pollTimer?.cancel();
    }
  }

  Future<IntentResponse?> _submitIntent(
    String input,
    String key,
    int generation,
  ) async {
    if (_uncertainKey == key) {
      try {
        return await _intents.find(key);
      } on DataRequestFailure catch (error) {
        if (error.statusCode != 404) rethrow;
        if (generation != _generation) return null;
        _uncertainKey = null;
      }
    }
    if (generation != _generation) return null;
    return _intents.create(input: input, idempotencyKey: key);
  }

  Future<void> inspect(String url, {ProviderAccessPolicy? accessPolicy}) async {
    if (state.busy) return;
    final generation = ++_generation;
    _pollTimer?.cancel();
    state = const DownloadIntakeState(phase: DownloadIntakePhase.inspecting);
    try {
      if (containsWeChatArticleInput(url)) {
        final discovery = await _repository.discoverArticle(
          idempotencyKey: _keys.value('discover', url),
          url: url,
        );
        if (generation == _generation) {
          state = DownloadIntakeState(discovery: discovery);
        }
      } else if (accessPolicy == null ||
          accessPolicy == ProviderAccessPolicy.public ||
          accessPolicy == ProviderAccessPolicy.publicSession) {
        final key = _keys.value('intent', url);
        try {
          final intent = await _submitIntent(url, key, generation);
          if (generation == _generation && intent != null) {
            _uncertainKey = null;
            await _adopt(intent, generation);
          }
        } catch (error) {
          if (generation != _generation) return;
          final definitive =
              error is DataRequestFailure &&
              error.statusCode != null &&
              error.statusCode! >= 400 &&
              error.statusCode! < 500;
          if (definitive) {
            if (generation == _generation) {
              state = DownloadIntakeState(error: error);
            }
            return;
          }
          _uncertainKey = key;
          // A transport failure may follow a committed admission. The next
          // operation is a read; never repeat the POST in the background.
          try {
            final existing = await _intents.find(key);
            if (generation == _generation) {
              _uncertainKey = null;
              await _adopt(existing, generation);
            }
          } catch (lookupError) {
            if (generation == _generation) {
              if (lookupError is DataRequestFailure &&
                  lookupError.statusCode == 404) {
                _uncertainKey = null;
              }
              state = DownloadIntakeState(error: error);
            }
          }
        }
      } else {
        final inspection = await _repository.inspectPublicUrl(
          idempotencyKey: _keys.value(
            'inspect',
            jsonEncode([url, accessPolicy.name]),
          ),
          url: url,
          accessPolicy: accessPolicy,
        );
        if (generation == _generation) _applyInspection(inspection);
      }
    } catch (error) {
      if (generation == _generation) state = DownloadIntakeState(error: error);
    }
  }

  Future<void> inspectItem(String itemRef) async {
    final discovery = state.discovery;
    if (state.busy || discovery == null) return;
    final generation = ++_generation;
    state = state.copyWith(
      phase: DownloadIntakePhase.selecting,
      clearError: true,
      clearInspection: true,
      clearSelectedFormat: true,
    );
    try {
      final inspection = await _repository.inspectDiscoveredItem(
        discoveryId: discovery.id,
        idempotencyKey: _keys.value('inspect-item', '${discovery.id}:$itemRef'),
        itemRef: itemRef,
      );
      if (generation == _generation) {
        _applyInspection(inspection, discovery: discovery);
      }
    } catch (error) {
      if (generation == _generation) {
        state = state.copyWith(error: error, phase: DownloadIntakePhase.idle);
      }
    }
  }

  Future<DownloadResponse?> createDownload() async {
    final inspection = state.inspection;
    final formatId = state.selectedFormatId;
    if (state.busy ||
        inspection == null ||
        formatId == null ||
        !inspection.expiresAt.isAfter(DateTime.now()) ||
        !inspection.formats.any((format) => format.id == formatId) ||
        inspection.accessDecision != AccessDecision.downloadable) {
      if (inspection != null && !inspection.expiresAt.isAfter(DateTime.now())) {
        if (state.intent?.status == IntentStatus.ready) {
          await refreshIntent();
        } else {
          _keys.forget('inspect');
          _keys.forget('inspect-item');
          state = state.copyWith(
            error: const DataRequestFailure(
              DataRequestFailureKind.unknown,
              code: 'resource_expired',
            ),
            clearInspection: true,
            clearSelectedFormat: true,
          );
        }
      }
      return null;
    }
    state = state.copyWith(
      phase: DownloadIntakePhase.creating,
      clearError: true,
    );
    final generation = _generation;
    try {
      final job = await _repository.createDownload(
        formatId: formatId,
        idempotencyKey: _keys.value('download', '${inspection.id}:$formatId'),
        inspectionId: inspection.id,
      );
      if (generation != _generation) return null;
      state = state.copyWith(phase: DownloadIntakePhase.idle);
      return job;
    } catch (error) {
      if (generation == _generation) {
        state = state.copyWith(error: error, phase: DownloadIntakePhase.idle);
        if (error is DataRequestFailure && error.code == 'resource_expired') {
          if (state.intent?.status == IntentStatus.ready) {
            await refreshIntent();
          } else {
            _keys.forget('inspect');
            _keys.forget('inspect-item');
            state = state.copyWith(
              clearInspection: true,
              clearSelectedFormat: true,
            );
          }
        }
      }
      return null;
    }
  }

  void _applyInspection(
    InspectionResponse inspection, {
    SourceDiscoveryResponse? discovery,
  }) {
    state = DownloadIntakeState(
      discovery: discovery,
      inspection: inspection,
      selectedFormatId: inspection.formats.firstOrNull?.id,
    );
  }
}

final class _StableKeys {
  final Map<String, ({String payload, String value})> _values = {};

  String value(String operation, String payload) {
    final current = _values[operation];
    if (current?.payload == payload) return current!.value;
    final random = Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    bytes[6] = (bytes[6] & 0x0f) | 0x40;
    bytes[8] = (bytes[8] & 0x3f) | 0x80;
    final hex = bytes
        .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
        .join();
    final value =
        '${hex.substring(0, 8)}-${hex.substring(8, 12)}-'
        '${hex.substring(12, 16)}-${hex.substring(16, 20)}-${hex.substring(20)}';
    _values[operation] = (payload: payload, value: value);
    return value;
  }

  void forget(String operation) => _values.remove(operation);
  void clear() => _values.clear();
}
