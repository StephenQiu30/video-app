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
    final selectedUsers =
        selectedPaths['/api/admin/users'] as Map<String, dynamic>;
    final selectedUserParameters =
        (selectedUsers['get'] as Map<String, dynamic>)['parameters']
            as List<dynamic>;

    expect(selectedPaths, hasLength(23));
    expect(selectedPaths, contains('/api/downloads/{job_id}'));
    expect(selectedPaths, contains('/api/downloads/{job_id}/download-url'));
    expect(selectedPaths, contains('/api/admin/users'));
    expect(
      selectedParameters.map((value) {
        return (value as Map<String, dynamic>)['name'];
      }),
      ['page', 'page_size'],
    );
    expect(
      selectedUserParameters.map((value) {
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
    expect(schemas, contains('DownloadUrlResponse'));
    expect(schemas, contains('ManagedUserResponse'));
    final thumbnail =
        selectedPaths['/api/downloads/{job_id}/thumbnail']
            as Map<String, dynamic>;
    final thumbnailGet = thumbnail['get'] as Map<String, dynamic>;
    final thumbnailResponses =
        thumbnailGet['responses'] as Map<String, dynamic>;
    final thumbnailSuccess = thumbnailResponses['200'] as Map<String, dynamic>;
    final thumbnailContent =
        thumbnailSuccess['content'] as Map<String, dynamic>;
    final jpeg = thumbnailContent['image/jpeg'] as Map<String, dynamic>;
    expect(jpeg['schema'], {'type': 'string', 'format': 'binary'});
  });
}
