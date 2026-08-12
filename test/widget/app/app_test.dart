import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/app/app.dart';

void main() {
  testWidgets('renders the honest Flutter foundation state', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: FramegrabApp(locale: Locale('zh'))),
    );
    await tester.pumpAndSettle();

    expect(find.text('帧取'), findsOneWidget);
    expect(find.text('把视频，\n带回本地。'), findsOneWidget);
    expect(find.textContaining('当前只固化技术选型'), findsOneWidget);
    expect(find.textContaining('业务页面、原生会话'), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
