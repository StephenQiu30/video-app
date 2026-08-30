final class OpenApiOperationSelection {
  const OpenApiOperationSelection({
    required this.method,
    required this.path,
    this.queryParameters,
  });

  final String method;
  final String path;
  final Set<String>? queryParameters;
}

final class AppOpenApiConfig {
  const AppOpenApiConfig({
    required this.defaultSchemaUrl,
    required this.generatorImage,
    required this.operations,
  });

  final String defaultSchemaUrl;
  final String generatorImage;
  final List<OpenApiOperationSelection> operations;
}

const appOpenApiConfig = AppOpenApiConfig(
  defaultSchemaUrl: 'http://127.0.0.1:8111/openapi.json',
  generatorImage: 'openapitools/openapi-generator-cli:v7.22.0',
  operations: [
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/app/v1/auth/register',
    ),
    OpenApiOperationSelection(method: 'post', path: '/api/app/v1/auth/login'),
    OpenApiOperationSelection(method: 'get', path: '/api/app/v1/auth/me'),
    OpenApiOperationSelection(method: 'post', path: '/api/app/v1/auth/refresh'),
    OpenApiOperationSelection(method: 'post', path: '/api/app/v1/auth/logout'),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/downloads/history',
      queryParameters: {'page', 'page_size'},
    ),
    OpenApiOperationSelection(method: 'get', path: '/api/downloads/{job_id}'),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/downloads/{job_id}/thumbnail',
    ),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/inspections/{inspection_id}/thumbnail',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/downloads/{job_id}/download-url',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/downloads/{job_id}/cancel',
    ),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/downloads/{job_id}/retry',
    ),
    OpenApiOperationSelection(method: 'get', path: '/api/documents'),
    OpenApiOperationSelection(method: 'get', path: '/api/providers'),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/admin/downloads/analytics',
      queryParameters: {'days'},
    ),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/admin/files',
      queryParameters: {'page', 'page_size'},
    ),
    OpenApiOperationSelection(method: 'post', path: '/api/admin/files/cleanup'),
    OpenApiOperationSelection(
      method: 'get',
      path: '/api/admin/users',
      queryParameters: {'page', 'page_size'},
    ),
    OpenApiOperationSelection(
      method: 'patch',
      path: '/api/admin/users/{user_id}',
    ),
    OpenApiOperationSelection(method: 'get', path: '/api/admin/providers'),
    OpenApiOperationSelection(
      method: 'patch',
      path: '/api/admin/providers/{provider_key}',
    ),
    OpenApiOperationSelection(method: 'get', path: '/api/admin/ai-providers'),
    OpenApiOperationSelection(
      method: 'post',
      path: '/api/admin/ai-providers/{provider_key}/activate',
    ),
  ],
);
