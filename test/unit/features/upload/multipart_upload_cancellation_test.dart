import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/upload/data/multipart_uploader.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';

void main() {
  test(
    'ends when the session expires while waiting for response headers',
    () async {
      final fixture = await _Fixture.create();
      addTearDown(fixture.close);
      fixture.server.listen((request) async {
        await request.drain<void>();
        // The storage endpoint consumes the body but never responds.
      });
      final operation = fixture.upload(const Duration(milliseconds: 150));
      await expectLater(
        operation.timeout(const Duration(seconds: 1)),
        throwsA(isA<DioException>()),
      );
    },
  );

  test('a failed part promptly cancels a stalled sibling', () async {
    final fixture = await _Fixture.create(parts: 2);
    addTearDown(fixture.close);
    fixture.server.listen((request) async {
      await request.drain<void>();
      if (request.uri.path == '/1') {
        request.response.statusCode = 500;
        await request.response.close();
      }
    });
    await expectLater(
      fixture
          .upload(const Duration(minutes: 5))
          .timeout(const Duration(seconds: 1)),
      throwsA(isA<DioException>()),
    );
    expect(fixture.token.isCancelled, isTrue);
  });
}

final class _Fixture {
  _Fixture(this.directory, this.file, this.server, this.parts);

  final Directory directory;
  final LocalContentFile file;
  final HttpServer server;
  final int parts;
  final token = CancelToken();
  static const partSize = 5 * 1024 * 1024;

  static Future<_Fixture> create({int parts = 1}) async {
    final directory = await Directory.systemTemp.createTemp('upload-cancel');
    final file = File('${directory.path}/clip.mp4');
    final size = parts == 1 ? 4 : partSize + 4;
    await file.writeAsBytes(List.filled(size, 1));
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    return _Fixture(
      directory,
      LocalContentFile(name: 'clip.mp4', path: file.path, size: size),
      server,
      parts,
    );
  }

  Future<List<CompletedUploadPart>> upload(Duration validity) =>
      MultipartUploader().upload(
        file,
        MultipartSession(
          expiresAt: DateTime.now().add(validity),
          maxConcurrency: parts,
          partCount: parts,
          partSize: partSize,
          resourceId: 'upload-test',
          parts: [
            for (var part = 1; part <= parts; part++)
              UploadPartTarget(
                number: part,
                url: 'http://127.0.0.1:${server.port}/$part',
              ),
          ],
        ),
        token,
        (_) {},
      );

  Future<void> close() async {
    token.cancel();
    await server.close(force: true);
    await directory.delete(recursive: true);
  }
}
