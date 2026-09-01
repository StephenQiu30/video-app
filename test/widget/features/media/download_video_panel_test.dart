import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/features/media/presentation/download_video_panel.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/data_fakes.dart';

void main() {
  testWidgets('WebM AV1 artifacts expose the bundled playback action', (
    tester,
  ) async {
    final webm = downloadDetailFixture().rebuild(
      (builder) => builder.format.update(
        (format) => format
          ..containerPreference = ContainerPreference.webm
          ..videoCodecFamily = VideoCodecFamily.av1
          ..audioCodecFamily = AudioCodecFamily.opus,
      ),
    );

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
            body: SingleChildScrollView(child: DownloadVideoPanel(job: webm)),
          ),
        ),
      ),
    );

    expect(find.byKey(const Key('watch-download-video')), findsOneWidget);
    expect(find.byKey(const Key('download-video-file')), findsOneWidget);
  });
}
