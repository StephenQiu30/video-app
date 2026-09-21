import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  final directory = Directory(
    '${Directory.systemTemp.path}/framefetch-shadcn-evidence',
  );
  await directory.create(recursive: true);
  await integrationDriver(
    onScreenshot: (name, bytes, [args]) async {
      final file = File('${directory.path}/$name.png');
      await file.writeAsBytes(bytes);
      stdout.writeln('SHAD_SCREENSHOT=${file.path}');
      return true;
    },
  );
}
