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
    OpenApiOperationSelection(method: 'get', path: '/api/documents'),
    OpenApiOperationSelection(method: 'get', path: '/api/providers'),
  ],
);
