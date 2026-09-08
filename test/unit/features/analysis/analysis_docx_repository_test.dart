import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/analysis/data/analysis_docx_repository.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:video_server_api/video_server_api.dart';

void main() {
  test('DOCX export uses generated authenticated binary request', () async {
    final client = VideoServerApi();
    RequestOptions? sent;
    client.dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          sent = options;
          handler.resolve(
            Response(
              requestOptions: options,
              statusCode: 200,
              data: Uint8List.fromList([80, 75, 3, 4]),
            ),
          );
        },
      ),
    );
    final repository = AnalysisDocxRepository(
      AuthenticatedRequest(
        client: client,
        accessToken: () => 'synthetic-access',
        sessionGeneration: () => 0,
        expireSession: () async {},
        refreshSession: () async => false,
      ),
    );
    final bytes = await repository.fetch('qa-report');
    expect(bytes, [80, 75, 3, 4]);
    expect(sent!.path, '/api/analyses/qa-report/report.docx');
    expect(sent!.responseType, ResponseType.bytes);
    expect(sent!.headers['Authorization'], 'Bearer synthetic-access');
  });
}
