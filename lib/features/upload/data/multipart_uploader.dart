import 'dart:async';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';

final class UploadPartTarget {
  const UploadPartTarget({required this.number, required this.url});

  final int number;
  final String url;
}

final class MultipartSession {
  const MultipartSession({
    required this.expiresAt,
    required this.maxConcurrency,
    required this.partCount,
    required this.partSize,
    required this.parts,
    required this.resourceId,
  });

  final DateTime expiresAt;
  final int maxConcurrency;
  final int partCount;
  final int partSize;
  final List<UploadPartTarget> parts;
  final String resourceId;
}

final class CompletedUploadPart {
  const CompletedUploadPart({required this.etag, required this.number});

  final String etag;
  final int number;
}

final class MultipartUploader {
  MultipartUploader() : _dio = Dio(BaseOptions(followRedirects: false));

  final Dio _dio;

  Future<String> hashFile(
    LocalContentFile selected,
    CancelToken token,
    void Function(int) onProgress,
  ) async {
    final output = _DigestSink();
    final input = sha256.startChunkedConversion(output);
    var loaded = 0;
    await for (final chunk in File(selected.path).openRead()) {
      _throwIfCancelled(token);
      input.add(chunk);
      loaded += chunk.length;
      onProgress((loaded * 100 / selected.size).floor().clamp(0, 100));
    }
    input.close();
    return output.value.toString();
  }

  Future<List<CompletedUploadPart>> upload(
    LocalContentFile selected,
    MultipartSession session,
    CancelToken token,
    void Function(int) onProgress,
  ) async {
    final parts = _validate(selected, session);
    final completed = List<CompletedUploadPart?>.filled(parts.length, null);
    final loaded = <int, int>{};
    var cursor = 0;

    void report(int part, int bytes) {
      loaded[part] = bytes;
      final total = loaded.values.fold<int>(0, (sum, value) => sum + value);
      onProgress((total * 100 / selected.size).floor().clamp(0, 100));
    }

    Future<void> worker() async {
      while (cursor < parts.length) {
        _throwIfCancelled(token);
        final index = cursor++;
        final target = parts[index];
        final start = (target.number - 1) * session.partSize;
        final end = (start + session.partSize).clamp(0, selected.size);
        final response = await _dio.put<void>(
          target.url,
          data: File(selected.path).openRead(start, end),
          cancelToken: token,
          options: Options(
            headers: {Headers.contentLengthHeader: end - start},
            sendTimeout: session.expiresAt.difference(DateTime.now()),
            validateStatus: (status) => status != null && status ~/ 100 == 2,
          ),
          onSendProgress: (sent, _) => report(target.number, sent),
        );
        final etag = response.headers.value('etag')?.trim() ?? '';
        if (!RegExp(
          r'^(?:[0-9a-fA-F]{32}|"[0-9a-fA-F]{32}")$',
        ).hasMatch(etag)) {
          throw const ContentUploadFailure(
            ContentUploadFailureCode.uploadFailed,
          );
        }
        report(target.number, end - start);
        completed[index] = CompletedUploadPart(
          etag: etag,
          number: target.number,
        );
      }
    }

    try {
      await Future.wait(
        List.generate(
          session.maxConcurrency.clamp(1, parts.length),
          (_) => worker(),
        ),
      );
    } catch (_) {
      if (!token.isCancelled) token.cancel('multipart part failed');
      rethrow;
    }
    return completed.cast<CompletedUploadPart>();
  }

  List<UploadPartTarget> _validate(
    LocalContentFile file,
    MultipartSession session,
  ) {
    final expected = (file.size / session.partSize).ceil();
    final parts = [...session.parts]..sort((a, b) => a.number - b.number);
    final invalid =
        session.resourceId.isEmpty ||
        session.partSize < 5 * 1024 * 1024 ||
        session.partCount != expected ||
        parts.length != expected ||
        session.maxConcurrency < 1 ||
        session.maxConcurrency > 16 ||
        !session.expiresAt.isAfter(DateTime.now());
    if (invalid) {
      throw const ContentUploadFailure(ContentUploadFailureCode.invalidSession);
    }
    for (final (index, part) in parts.indexed) {
      final uri = Uri.tryParse(part.url);
      if (part.number != index + 1 ||
          uri == null ||
          !{'http', 'https'}.contains(uri.scheme) ||
          uri.userInfo.isNotEmpty) {
        throw const ContentUploadFailure(
          ContentUploadFailureCode.invalidSession,
        );
      }
    }
    return parts;
  }
}

final class _DigestSink implements Sink<Digest> {
  late Digest value;

  @override
  void add(Digest data) => value = data;

  @override
  void close() {}
}

void _throwIfCancelled(CancelToken token) {
  if (token.isCancelled) throw token.cancelError!;
}
