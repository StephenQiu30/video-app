import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';

final analysisDocxRepositoryProvider = Provider(
  (ref) => AnalysisDocxRepository(ref.watch(authenticatedRequestProvider)),
);

final class AnalysisDocxRepository {
  const AnalysisDocxRepository(this.request);
  final AuthenticatedRequest request;
  Future<Uint8List> fetch(String id) => request.execute((client) async {
    final response = await client.getAnalysesApi().exportAnalysisReport(
      analysisId: id,
    );
    final bytes = response.data;
    if (bytes == null || bytes.isEmpty) {
      throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
    }
    return bytes;
  });
}
