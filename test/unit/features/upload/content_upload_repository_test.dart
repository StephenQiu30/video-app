import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';

import '../../../support/upload_http_fixture.dart';

void main() {
  for (final kind in ContentUploadKind.values) {
    test(
      '$kind uploads using generated create/session/complete APIs',
      () async {
        final fixture = await UploadHttpFixture.create(kind: kind);
        addTearDown(fixture.close);
        final result = await fixture.upload();
        expect(result.resourceId, 'import-1');
        expect(fixture.paths, [
          fixture.createPath,
          fixture.sessionPath,
          '/part',
          fixture.completePath,
        ]);
      },
    );

    test(
      '$kind create retry after 401 retains the same idempotency key',
      () async {
        final fixture = await UploadHttpFixture.create(kind: kind);
        addTearDown(fixture.close);
        fixture.intercept = (request) async {
          if (request.uri.path == fixture.createPath &&
              fixture.keys.length == 1) {
            await fixture.respond(request, status: 401);
            return true;
          }
          return false;
        };
        await fixture.upload();
        expect(fixture.keys, hasLength(2));
        expect(fixture.keys.first, isNotEmpty);
        expect(fixture.keys.last, fixture.keys.first);
        expect(
          fixture.paths.where((path) => path == fixture.completePath),
          hasLength(1),
        );
      },
    );

    test(
      '$kind cancellation prevents complete and cleans up the import',
      () async {
        final fixture = await UploadHttpFixture.create(kind: kind);
        addTearDown(fixture.close);
        final reached = Completer<void>();
        fixture.intercept = (request) async {
          if (request.uri.path == '/part') {
            reached.complete();
            return true;
          }
          return false;
        };
        final operation = fixture.upload();
        final assertion = expectLater(operation, throwsA(anything));
        await reached.future;
        fixture.token.cancel();
        await assertion;
        expect(fixture.paths, contains(fixture.cancelPath));
        expect(fixture.paths, isNot(contains(fixture.completePath)));
      },
    );
  }

  test(
    'cancellation at the completing phase never finalizes the resource',
    () async {
      final fixture = await UploadHttpFixture.create();
      addTearDown(fixture.close);
      await expectLater(
        fixture.upload(
          onPhase: (phase) {
            if (phase == ContentUploadPhase.completing) fixture.token.cancel();
          },
        ),
        throwsA(anything),
      );
      expect(fixture.paths, [
        fixture.createPath,
        fixture.sessionPath,
        '/part',
        fixture.cancelPath,
      ]);
    },
  );

  test(
    'cancelling a stalled session request prevents parts and cleans up',
    () async {
      final fixture = await UploadHttpFixture.create();
      addTearDown(fixture.close);
      final reached = Completer<void>();
      fixture.intercept = (request) async {
        if (request.uri.path == fixture.sessionPath) {
          reached.complete();
          return true;
        }
        return false;
      };
      final assertion = expectLater(fixture.upload(), throwsA(anything));
      await reached.future;
      fixture.token.cancel();
      await assertion;
      expect(fixture.paths, [
        fixture.createPath,
        fixture.sessionPath,
        fixture.cancelPath,
      ]);
    },
  );

  test('cancel during hashing never creates a resource', () async {
    final fixture = await UploadHttpFixture.create();
    addTearDown(fixture.close);
    await expectLater(
      fixture.upload(onProgress: (_) => fixture.token.cancel()),
      throwsA(anything),
    );
    expect(fixture.paths, isEmpty);
  });

  test('overall budget ends a stalled create request', () async {
    final fixture = await UploadHttpFixture.create();
    addTearDown(fixture.close);
    fixture.intercept = (request) async =>
        request.uri.path == fixture.createPath;
    await expectLater(
      fixture
          .upload(timeout: const Duration(milliseconds: 150))
          .timeout(const Duration(seconds: 2)),
      throwsA(isA<ContentUploadFailure>()),
    );
    expect(fixture.token.isCancelled, isTrue);
    expect(fixture.paths, [fixture.createPath]);
  });

  test(
    'a session change after parts prevents complete or cleanup under the new account',
    () async {
      final fixture = await UploadHttpFixture.create();
      addTearDown(fixture.close);
      fixture.intercept = (request) async {
        if (request.uri.path == '/part') fixture.generation++;
        return false;
      };
      await expectLater(fixture.upload(), throwsA(anything));
      expect(fixture.paths, [fixture.createPath, fixture.sessionPath, '/part']);
    },
  );

  test(
    'a session change during create never requests an upload session',
    () async {
      final fixture = await UploadHttpFixture.create();
      addTearDown(fixture.close);
      fixture.intercept = (request) async {
        if (request.uri.path == fixture.createPath) fixture.generation++;
        return false;
      };
      await expectLater(fixture.upload(), throwsA(anything));
      expect(fixture.paths, [fixture.createPath]);
    },
  );
}
