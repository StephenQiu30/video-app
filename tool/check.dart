import 'dart:io';

const expectedFlutterVersion = '3.44.7';

Future<void> main() async {
  try {
    final version = await Process.run('flutter', ['--version']);
    if (version.exitCode != 0) {
      throw StateError('Unable to read the Flutter version.');
    }
    final output = version.stdout as String;
    final match = RegExp(
      r'^Flutter ([^ ]+)',
      multiLine: true,
    ).firstMatch(output);
    final actual = match?.group(1);
    if (actual != expectedFlutterVersion) {
      throw StateError(
        'Expected Flutter $expectedFlutterVersion, found ${actual ?? 'unknown'}.',
      );
    }

    await _run('flutter', ['pub', 'get']);
    await _run('flutter', ['gen-l10n']);
    await _run(Platform.resolvedExecutable, [
      'format',
      '--output=none',
      '--set-exit-if-changed',
      '.',
    ]);
    await _run('flutter', ['analyze']);
    await _run('flutter', ['test']);
  } catch (error) {
    stderr.writeln('Quality check failed: $error');
    exitCode = 1;
  }
}

Future<void> _run(String executable, List<String> arguments) async {
  final process = await Process.start(
    executable,
    arguments,
    mode: ProcessStartMode.inheritStdio,
  );
  final result = await process.exitCode;
  if (result != 0) {
    throw ProcessException(
      executable,
      arguments,
      'Exited with $result.',
      result,
    );
  }
}
