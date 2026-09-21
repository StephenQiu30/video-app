import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/bootstrap.dart';
import 'package:integration_test/integration_test.dart';

// Optional, non-mutating QA against the configured service and an existing
// simulator session. It never creates an account or changes server data.
void main() {
  const enabled = bool.fromEnvironment('LIVE_HISTORY_QA');
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('existing session renders the live download history envelope', (
    tester,
  ) async {
    bootstrap();
    await tester.pumpAndSettle(const Duration(milliseconds: 200));

    final historyTab = find.byKey(const Key('app-tab-1'));
    expect(
      historyTab,
      findsOneWidget,
      reason: 'The simulator must already contain a valid native session.',
    );
    await tester.tap(historyTab);
    await tester.pumpAndSettle(const Duration(milliseconds: 200));

    expect(find.byKey(const Key('download-summary-total')), findsOneWidget);
    expect(find.text('暂时无法读取数据'), findsNothing);
    expect(tester.takeException(), isNull);
    await binding.takeScreenshot('live-history-envelope');
  }, skip: !enabled);
}
