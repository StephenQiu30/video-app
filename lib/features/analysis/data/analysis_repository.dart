import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:video_server_api/video_server_api.dart';

final analysisRepositoryProvider = Provider<AnalysisRepository>(
  (ref) => GeneratedAnalysisRepository(ref.watch(authenticatedRequestProvider)),
);

abstract interface class AnalysisRepository {
  Future<List<AnalysisSkillResponse>> fetchSkills(AnalysisInputKind inputKind);

  Future<AnalysisResponse?> fetchLatest({
    required AnalysisInputKind inputKind,
    required String sourceId,
  });

  Future<AnalysisResponse> fetch(String analysisId);

  Future<AnalysisResponse> create({
    required String customPrompt,
    required AnalysisInputKind inputKind,
    required String idempotencyKey,
    required String outputLanguage,
    required String skillId,
    required String sourceId,
  });

  Future<AnalysisResponse> cancel(String analysisId);

  Future<AnalysisResponse> retry({
    required String analysisId,
    required String idempotencyKey,
  });

  Future<void> delete(String analysisId);
}

final class GeneratedAnalysisRepository implements AnalysisRepository {
  const GeneratedAnalysisRepository(this._request);

  final AuthenticatedRequest _request;

  @override
  Future<AnalysisResponse> cancel(String analysisId) => _required(
    (api) async =>
        (await api.cancelAnalysis(analysisId: analysisId)).data?.data,
  );

  @override
  Future<AnalysisResponse> create({
    required String customPrompt,
    required AnalysisInputKind inputKind,
    required String idempotencyKey,
    required String outputLanguage,
    required String skillId,
    required String sourceId,
  }) {
    final prompt = customPrompt.trim();
    final body = AnalysisRequest(
      (builder) => builder
        ..skillId = skillId
        ..outputLanguage = outputLanguage
        ..customPrompt = prompt.isEmpty ? null : prompt,
    );
    return _required((api) {
      if (inputKind == AnalysisInputKind.screenplay) {
        return api
            .createDocumentAnalysis(
              documentId: sourceId,
              idempotencyKey: idempotencyKey,
              analysisRequest: body,
            )
            .then((value) => value.data?.data);
      }
      return api
          .createAnalysis(
            downloadId: sourceId,
            idempotencyKey: idempotencyKey,
            analysisRequest: body,
          )
          .then((value) => value.data?.data);
    });
  }

  @override
  Future<void> delete(String analysisId) {
    return _request.execute((client) async {
      await client.getAnalysesApi().deleteAnalysis(analysisId: analysisId);
    });
  }

  @override
  Future<AnalysisResponse> fetch(String analysisId) => _required(
    (api) async => (await api.getAnalysis(analysisId: analysisId)).data?.data,
  );

  @override
  Future<AnalysisResponse?> fetchLatest({
    required AnalysisInputKind inputKind,
    required String sourceId,
  }) {
    return _request.execute((client) async {
      final api = client.getAnalysesApi();
      final response = inputKind == AnalysisInputKind.screenplay
          ? await api.getLatestDocumentAnalysis(documentId: sourceId)
          : await api.getLatestDownloadAnalysis(downloadId: sourceId);
      return response.data?.data;
    });
  }

  @override
  Future<List<AnalysisSkillResponse>> fetchSkills(AnalysisInputKind inputKind) {
    return _request.execute((client) async {
      final response = await client.getAnalysesApi().listAnalysisSkills(
        inputKind: inputKind,
      );
      final data = response.data?.data;
      if (data == null) {
        throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
      }
      return data.toList(growable: false);
    });
  }

  @override
  Future<AnalysisResponse> retry({
    required String analysisId,
    required String idempotencyKey,
  }) => _required(
    (api) async => (await api.retryAnalysis(
      analysisId: analysisId,
      idempotencyKey: idempotencyKey,
    )).data?.data,
  );

  Future<AnalysisResponse> _required(
    Future<AnalysisResponse?> Function(AnalysesApi api) operation,
  ) {
    return _request.execute((client) async {
      final data = await operation(client.getAnalysesApi());
      if (data == null) {
        throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
      }
      return data;
    });
  }
}
