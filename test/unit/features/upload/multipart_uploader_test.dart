import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/upload/data/multipart_uploader.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';

void main() {
  test('hashes and streams a selected file to a presigned part URL', () async {
    final directory = await Directory.systemTemp.createTemp('framegrab-upload');
    final file = File('${directory.path}/clip.mp4');
    final bytes = utf8.encode('real mp4 bytes');
    await file.writeAsBytes(bytes);
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() async {
      await server.close(force: true);
      await directory.delete(recursive: true);
    });
    final received = <int>[];
    server.listen((request) async {
      await for (final chunk in request) {
        received.addAll(chunk);
      }
      request.response.headers.set(
        'etag',
        '"0123456789abcdef0123456789abcdef"',
      );
      await request.response.close();
    });
    final selected = LocalContentFile(
      name: file.uri.pathSegments.last,
      path: file.path,
      size: bytes.length,
    );
    final uploader = MultipartUploader();
    final token = CancelToken();

    final digest = await uploader.hashFile(selected, token, (_) {});
    final progress = <int>[];
    final parts = await uploader.upload(
      selected,
      MultipartSession(
        expiresAt: DateTime.now().add(const Duration(minutes: 5)),
        maxConcurrency: 2,
        partCount: 1,
        partSize: 5 * 1024 * 1024,
        resourceId: '00000000-0000-0000-0000-000000000001',
        parts: [
          UploadPartTarget(
            number: 1,
            url: 'http://${server.address.address}:${server.port}/part/1',
          ),
        ],
      ),
      token,
      progress.add,
    );

    expect(digest, sha256.convert(bytes).toString());
    expect(received, bytes);
    expect(parts.single.number, 1);
    expect(parts.single.etag, '"0123456789abcdef0123456789abcdef"');
    expect(progress.last, 100);
  });

  test('rejects upload URLs containing credentials before sending', () async {
    final directory = await Directory.systemTemp.createTemp('framegrab-upload');
    final file = File('${directory.path}/clip.mp4');
    await file.writeAsBytes([1]);
    addTearDown(() => directory.delete(recursive: true));

    expect(
      () => MultipartUploader().upload(
        LocalContentFile(name: 'clip.mp4', path: file.path, size: 1),
        MultipartSession(
          expiresAt: DateTime.now().add(const Duration(minutes: 5)),
          maxConcurrency: 1,
          partCount: 1,
          partSize: 5 * 1024 * 1024,
          resourceId: '00000000-0000-0000-0000-000000000001',
          parts: const [
            UploadPartTarget(number: 1, url: 'https://user@example.com/part'),
          ],
        ),
        CancelToken(),
        (_) {},
      ),
      throwsA(
        isA<ContentUploadFailure>().having(
          (failure) => failure.code,
          'code',
          ContentUploadFailureCode.invalidSession,
        ),
      ),
    );
  });
}
