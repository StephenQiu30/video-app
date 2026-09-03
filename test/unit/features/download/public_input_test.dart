import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/download/application/public_input.dart';

void main() {
  test('only the empty-input guard runs on the client', () {
    expect(hasPublicInput('not-a-url'), isTrue);
    expect(hasPublicInput('  '), isFalse);
  });

  test('detects article workflow input without rewriting the value', () {
    const input = '文章标题\nhttps://mp.weixin.qq.com/s/article_123\n复制分享';

    expect(containsWeChatArticleInput(input), isTrue);
    expect(containsWeChatArticleInput('https://media.example/video'), isFalse);
  });
}
