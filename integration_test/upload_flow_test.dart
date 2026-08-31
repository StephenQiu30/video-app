import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/config/app_config.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/upload/data/content_upload_repository.dart';
import 'package:framegrab/features/upload/data/multipart_uploader.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';
import 'package:integration_test/integration_test.dart';
import 'package:video_server_api/video_server_api.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('uploads a real MP4 and screenplay through generated APIs', (
    _,
  ) async {
    final directory = await Directory.systemTemp.createTemp(
      'framegrab-upload-integration',
    );
    addTearDown(() => directory.delete(recursive: true));
    final video = File('${directory.path}/black.mp4');
    await video.writeAsBytes(base64Decode(_tinyMp4Base64));
    final screenplay = File('${directory.path}/scene.fountain');
    await screenplay.writeAsString(
      'INT. TEST LAB - NIGHT\n\nA verified upload reaches the server.\n',
    );

    final client = VideoServerApi(
      dio: Dio(BaseOptions(baseUrl: AppConfig.serverBaseUrl)),
    );
    final gateway = GeneratedNativeAuthGateway(client);
    final suffix = DateTime.now().microsecondsSinceEpoch.toString();
    final username = 'uploadqa${suffix.substring(suffix.length - 10)}';
    final session = await gateway.register(
      username: username,
      email: '$username@example.com',
      password: 'strong-pass-123',
    );
    addTearDown(() => gateway.logout(session.refreshToken));
    final request = AuthenticatedRequest(
      client: client,
      accessToken: () => session.accessToken,
      refreshSession: () async => false,
      expireSession: () async {},
    );
    final repository = GeneratedContentUploadRepository(
      request,
      MultipartUploader(),
    );
    final phases = <ContentUploadPhase>[];
    final progress = <int>[];

    final videoResult = await repository.upload(
      cancelToken: CancelToken(),
      file: await _selected(video),
      kind: ContentUploadKind.video,
      onPhase: phases.add,
      onProgress: progress.add,
    );
    final documentResult = await repository.upload(
      cancelToken: CancelToken(),
      file: await _selected(screenplay),
      kind: ContentUploadKind.screenplay,
      onPhase: phases.add,
      onProgress: progress.add,
    );

    expect(videoResult.kind, ContentUploadKind.video);
    expect(videoResult.resourceId, isNotEmpty);
    expect(documentResult.kind, ContentUploadKind.screenplay);
    expect(documentResult.resourceId, isNotEmpty);
    expect(
      phases,
      containsAll([
        ContentUploadPhase.hashing,
        ContentUploadPhase.creating,
        ContentUploadPhase.uploading,
        ContentUploadPhase.completing,
      ]),
    );
    expect(progress, contains(100));
  });
}

Future<LocalContentFile> _selected(File file) async => LocalContentFile(
  name: file.uri.pathSegments.last,
  path: file.path,
  size: await file.length(),
);

const _tinyMp4Base64 =
    'AAAAIGZ0eXBpc29tAAACAGlzb21pc28yYXZjMW1wNDEAAAN1bW9vdgAAAGxtdmhkAAAAAAAAAAAAAAAAAAAD6AAAAMgAAQAA'
    'AQAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
    'AAAAAgAAAp90cmFrAAAAXHRraGQAAAADAAAAAAAAAAAAAAABAAAAAAAAAMgAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAA'
    'AAAAAAABAAAAAAAAAAAAAAAAAABAAAAAABAAAAAQAAAAAAAkZWR0cwAAABxlbHN0AAAAAAAAAAEAAADIAAAEAAABAAAAAAIX'
    'bWRpYQAAACBtZGhkAAAAAAAAAAAAAAAAAAAyAAAACgBVxAAAAAAALWhkbHIAAAAAAAAAAHZpZGUAAAAAAAAAAAAAAABWaWRl'
    'b0hhbmRsZXIAAAABwm1pbmYAAAAUdm1oZAAAAAEAAAAAAAAAAAAAACRkaW5mAAAAHGRyZWYAAAAAAAAAAQAAAAx1cmwgAAAA'
    'AQAAAYJzdGJsAAAAvnN0c2QAAAAAAAAAAQAAAK5hdmMxAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAABAAEABIAAAASAAAAAAA'
    'AAABFUxhdmM2Mi4yOC4xMDIgbGlieDI2NAAAAAAAAAAAAAAAGP//AAAANGF2Y0MBZAAK/+EAF2dkAAqs2V7ARAAAAwAEAAAD'
    'AMg8SJZYAQAGaOvjyyLA/fj4AAAAABBwYXNwAAAAAQAAAAEAAAAUYnRydAAAAAAAAHZIAAAAAAAAABhzdHRzAAAAAAAAAAEA'
    'AAAFAAACAAAAABRzdHNzAAAAAAAAAAEAAAABAAAAOGN0dHMAAAAAAAAABQAAAAEAAAQAAAAAAQAACgAAAAABAAAEAAAAAAEA'
    'AAAAAAAAAQAAAgAAAAAcc3RzYwAAAAAAAAABAAAAAQAAAAUAAAABAAAAKHN0c3oAAAAAAAAAAAAAAAUAAALFAAAADAAAAAwA'
    'AAAMAAAADAAAABRzdGNvAAAAAAAAAAEAAAOlAAAAYnVkdGEAAABabWV0YQAAAAAAAAAhaGRscgAAAAAAAAAAbWRpcmFwcGwA'
    'AAAAAAAAAAAAAAAtaWxzdAAAACWpdG9vAAAAHWRhdGEAAAABAAAAAExhdmY2Mi4xMi4xMDIAAAAIZnJlZQAAAv1tZGF0AAAC'
    'rgYF//+q3EXpvebZSLeWLNgg2SPu73gyNjQgLSBjb3JlIDE2NSByMzIyMiBiMzU2MDVhIC0gSC4yNjQvTVBFRy00IEFWQyBj'
    'b2RlYyAtIENvcHlsZWZ0IDIwMDMtMjAyNSAtIGh0dHA6Ly93d3cudmlkZW9sYW4ub3JnL3gyNjQuaHRtbCAtIG9wdGlvbnM6'
    'IGNhYmFjPTEgcmVmPTMgZGVibG9jaz0xOjA6MCBhbmFseXNlPTB4MzoweDExMyBtZT1oZXggc3VibWU9NyBwc3k9MSBwc3lf'
    'cmQ9MS4wMDowLjAwIG1peGVkX3JlZj0xIG1lX3JhbmdlPTE2IGNocm9tYV9tZT0xIHRyZWxsaXM9MSA4eDhkY3Q9MSBjcW09'
    'MCBkZWFkem9uZT0yMSwxMSBmYXN0X3Bza2lwPTEgY2hyb21hX3FwX29mZnNldD0tMiB0aHJlYWRzPTEgbG9va2FoZWFkX3Ro'
    'cmVhZHM9MSBzbGljZWRfdGhyZWFkcz0wIG5yPTAgZGVjaW1hdGU9MSBpbnRlcmxhY2VkPTAgYmx1cmF5X2NvbXBhdD0wIGNv'
    'bnN0cmFpbmVkX2ludHJhPTAgYmZyYW1lcz0zIGJfcHlyYW1pZD0yIGJfYWRhcHQ9MSBiX2JpYXM9MCBkaXJlY3Q9MSB3ZWln'
    'aHRiPTEgb3Blbl9nb3A9MCB3ZWlnaHRwPTIga2V5aW50PTI1MCBrZXlpbnRfbWluPTI1IHNjZW5lY3V0PTQwIGludHJhX3Jl'
    'ZnJlc2g9MCByY19sb29rYWhlYWQ9NDAgcmM9Y3JmIG1idHJlZT0xIGNyZj0yMy4wIHFjb21wPTAuNjAgcXBtaW49MCBxcG1h'
    'eD02OSBxcHN0ZXA9NCBpcF9yYXRpbz0xLjQwIGFxPTE6MS4wMACAAAAAD2WIhAAz//727L4FNhTIwQAAAAhBmiRsQr/+wAAA'
    'AAhBnkJ4hf/BgQAAAAgBnmF0Qr/EgAAAAAgBnmNqQr/EgQ==';
