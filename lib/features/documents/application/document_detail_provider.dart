import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/documents/data/document_repository.dart';
import 'package:video_server_api/video_server_api.dart';

const documentDetailPollingInterval = Duration(seconds: 3);

final documentDetailPollingIntervalProvider = Provider<Duration>(
  (_) => documentDetailPollingInterval,
);

final documentDetailProvider = StreamProvider.autoDispose
    .family<DocumentDetailResponse, String>((ref, documentId) async* {
      final repository = ref.watch(documentRepositoryProvider);
      final pollingInterval = ref.watch(documentDetailPollingIntervalProvider);
      var document = await repository.fetchDetail(documentId);
      yield document;

      while (_isActive(document)) {
        await Future<void>.delayed(pollingInterval);
        document = await repository.fetchDetail(documentId);
        yield document;
      }
    }, retry: (_, _) => null);

bool _isActive(DocumentDetailResponse document) {
  if (document.status == ImportStatus.uploading && document.errorCode != null) {
    return false;
  }
  return document.status == ImportStatus.uploading ||
      document.status == ImportStatus.verifying;
}
