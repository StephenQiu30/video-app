import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:video_server_api/video_server_api.dart';

void main() {
  for (final unauthorized in [false, true]) {
    test(
      'discards an old session ${unauthorized ? '401' : 'response'} without replay',
      () async {
        var generation = 0;
        var refreshCalls = 0;
        var operationCalls = 0;
        final pending = Completer<String>();
        final request = AuthenticatedRequest(
          client: VideoServerApi(),
          accessToken: () => 'access-$generation',
          sessionGeneration: () => generation,
          refreshSession: () async {
            refreshCalls++;
            return true;
          },
          expireSession: () async => fail('must not expire the new session'),
        );
        final operation = request.execute((_) {
          operationCalls++;
          return pending.future;
        });
        final assertion = expectLater(
          operation,
          throwsA(isA<DataRequestFailure>()),
        );
        generation++;
        if (unauthorized) {
          pending.completeError(_unauthorized());
        } else {
          pending.complete('old-account-data');
        }
        await assertion;
        expect(refreshCalls, 0);
        expect(operationCalls, 1);
      },
    );
  }

  test('does not expire a new session after an old replay fails', () async {
    var generation = 0;
    var calls = 0;
    final replayStarted = Completer<void>();
    final replay = Completer<String>();
    final request = AuthenticatedRequest(
      client: VideoServerApi(),
      accessToken: () => 'access-$generation',
      sessionGeneration: () => generation,
      refreshSession: () async => true,
      expireSession: () async => fail('must not expire the new session'),
    );
    final result = request.execute((_) async {
      if (calls++ == 0) throw _unauthorized();
      replayStarted.complete();
      return replay.future;
    });
    final assertion = expectLater(result, throwsA(isA<DataRequestFailure>()));
    await replayStarted.future;
    generation++;
    replay.completeError(_unauthorized());
    await assertion;
  });
}

DioException _unauthorized() {
  final options = RequestOptions(path: '/api/owned-resource');
  return DioException(
    requestOptions: options,
    response: Response<void>(requestOptions: options, statusCode: 401),
  );
}
