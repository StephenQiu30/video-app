import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../../../tool/openapi/openapi_config.dart';
import '../../../tool/openapi/openapi_contract.dart';

void main() {
  test('selects reviewed operations and removes unused history filters', () {
    final decoded =
        jsonDecode(
              File(
                'contracts/openapi/video-server.openapi.json',
              ).readAsStringSync(),
            )
            as Map<String, dynamic>;
    final paths = decoded['paths'] as Map<String, dynamic>;
    final history = paths['/api/downloads/history'] as Map<String, dynamic>;
    final get = history['get'] as Map<String, dynamic>;
    final parameters = get['parameters'] as List<dynamic>;
    parameters.addAll([
      {'name': 'status', 'in': 'query'},
      {'name': 'search', 'in': 'query'},
    ]);

    final contract = buildAppOpenApi(decoded, appOpenApiConfig);
    final selectedPaths = contract['paths'] as Map<String, dynamic>;
    final selectedHistory =
        selectedPaths['/api/downloads/history'] as Map<String, dynamic>;
    final selectedGet = selectedHistory['get'] as Map<String, dynamic>;
    final selectedParameters = selectedGet['parameters'] as List<dynamic>;

    expect(selectedPaths, hasLength(9));
    expect(selectedPaths, contains('/api/downloads/{job_id}'));
    expect(
      selectedParameters.map((value) {
        return (value as Map<String, dynamic>)['name'];
      }),
      ['page', 'page_size'],
    );
    final components = contract['components'] as Map<String, dynamic>;
    final schemas = components['schemas'] as Map<String, dynamic>;
    expect(schemas, contains('DownloadHistoryItemResponse'));
    expect(schemas, contains('DownloadResponse'));
    expect(schemas, contains('DocumentResponse'));
    expect(schemas, contains('ProviderStatusResponse'));
  });
}
