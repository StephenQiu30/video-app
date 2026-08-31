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

    test('extracts a Douyin short URL from the full copied share message', () {
      const shareMessage =
          '0.53 复制打开抖音，看看【喵了个喵-的图文作品】你笑面如花 '
          '真想与你情定香格里拉.# 我与天坛 '
          'https://v.douyin.com/Z8wTCSQ-1_g/ M@j.cn EHv:/ 04/10 :3pm';

      expect(
        normalizeMediaUrl(shareMessage),
        'https://v.douyin.com/Z8wTCSQ-1_g/',
      );
    });

    test('removes an ASCII closing parenthesis around a share URL', () {
      expect(
        normalizeMediaUrl('(https://v.douyin.com/Z8wTCSQ-1_g/)'),
        'https://v.douyin.com/Z8wTCSQ-1_g/',
      );
    });

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
