import 'dart:math';

import 'package:framegrab/features/upload/data/multipart_uploader.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';
import 'package:video_server_api/video_server_api.dart';

String uploadIdempotencyKey(
  ContentUploadKind kind,
  LocalContentFile file,
  String sha,
) {
  final nonce = Random.secure().nextInt(0x7fffffff).toRadixString(16);
  return 'app-${kind.name}-${file.size}-${sha.substring(0, 12)}-$nonce';
}

DocumentSourceFormat documentFormat(String name) {
  final normalized = name.toLowerCase();
  if (normalized.endsWith('.docx')) return DocumentSourceFormat.docx;
  if (normalized.endsWith('.pdf')) return DocumentSourceFormat.pdf;
  if (normalized.endsWith('.fountain')) return DocumentSourceFormat.fountain;
  if (normalized.endsWith('.md') || normalized.endsWith('.markdown')) {
    return DocumentSourceFormat.markdown;
  }
  return DocumentSourceFormat.txt;
}

MultipartSession mediaSession(MediaUploadSessionResponse value) =>
    MultipartSession(
      expiresAt: value.expiresAt,
      maxConcurrency: value.maxConcurrency,
      partCount: value.partCount,
      partSize: value.partSizeBytes,
      resourceId: value.resourceId,
      parts: value.parts
          .map(
            (part) => UploadPartTarget(number: part.partNumber, url: part.url),
          )
          .toList(),
    );

MultipartSession documentSession(DocumentUploadSessionResponse value) =>
    MultipartSession(
      expiresAt: value.expiresAt,
      maxConcurrency: value.maxConcurrency,
      partCount: value.partCount,
      partSize: value.partSizeBytes,
      resourceId: value.resourceId,
      parts: value.parts
          .map(
            (part) => UploadPartTarget(number: part.partNumber, url: part.url),
          )
          .toList(),
    );
