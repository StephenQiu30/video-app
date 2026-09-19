import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/admin/presentation/provider_runtime_panel.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

void main() {
  testWidgets('diagnostics are lazy, bounded while loading, and retry errors', (
    tester,
  ) async {
    var calls = 0;
    final pending = Completer<ProviderRuntimeListResponse>();
    await tester.pumpWidget(
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
        child: MaterialApp(
          locale: const Locale('zh'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Scaffold(body: ProviderRuntimePanel()),
        ),
      ),
    );
    expect(calls, 0);
    await tester.tap(find.byType(TextButton));
    await tester.pump();
    expect(calls, 1);
    expect(
      tester.widget<TextButton>(find.byType(TextButton)).onPressed,
      isNull,
    );
    pending.completeError(StateError('offline'));
    await tester.pumpAndSettle();
    final l10n = AppLocalizations.of(
      tester.element(find.byType(ProviderRuntimePanel)),
    );
    expect(find.text(l10n.serviceUnavailableError), findsOneWidget);
    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();
    expect(calls, 2);
    expect(find.text(l10n.providerEmptyDescription), findsOneWidget);
  });
}
