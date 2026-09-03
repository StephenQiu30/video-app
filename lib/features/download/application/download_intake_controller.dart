import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/download/application/public_input.dart';
import 'package:framegrab/features/download/data/download_intake_repository.dart';
import 'package:video_server_api/video_server_api.dart';

enum DownloadIntakePhase { idle, inspecting, selecting, creating }

final class DownloadIntakeState {
  const DownloadIntakeState({
    this.discovery,
    this.error,
    this.inspection,
    this.phase = DownloadIntakePhase.idle,
    this.selectedFormatId,
  });

  final SourceDiscoveryResponse? discovery;
  final Object? error;
  final InspectionResponse? inspection;
  final DownloadIntakePhase phase;
  final String? selectedFormatId;

  bool get busy => phase != DownloadIntakePhase.idle;

  DownloadIntakeState copyWith({
    SourceDiscoveryResponse? discovery,
    bool clearDiscovery = false,
    Object? error,
    bool clearError = false,
    InspectionResponse? inspection,
    bool clearInspection = false,
    DownloadIntakePhase? phase,
    String? selectedFormatId,
    bool clearSelectedFormat = false,
  }) => DownloadIntakeState(
    discovery: clearDiscovery ? null : discovery ?? this.discovery,
    error: clearError ? null : error ?? this.error,
    inspection: clearInspection ? null : inspection ?? this.inspection,
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

  DownloadIntakeRepository get _repository =>
      ref.read(downloadIntakeRepositoryProvider);

  @override
  DownloadIntakeState build() {
    ref.watch(authSessionProvider.select((session) => session.user?.id));
    ref.watch(downloadIntakeRepositoryProvider);
    return const DownloadIntakeState();
  }

  void clearResult() {
    if (state.busy) return;
    state = const DownloadIntakeState();
  }

  void selectFormat(String id) {
    if (state.busy) return;
    state = state.copyWith(selectedFormatId: id, clearError: true);
  }

  Future<void> inspect(String url) async {
    if (state.busy) return;
    state = const DownloadIntakeState(phase: DownloadIntakePhase.inspecting);
    try {
      if (containsWeChatArticleInput(url)) {
        final discovery = await _repository.discoverArticle(
          idempotencyKey: _keys.value('discover', url),
          url: url,
        );
        state = DownloadIntakeState(discovery: discovery);
      } else {
        _applyInspection(
          await _repository.inspectPublicUrl(
            idempotencyKey: _keys.value('inspect', url),
            url: url,
          ),
        );
      }
    } catch (error) {
      state = DownloadIntakeState(error: error);
    }
  }

  Future<void> inspectItem(String itemRef) async {
    final discovery = state.discovery;
    if (state.busy || discovery == null) return;
    state = state.copyWith(
      phase: DownloadIntakePhase.selecting,
      clearError: true,
      clearInspection: true,
      clearSelectedFormat: true,
    );
    try {
      _applyInspection(
        await _repository.inspectDiscoveredItem(
          discoveryId: discovery.id,
          idempotencyKey: _keys.value(
            'inspect-item',
            '${discovery.id}:$itemRef',
          ),
          itemRef: itemRef,
        ),
        discovery: discovery,
      );
    } catch (error) {
      state = state.copyWith(error: error, phase: DownloadIntakePhase.idle);
    }
  }

  Future<DownloadResponse?> createDownload() async {
    final inspection = state.inspection;
    final formatId = state.selectedFormatId;
    if (state.busy ||
        inspection == null ||
        formatId == null ||
        inspection.accessDecision != AccessDecision.downloadable) {
      return null;
    }
    state = state.copyWith(
      phase: DownloadIntakePhase.creating,
      clearError: true,
    );
    try {
      final job = await _repository.createDownload(
        formatId: formatId,
        idempotencyKey: _keys.value('download', '${inspection.id}:$formatId'),
        inspectionId: inspection.id,
      );
      state = state.copyWith(phase: DownloadIntakePhase.idle);
      return job;
    } catch (error) {
      state = state.copyWith(error: error, phase: DownloadIntakePhase.idle);
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
    final nonce = Random.secure().nextInt(0x7fffffff).toRadixString(16);
    final value = 'app-${DateTime.now().toUtc().microsecondsSinceEpoch}-$nonce';
    _values[operation] = (payload: payload, value: value);
    return value;
  }
}
