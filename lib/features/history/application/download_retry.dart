import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:video_server_api/video_server_api.dart';

final downloadRetryProvider = Provider.autoDispose
    .family<DownloadRetry, String>((ref, jobId) {
      final repository = ref.watch(downloadHistoryRepositoryProvider);
      final session = ref.read(authSessionProvider.notifier);
      return DownloadRetry(
        execute: (key) => repository.retry(jobId, idempotencyKey: key),
        sessionGeneration: () => session.sessionGeneration,
      );
    });

/// One UI operation, shared by the mounted list/detail for the same source.
final class DownloadRetry {
  DownloadRetry({
    required this._execute,
    required this._sessionGeneration,
    String Function()? newKey,
  }) : _newKey = newKey ?? _randomKey;

  final Future<DownloadResponse> Function(String key) _execute;
  final int Function() _sessionGeneration;
  final String Function() _newKey;
  int? _generation;
  String? _key;
  Future<DownloadResponse>? _pending;

  Future<DownloadResponse> run() {
    final generation = _sessionGeneration();
    if (_generation != generation) {
      _generation = generation;
      _key = null;
      _pending = null;
    }
    if (_pending case final pending?) return pending;
    final key = _key ??= _newKey();
    late final Future<DownloadResponse> pending;
    pending = Future.sync(() => _execute(key))
        .then((value) {
          if (_sessionGeneration() != generation) {
            throw const DataRequestFailure(
              DataRequestFailureKind.unauthenticated,
            );
          }
          if (_key == key) _key = null;
          return value;
        })
        .whenComplete(() {
          if (identical(_pending, pending)) _pending = null;
        });
    _pending = pending;
    return pending;
  }

  static String _randomKey() =>
      'app-retry-${DateTime.now().toUtc().microsecondsSinceEpoch}-${Random.secure().nextInt(0x7fffffff).toRadixString(16)}';
}
