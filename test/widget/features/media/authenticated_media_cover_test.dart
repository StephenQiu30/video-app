import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/features/media/application/media_thumbnail_provider.dart';
import 'package:framegrab/features/media/presentation/authenticated_media_cover.dart';
import 'package:framegrab/l10n/app_localizations.dart';

void main() {
  const thumbnailPath =
      '/api/downloads/11111111-1111-4111-8111-111111111111/thumbnail';

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

  for (final dimensions in [(160, 90), (90, 160), (100, 100)]) {
    for (final frameWidth in [112.0, 320.0]) {
      testWidgets(
        'fills a stable frame at width $frameWidth for source $dimensions proportionally',
        (tester) async {
          final bytes = await tester.runAsync(() async {
            final recorder = ui.PictureRecorder();
            Canvas(recorder).drawColor(Colors.green, BlendMode.src);
            final picture = recorder.endRecording();
            final image = await picture.toImage(dimensions.$1, dimensions.$2);
            final data = await image.toByteData(format: ui.ImageByteFormat.png);
            image.dispose();
            picture.dispose();
            return data!.buffer.asUint8List();
          });
          // The gate keeps the loading state observable before decoding.
          final ready = Completer<void>();
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                mediaThumbnailProvider(thumbnailPath).overrideWith((ref) async {
                  await ready.future;
                  return bytes!;
                }),
              ],
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
                  body: SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: frameWidth,
                        child: AuthenticatedMediaCover(
                          alt: '测试视频 视频封面',
                          compact: frameWidth == 112,
                          source: thumbnailPath,
                          title: '测试视频标题',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );

          final expectedSize = Size(
            frameWidth,
            frameWidth / mediaFrameAspectRatio,
          );
          expect(
            tester.getSize(find.byType(AuthenticatedMediaCover)),
            expectedSize,
          );
          await tester.runAsync(
            () => precacheImage(
              MemoryImage(bytes!),
              tester.element(find.byType(AuthenticatedMediaCover)),
            ),
          );
          ready.complete();
          await tester.pumpAndSettle();
          expect(
            tester.getSize(find.byType(AuthenticatedMediaCover)),
            expectedSize,
          );
          final rendered = tester.renderObject<RenderImage>(
            find.byType(RawImage),
          );
          expect(rendered.image!.width, dimensions.$1);
          expect(rendered.image!.height, dimensions.$2);
          final images = tester.widgetList<Image>(find.byType(Image)).toList();
          expect(images, hasLength(1));
          final image = images.single;
          expect(image.fit, BoxFit.cover);
          final source = Size(
            dimensions.$1.toDouble(),
            dimensions.$2.toDouble(),
          );
          final fitted = applyBoxFit(image.fit!, source, rendered.size);
          expect(fitted.destination, rendered.size);
          expect(fitted.source.width, lessThanOrEqualTo(source.width));
          expect(fitted.source.height, lessThanOrEqualTo(source.height));
          expect(
            fitted.source.aspectRatio,
            closeTo(fitted.destination.aspectRatio, 0.0001),
          );
          expect(tester.takeException(), isNull);
        },
      );
    }
  }
}
