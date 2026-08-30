import 'dart:convert';
import 'dart:io';

import 'openapi/openapi_config.dart';
import 'openapi/openapi_contract.dart';
import 'openapi/openapi_generator.dart';

Future<void> main(List<String> arguments) async {
  try {
    final options = _Options.parse(arguments);
    final root = _findProjectRoot();
    final source = await _fetchSchema(options.schemaUrl);
    final contract = buildAppOpenApi(source, appOpenApiConfig);
    final snapshot = File(
      '${root.path}/contracts/openapi/video-server.openapi.json',
    );
    await snapshot.writeAsString(
      '${const JsonEncoder.withIndent('  ').convert(contract)}\n',
    );
    stdout.writeln('Frozen App contract from ${options.schemaUrl}.');

    if (!options.snapshotOnly) {
      await generateDartClient(projectRoot: root, config: appOpenApiConfig);
      stdout.writeln('Generated packages/video_server_api with 7.22.0.');
    }
    if (options.check) {
      await verifyGeneratedClient(root);
    }
  } catch (error) {
    stderr.writeln('OpenAPI generation failed: $error');
    exitCode = 1;
  }
}

Future<Map<String, Object?>> _fetchSchema(String schemaUrl) async {
  final uri = Uri.parse(schemaUrl);
  if (uri.scheme != 'http' && uri.scheme != 'https') {
    throw ArgumentError.value(schemaUrl, 'schemaUrl', 'Use HTTP(S).');
  }
  final client = HttpClient()..connectionTimeout = const Duration(seconds: 10);
  try {
    final request = await client.getUrl(uri);
    final response = await request.close();
    final body = await utf8.decoder.bind(response).join();
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException('Schema returned ${response.statusCode}.', uri: uri);
    }
    final decoded = jsonDecode(body);
    if (decoded is! Map) {
      throw const FormatException('Schema must be an object.');
    }
    return decoded.map((key, value) => MapEntry(key.toString(), value));
  } finally {
    client.close(force: true);
  }
}

Directory _findProjectRoot() {
  var current = Directory.current.absolute;
  while (true) {
    if (File('${current.path}/pubspec.yaml').existsSync() &&
        Directory('${current.path}/contracts/openapi').existsSync()) {
      return current;
    }
    final parent = current.parent;
    if (parent.path == current.path) {
      throw StateError('Run this command inside the video-app repository.');
    }
    current = parent;
  }
}

final class _Options {
  const _Options({
    required this.check,
    required this.schemaUrl,
    required this.snapshotOnly,
  });

  final bool check;
  final String schemaUrl;
  final bool snapshotOnly;

  static _Options parse(List<String> arguments) {
    var schemaUrl =
        Platform.environment['OPENAPI_SCHEMA_URL'] ??
        appOpenApiConfig.defaultSchemaUrl;
    var check = false;
    var snapshotOnly = false;
    for (var index = 0; index < arguments.length; index += 1) {
      switch (arguments[index]) {
        case '--check':
          check = true;
        case '--snapshot-only':
          snapshotOnly = true;
        case '--schema-url':
          if (index + 1 >= arguments.length) {
            throw const FormatException('--schema-url requires a value.');
          }
          schemaUrl = arguments[++index];
        default:
          throw FormatException('Unknown argument: ${arguments[index]}');
      }
    }
    return _Options(
      check: check,
      schemaUrl: schemaUrl,
      snapshotOnly: snapshotOnly,
    );
  }
}
