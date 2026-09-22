import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/download/application/download_intake_controller.dart';
import 'package:framegrab/features/download/presentation/download_intake_workspace.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/intake_fakes.dart';
import '../../../support/shad_test_app.dart';

void main() {
  testWidgets('offers a read-only retry when a ready inspection GET fails', (
    tester,
  ) async {
    var retryCount = 0;
    await _pumpWorkspace(
      tester,
      DownloadIntakeState(
        intent: intentFixture(),
        error: const DataRequestFailure(DataRequestFailureKind.unavailable),
      ),
      onRetry: () => retryCount++,
    );

    expect(find.text('重新加载'), findsOneWidget);
    await tester.tap(find.text('重新加载'));
    expect(retryCount, 1);
  });

  testWidgets('explains a failed intent with its provider reason', (
    tester,
  ) async {
    await _pumpWorkspace(
      tester,
      DownloadIntakeState(
        intent: intentFixture(
          status: IntentStatus.failed,
          reasonCode: 'provider_verification_failed',
        ),
      ),
    );

    expect(find.textContaining('媒体平台当前无法完成验证'), findsOneWidget);
  });
}

Future<void> _pumpWorkspace(
  WidgetTester tester,
  DownloadIntakeState state, {
  VoidCallback? onRetry,
}) => pumpShadWidget(
  tester,
  ShadTestApp(
    locale: const Locale('zh'),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: SingleChildScrollView(
        child: DownloadIntakeWorkspace(
          onCancelIntent: () {},
          onCreate: () {},
          onOpenJob: (_) {},
          onRefreshIntent: () {},
          onRetryInspection: onRetry ?? () {},
          onSelectFormat: (_) {},
          onSelectItem: (_) {},
          state: state,
        ),
      ),
    ),
  ),
);
