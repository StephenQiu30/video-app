import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/providers/application/provider_access.dart';
import 'package:framegrab/features/providers/presentation/provider_access_selector.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';
import '../../../support/data_fakes.dart';

void main() {
  testWidgets('only admits server policies and displays cooldown separately', (
    tester,
  ) async {
    final provider = providerFixture().items.first.rebuild(
      (b) => b
        ..routeRetryAt = DateTime.utc(2026, 9, 12, 16)
        ..accessPolicies.add(
          ProviderAccessPolicyResponse(
            (p) => p
              ..id = ProviderAccessPolicy.operatorPublic
              ..configured = false,
          ),
        ),
    );
    expect(providerForInput('分享 https://youtu.be/owned', [provider]), provider);
    expect(
      providerForInput('https://youtu.be.attacker.example/owned', [provider]),
      isNull,
    );
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('zh'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: ProviderAccessSelector(
            provider: provider,
            selected: ProviderAccessPolicy.public,
            busy: false,
            onChanged: (_) {},
          ),
        ),
      ),
    );
    final menu = tester.widget<DropdownMenu<ProviderAccessPolicy?>>(
      find.byType(DropdownMenu<ProviderAccessPolicy?>),
    );
    expect(menu.dropdownMenuEntries.length, 2);
    expect(menu.dropdownMenuEntries.last.enabled, isFalse);
    expect(find.textContaining('最早重试时间'), findsOneWidget);
    expect(find.textContaining('到期仍需验证恢复'), findsOneWidget);
  });
}
