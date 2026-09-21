import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/admin/presentation/provider_runtime_panel.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/shad_test_app.dart';

void main() {
  testWidgets('diagnostics are lazy, bounded while loading, and retry errors', (
    tester,
  ) async {
    var calls = 0;
    final pending = Completer<ProviderRuntimeListResponse>();
    await pumpShadWidget(
      tester,
      ProviderScope(
        overrides: [
          providerRuntimeProvider.overrideWith((ref) {
            calls++;
            if (calls == 1) return pending.future;
            return ProviderRuntimeListResponse(
              (b) => b.snapshotMaxAgeSeconds = 30,
            );
          }),
        ],
        child: ShadTestApp(
          locale: const Locale('zh'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Scaffold(body: ProviderRuntimePanel()),
        ),
      ),
    );
    await tester.pump();
    expect(calls, 0);
    await tester.tap(find.byType(ShadButton));
    await tester.pump();
    expect(calls, 1);
    expect(
      tester.widget<ShadButton>(find.byType(ShadButton)).onPressed,
      isNull,
    );
    pending.completeError(StateError('offline'));
    await tester.pumpAndSettle();
    final l10n = AppLocalizations.of(
      tester.element(find.byType(ProviderRuntimePanel)),
    );
    expect(find.text(l10n.serviceUnavailableError), findsOneWidget);
    await tester.tap(find.byType(ShadButton));
    await tester.pumpAndSettle();
    expect(calls, 2);
    expect(find.text(l10n.providerEmptyDescription), findsOneWidget);
  });
}
