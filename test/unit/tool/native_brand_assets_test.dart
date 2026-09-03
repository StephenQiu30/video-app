import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('iOS AppIcon entries use complete opaque brand PNGs', () {
    final appIconDirectory = Directory(
      'ios/Runner/Assets.xcassets/AppIcon.appiconset',
    );
    final contents =
        jsonDecode(
              File('${appIconDirectory.path}/Contents.json').readAsStringSync(),
            )
            as Map<String, Object?>;
    final images = contents['images']! as List<Object?>;

    expect(images, isNotEmpty);
    for (final item in images.cast<Map<String, Object?>>()) {
      final filename = item['filename']! as String;
      final declaredSize = (item['size']! as String).split('x').first;
      final scale = (item['scale']! as String).replaceAll('x', '');
      final expectedPixels = (double.parse(declaredSize) * int.parse(scale))
          .round();
      final png = _readPng(File('${appIconDirectory.path}/$filename'));

      expect(png.width, expectedPixels, reason: filename);
      expect(png.height, expectedPixels, reason: filename);
      expect(png.colorType, 2, reason: '$filename must not contain alpha');
    }

    expect(
      File(
        '${appIconDirectory.path}/Icon-App-1024x1024@1x.png',
      ).readAsBytesSync(),
      File('assets/brand/app_icon.png').readAsBytesSync(),
    );
  });

  test('native launchers and Framegrab bundle identity are configured', () {
    for (final density in ['mdpi', 'hdpi', 'xhdpi', 'xxhdpi', 'xxxhdpi']) {
      final directory = Directory('android/app/src/main/res/mipmap-$density');
      expect(File('${directory.path}/ic_launcher.png').existsSync(), isTrue);
      expect(
        File('${directory.path}/ic_launcher_round.png').existsSync(),
        isTrue,
      );
      expect(
        File('${directory.path}/ic_launcher_foreground.png').existsSync(),
        isTrue,
      );
    }

    final infoPlist = File('ios/Runner/Info.plist').readAsStringSync();
    expect(infoPlist, contains('<string>帧取</string>'));
    expect(infoPlist, contains('<key>UTExportedTypeDeclarations</key>'));
    expect(
      infoPlist,
      contains('<string>com.stephenqiu.framegrab.fountain</string>'),
    );
    expect(infoPlist, contains('<string>fountain</string>'));
    final project = File(
      'ios/Runner.xcodeproj/project.pbxproj',
    ).readAsStringSync();
    expect(
      project,
      contains('PRODUCT_BUNDLE_IDENTIFIER = com.stephenqiu.framegrab;'),
    );
    final manifest = File(
      'android/app/src/main/AndroidManifest.xml',
    ).readAsStringSync();
    expect(manifest, contains('android:icon="@mipmap/ic_launcher"'));
    expect(manifest, contains('android:roundIcon="@mipmap/ic_launcher_round"'));
  });
}

({int colorType, int height, int width}) _readPng(File file) {
  expect(file.existsSync(), isTrue, reason: file.path);
  final bytes = file.readAsBytesSync();
  expect(bytes.sublist(0, 8), [137, 80, 78, 71, 13, 10, 26, 10]);
  return (
    width: _uint32(bytes, 16),
    height: _uint32(bytes, 20),
    colorType: bytes[25],
  );
}

int _uint32(Uint8List bytes, int offset) =>
    ByteData.sublistView(bytes, offset, offset + 4).getUint32(0);
