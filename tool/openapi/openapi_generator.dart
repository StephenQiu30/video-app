import 'dart:io';

import 'openapi_config.dart';

Future<void> generateDartClient({
  required Directory projectRoot,
  required AppOpenApiConfig config,
}) async {
  final uid = (await _capture('id', ['-u'])).trim();
  final gid = (await _capture('id', ['-g'])).trim();
  await _run('docker', [
    'run',
    '--rm',
    '--user',
    '$uid:$gid',
    '--volume',
    '${projectRoot.path}:/local',
    config.generatorImage,
    'generate',
    '--input-spec',
    '/local/contracts/openapi/video-server.openapi.json',
    '--generator-name',
    'dart-dio',
    '--output',
    '/local/packages/video_server_api',
    '--config',
    '/local/tool/openapi/config.yaml',
  ], workingDirectory: projectRoot.path);

  final package = Directory('${projectRoot.path}/packages/video_server_api');
  await _normalizeGeneratedSources(package);
  await _run(Platform.resolvedExecutable, [
    'pub',
    'get',
  ], workingDirectory: package.path);
  await _run(Platform.resolvedExecutable, [
    'run',
    'build_runner',
    'build',
  ], workingDirectory: package.path);
  await _run(Platform.resolvedExecutable, [
    'fix',
    '--apply',
    '--code=unused_import',
  ], workingDirectory: package.path);
  await _run(Platform.resolvedExecutable, [
    'format',
    '.',
  ], workingDirectory: package.path);
  await _normalizeTextFiles(package);
}

Future<void> verifyGeneratedClient(Directory projectRoot) async {
  final result = await Process.run('git', [
    'status',
    '--porcelain',
    '--untracked-files=all',
    '--',
    'contracts/openapi/video-server.openapi.json',
    'packages/video_server_api',
  ], workingDirectory: projectRoot.path);
  final changes = (result.stdout as String).trim();
  if (result.exitCode != 0 || changes.isNotEmpty) {
    throw StateError(
      changes.isEmpty
          ? 'Unable to inspect generated files.'
          : 'OpenAPI drift:\n$changes',
    );
  }
}

Future<void> _normalizeGeneratedSources(Directory package) async {
  final pubspec = File('${package.path}/pubspec.yaml');
  var contents = await pubspec.readAsString();
  contents = contents.replaceFirst(
    "  sdk: '>=2.18.0 <4.0.0'",
    "  sdk: '>=3.0.0 <4.0.0'",
  );
  await pubspec.writeAsString(contents);

  final optional = File('${package.path}/lib/lib/optional.dart');
  contents = await optional.readAsString();
  contents = contents.replaceAll(
    'Object? readOptionalValue(Map map,',
    'Object? readOptionalValue(Map<dynamic, dynamic> map,',
  );
  await optional.writeAsString(contents);

  final generatedRoot = Directory('${package.path}/lib');
  await for (final entity in generatedRoot.list(
    recursive: true,
    followLinks: false,
  )) {
    if (entity is! File || !entity.path.endsWith('.dart')) continue;
    contents = await entity.readAsString();
    final normalized = contents.replaceFirst(
      '// ignore_for_file: unused_element',
      '// ignore_for_file: unused_element, unused_element_parameter',
    );
    if (normalized != contents) await entity.writeAsString(normalized);
  }
}

Future<void> _normalizeTextFiles(Directory root) async {
  await for (final entity in root.list(recursive: true, followLinks: false)) {
    if (entity is! File ||
        (!entity.path.endsWith('.dart') && !entity.path.endsWith('.md'))) {
      continue;
    }
    final original = await entity.readAsString();
    final normalized = original
        .split('\n')
        .map((line) => line.replaceFirst(RegExp(r'[ \t]+$'), ''))
        .join('\n')
        .replaceFirst(RegExp(r'\n*$'), '\n');
    if (normalized != original) await entity.writeAsString(normalized);
  }
}

Future<String> _capture(String executable, List<String> arguments) async {
  final result = await Process.run(executable, arguments);
  if (result.exitCode != 0) {
    throw ProcessException(
      executable,
      arguments,
      '${result.stderr}',
      result.exitCode,
    );
  }
  return result.stdout as String;
}

Future<void> _run(
  String executable,
  List<String> arguments, {
  required String workingDirectory,
}) async {
  final process = await Process.start(
    executable,
    arguments,
    workingDirectory: workingDirectory,
    mode: ProcessStartMode.inheritStdio,
  );
  final exitCode = await process.exitCode;
  if (exitCode != 0) {
    throw ProcessException(
      executable,
      arguments,
      'Exited with $exitCode.',
      exitCode,
    );
  }
}
