import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:video_server_api/video_server_api.dart';

void main() {
  test('refreshes once and replays a protected GET after 401', () async {
    final client = VideoServerApi();
    var token = 'old-access';
    var calls = 0;
    var refreshes = 0;
    var expirations = 0;
    final request = AuthenticatedRequest(
      client: client,
      accessToken: () => token,
      sessionGeneration: () => 0,
      refreshSession: () async {
        refreshes += 1;
        token = 'new-access';
        return true;
      },
      expireSession: () async => expirations += 1,
    );

    final result = await request.execute((_) async {
      calls += 1;
      if (calls == 1) throw _dioError(401);
      return 'live-data';
    });

    expect(result, 'live-data');
    expect(calls, 2);
    expect(refreshes, 1);
    expect(expirations, 0);
  });

  test('expires the session when the replay is also unauthorized', () async {
    final client = VideoServerApi();
    var expirations = 0;
    final request = AuthenticatedRequest(
      client: client,
      accessToken: () => 'access',
      sessionGeneration: () => 0,
      refreshSession: () async => true,
      expireSession: () async => expirations += 1,
    );

    await expectLater(
      request.execute<void>((_) async => throw _dioError(401)),
      throwsA(
        isA<DataRequestFailure>().having(
          (failure) => failure.kind,
          'kind',
          DataRequestFailureKind.unauthenticated,
        ),
      ),
    );
    expect(expirations, 1);
  });

  test('maps a transport failure without refreshing', () async {
    final request = AuthenticatedRequest(
      client: VideoServerApi(),
      accessToken: () => 'access',
      sessionGeneration: () => 0,
      refreshSession: () async => fail('must not refresh'),
      expireSession: () async => fail('must not expire'),
    );

    await expectLater(
      request.execute<void>((_) async {
        throw DioException(requestOptions: RequestOptions(path: '/api'));
      }),
      throwsA(
        isA<DataRequestFailure>().having(
          (failure) => failure.kind,
          'kind',
          DataRequestFailureKind.unavailable,
        ),
      ),
    );
  });

  test('reads the unified API message from an error response', () async {
    final request = AuthenticatedRequest(
      client: VideoServerApi(),
      accessToken: () => 'access',
      sessionGeneration: () => 0,
      refreshSession: () async => fail('must not refresh'),
      expireSession: () async => fail('must not expire'),
    );

    await expectLater(
      request.execute<void>((_) async {
        throw _dioError(
          409,
          data: {
            'code': 'invalid_state',
            'message': 'The task is still active.',
            'data': null,
          },
        );
      }),
      throwsA(
        isA<DataRequestFailure>()
            .having((failure) => failure.code, 'code', 'invalid_state')
            .having(
              (failure) => failure.detail,
              'detail',
              'The task is still active.',
            ),
      ),
    );
  });
}

DioException _dioError(int statusCode, {Object? data}) {
  final options = RequestOptions(path: '/api');
  return DioException(
    requestOptions: options,
    response: Response<Object?>(
      requestOptions: options,
      statusCode: statusCode,
      data: data,
    ),
  );
}
