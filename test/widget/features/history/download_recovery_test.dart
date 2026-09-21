import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/features/history/application/download_retry.dart';
import 'package:framegrab/features/history/presentation/download_history_item.dart';
import 'package:framegrab/features/history/presentation/download_task_actions.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/data_fakes.dart';
import '../../../support/shad_test_app.dart';

void main() {
  for (final status in [
    DownloadStatus.failed,
    DownloadStatus.cancelled,
    DownloadStatus.succeeded,
  ]) {
    testWidgets('local $status detail and list never offer remote retry', (
      tester,
    ) async {
      final job = downloadDetailFixture().rebuild(
        (b) => b
          ..status = status
          ..sourceKind = DownloadSourceKind.browserImport
          ..fileAvailable = false,
      );
      final item = downloadHistoryFixture().items.first.rebuild(
        (b) => b
          ..status = status
          ..sourceKind = DownloadSourceKind.browserImport
          ..fileAvailable = false,
      );
      var calls = 0;
      await pumpShadWidget(
        tester,
        ProviderScope(
          overrides: [
            downloadRetryProvider(job.id).overrideWithValue(
              DownloadRetry(
                execute: (_) async {
                  calls++;
                  return job;
                },
                sessionGeneration: () => 0,
              ),
            ),
          ],
          child: ShadTestApp(
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
              body: Column(
                children: [
                  DownloadTaskActions(job: job),
                  DownloadHistoryItem(item: item, onTap: () {}),
                ],
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.text('重新下载'), findsNothing);
      expect(find.byKey(Key('retry-download-${job.id}')), findsNothing);
      expect(find.text('返回首页重新导入'), findsWidgets);
      expect(calls, 0);
      expect(tester.takeException(), isNull);
    });
  }
}
