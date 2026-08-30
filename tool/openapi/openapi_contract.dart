import 'openapi_config.dart';

Map<String, Object?> buildAppOpenApi(
  Map<String, Object?> source,
  AppOpenApiConfig config,
) {
  final sourcePaths = _map(source['paths'], 'paths');
  final selectedPaths = <String, Object?>{};
  final operationIds = <String>{};

  for (final selection in config.operations) {
    final pathItem = _map(sourcePaths[selection.path], selection.path);
    final sourceOperation = _map(
      pathItem[selection.method],
      '${selection.method.toUpperCase()} ${selection.path}',
    );
    final operation = Map<String, Object?>.from(sourceOperation);
    final allowedParameters = selection.queryParameters;
    if (allowedParameters != null) {
      operation['parameters'] = _list(operation['parameters'])
          .where(
            (value) =>
                allowedParameters.contains(_map(value, 'parameter')['name']),
          )
          .toList(growable: false);
    }
    final operationId = operation['operationId'];
    if (operationId is! String || operationId.isEmpty) {
      throw FormatException(
        '${selection.method.toUpperCase()} ${selection.path} has no operationId.',
      );
    }
    if (!operationIds.add(operationId)) {
      throw FormatException('Duplicate operationId: $operationId.');
    }
    if (operationId == 'getDownloadThumbnail' ||
        operationId == 'getInspectionThumbnail') {
      _declareBinaryResponse(operation);
    }
    selectedPaths[selection.path] = <String, Object?>{
      selection.method: operation,
    };
  }

  final components = _map(source['components'], 'components');
  final sourceSchemas = _map(components['schemas'], 'components.schemas');
  final schemaNames = _collectSchemaClosure(selectedPaths, sourceSchemas);
  final selectedSchemas = <String, Object?>{};
  for (final name in schemaNames.toList()..sort()) {
    selectedSchemas[name] = sourceSchemas[name];
  }
  final securitySchemes = _map(
    components['securitySchemes'],
    'components.securitySchemes',
  );
  final bearer = securitySchemes['NativeBearerAuth'];
  if (bearer == null) {
    throw const FormatException('NativeBearerAuth is missing.');
  }

  return <String, Object?>{
    'openapi': source['openapi'],
    'info': <String, Object?>{
      'title': '帧取 App API',
      'description': 'Flutter iOS 与 Android 客户端使用的冻结 Bearer 契约来源。',
      'version': '1.3.0',
    },
    'paths': selectedPaths,
    'components': <String, Object?>{
      'schemas': selectedSchemas,
      'securitySchemes': <String, Object?>{'NativeBearerAuth': bearer},
    },
  };
}

void _declareBinaryResponse(Map<String, Object?> operation) {
  final responses = _map(operation['responses'], 'responses');
  final success = _map(responses['200'], 'responses.200');
  final content = _map(success['content'], 'responses.200.content');
  for (final entry in content.entries) {
    final media = _map(entry.value, 'responses.200.content.${entry.key}');
    media['schema'] = <String, Object?>{'type': 'string', 'format': 'binary'};
    content[entry.key] = media;
  }
  success['content'] = content;
  responses['200'] = success;
  operation['responses'] = responses;
}

Set<String> _collectSchemaClosure(Object? paths, Map<String, Object?> schemas) {
  final names = _schemaReferences(paths);
  final pending = [...names];
  while (pending.isNotEmpty) {
    final name = pending.removeLast();
    final schema = schemas[name];
    if (schema == null) {
      throw FormatException('Missing schema: $name.');
    }
    for (final dependency in _schemaReferences(schema)) {
      if (names.add(dependency)) {
        pending.add(dependency);
      }
    }
  }
  return names;
}

Set<String> _schemaReferences(Object? value) {
  const prefix = '#/components/schemas/';
  final result = <String>{};
  void visit(Object? node) {
    if (node is Map) {
      final reference = node[r'$ref'];
      if (reference is String && reference.startsWith(prefix)) {
        result.add(reference.substring(prefix.length));
      }
      for (final child in node.values) {
        visit(child);
      }
    } else if (node is List) {
      for (final child in node) {
        visit(child);
      }
    }
  }

  visit(value);
  return result;
}

Map<String, Object?> _map(Object? value, String label) {
  if (value is! Map) {
    throw FormatException('$label must be an object.');
  }
  return value.map((key, value) => MapEntry(key.toString(), value));
}

List<Object?> _list(Object? value) {
  if (value == null) return const [];
  if (value is! List) {
    throw const FormatException('parameters must be a list.');
  }
  return value.cast<Object?>();
}
