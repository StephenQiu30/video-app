import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:video_server_api/video_server_api.dart';

final documentRepositoryProvider = Provider<DocumentRepository>(
  (ref) => GeneratedDocumentRepository(ref.watch(authenticatedRequestProvider)),
);

abstract interface class DocumentRepository {
  Future<DocumentPageResponse> fetchFirstPage();
}

final class GeneratedDocumentRepository implements DocumentRepository {
  const GeneratedDocumentRepository(this._request);

  final AuthenticatedRequest _request;

  @override
  Future<DocumentPageResponse> fetchFirstPage() {
    return _request.execute((client) async {
      final response = await client.getDocumentsApi().listDocuments(
        page: 1,
        pageSize: 20,
      );
      final data = response.data;
      if (data == null) {
        throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
      }
      return data;
    });
  }
}
