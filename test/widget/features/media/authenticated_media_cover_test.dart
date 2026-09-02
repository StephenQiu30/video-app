import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/features/media/presentation/authenticated_media_cover.dart';
import 'package:framegrab/l10n/app_localizations.dart';

void main() {
  testWidgets('shows readable metadata when a cover is unavailable', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          locale: const Locale('zh'),
          theme: AppTheme.light,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: Scaffold(
            body: SizedBox(
              width: 320,
              child: AuthenticatedMediaCover(
                alt: '测试视频 视频封面',
                detail: '1080p MP4',
                eyebrow: 'YouTube',
                source: null,
                title: '测试视频标题',
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('暂无封面'), findsOneWidget);
    expect(find.text('YouTube'), findsOneWidget);
    expect(find.text('测试视频标题'), findsOneWidget);
    expect(find.text('1080p MP4'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('keeps the pending state distinct from a missing cover', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          locale: const Locale('zh'),
          theme: AppTheme.light,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: Scaffold(
            body: AuthenticatedMediaCover(
              alt: '测试视频 视频封面',
              pending: true,
              source: null,
              title: '测试视频标题',
            ),
          ),
        ),
      ),
    );

    expect(find.text('封面生成中'), findsOneWidget);
    expect(find.text('暂无封面'), findsNothing);
  });
}
