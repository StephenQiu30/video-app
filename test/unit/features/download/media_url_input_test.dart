import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/download/application/media_url_input.dart';

void main() {
  group('normalizeMediaUrl', () {
    test('accepts direct public HTTP and HTTPS URLs', () {
      expect(
        normalizeMediaUrl(' https://media.example/video?id=42 '),
        'https://media.example/video?id=42',
      );
      expect(
        normalizeMediaUrl('http://media.example/video'),
        'http://media.example/video',
      );
    });

    test(
      'extracts one URL from share text and removes trailing punctuation',
      () {
        expect(
          normalizeMediaUrl('复制链接 https://media.example/video?id=42。 打开帧取'),
          'https://media.example/video?id=42',
        );
      },
    );

    test('rejects blank, non-HTTP, credential, and multiple URLs', () {
      for (final value in [
        '',
        'not a URL',
        'ftp://media.example/video',
        'https://user:secret@media.example/video',
        'https://one.example/a https://two.example/b',
      ]) {
        expect(normalizeMediaUrl(value), isNull, reason: value);
      }
    });
  });
}
