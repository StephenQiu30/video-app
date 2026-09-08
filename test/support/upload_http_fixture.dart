import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:framegrab/features/upload/data/content_upload_repository.dart';
import 'package:framegrab/features/upload/data/multipart_uploader.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';
import 'package:video_server_api/video_server_api.dart';

final class UploadHttpFixture {
  UploadHttpFixture(this.directory, this.file, this.server, this.kind) {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    request = AuthenticatedRequest(
      client: VideoServerApi(dio: dio),
      accessToken: () => 'access-$generation',
      sessionGeneration: () => generation,
      refreshSession: () async => true,
      expireSession: () async {},
    );
    server.listen((incoming) async {
      await incoming.drain<void>();
      paths.add(incoming.uri.path);
      if (incoming.uri.path == createPath) {
        keys.add(incoming.headers.value('Idempotency-Key'));
      }
      if (await intercept?.call(incoming) ?? false) return;
      await respond(incoming);
    });
  }

  final Directory directory;
  final LocalContentFile file;
  final HttpServer server;
  final ContentUploadKind kind;
  late final Dio dio;
  late final AuthenticatedRequest request;
  final token = CancelToken();
  final paths = <String>[];
  final keys = <String?>[];
  int generation = 0;
  Future<bool> Function(HttpRequest request)? intercept;
  String get baseUrl => 'http://127.0.0.1:${server.port}';
  String get createPath =>
      kind == ContentUploadKind.video ? '/api/media-imports' : '/api/documents';
  String get sessionPath => '$createPath/import-1/upload-sessions';
  String get completePath => '$createPath/import-1/complete';
  String get cancelPath => kind == ContentUploadKind.video
      ? '/api/downloads/import-1/cancel'
      : '/api/documents/import-1/cancel';

  static Future<UploadHttpFixture> create({
    ContentUploadKind kind = ContentUploadKind.video,
  }) async {
    final directory = await Directory.systemTemp.createTemp('upload-http');
    final name = kind == ContentUploadKind.video ? 'clip.mp4' : 'scene.txt';
    final file = File('${directory.path}/$name');
    await file.writeAsBytes([1, 2, 3, 4]);
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    return UploadHttpFixture(
      directory,
      LocalContentFile(name: name, path: file.path, size: 4),
      server,
      kind,
    );
  }

  Future<ContentUploadResult> upload({
    Duration timeout = const Duration(minutes: 30),
    void Function(ContentUploadPhase)? onPhase,
    void Function(int)? onProgress,
  }) =>
      GeneratedContentUploadRepository(
        request,
        MultipartUploader(),
        uploadTimeout: timeout,
      ).upload(
        cancelToken: token,
        file: file,
        kind: kind,
        onPhase: onPhase ?? (_) {},
        onProgress: onProgress ?? (_) {},
      );

  Future<void> respond(HttpRequest request, {int status = 200}) async {
    request.response.statusCode = status;
    if (status != 200) {
      await request.response.close();
      return;
    }
    if (request.uri.path == '/part') {
      request.response.headers.set(
        'etag',
        '"0123456789abcdef0123456789abcdef"',
      );
    } else {
      request.response.headers.contentType = ContentType.json;
      request.response.write(
        jsonEncode(
          request.uri.path == sessionPath
              ? {
                  'resource_id': 'import-1',
                  'attempt': 1,
                  'part_size_bytes': 5 * 1024 * 1024,
                  'part_count': 1,
                  'max_concurrency': 1,
                  'expires_at': DateTime.now()
                      .add(const Duration(minutes: 5))
                      .toUtc()
                      .toIso8601String(),
                  'parts': [
                    {'part_number': 1, 'url': '$baseUrl/part'},
                  ],
                }
              : {
                  'id': 'import-1',
                  'download_id': 'import-1',
                  'source_format': kind == ContentUploadKind.video
                      ? 'mp4'
                      : 'txt',
                  'declared_origin': 'user_file',
                  'display_name': file.name,
                  'title': file.name,
                  'original_filename': file.name,
                  'declared_size_bytes': 4,
                  'status': 'uploading',
                  'attempt': 1,
                  'version': 1,
                  'quality_warnings': <String>[],
                  'created_at': '2026-09-08T00:00:00Z',
                  'updated_at': '2026-09-08T00:00:00Z',
                },
        ),
      );
    }
    await request.response.close();
  }

  Future<void> close() async {
    token.cancel();
    dio.close(force: true);
    await server.close(force: true);
    await directory.delete(recursive: true);
  }
}
