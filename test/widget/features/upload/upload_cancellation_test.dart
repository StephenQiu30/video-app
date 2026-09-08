import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/upload_fakes.dart';
import '../../../support/upload_race_fakes.dart';
import '../../app/test_app.dart';

void main() {
  for (final locale in ['zh', 'en']) {
    testWidgets('$locale upload can be cancelled from Home and retried', (
      tester,
    ) async {
      await setMobileViewport(tester);
      final repository = DeferredContentUploadRepository();
      await pumpFramegrabApp(
        tester,
        locale: Locale(locale),
        uploadRepository: repository,
        localContentPicker: FakeLocalContentPicker(file: uploadTestFile),
      );
      await tester.tap(find.byKey(const ValueKey('content-intake-video')));
      await tester.pumpAndSettle();
      final select = find.byKey(const Key('select-video-file'));
      await tester.ensureVisible(select);
      await tester.pumpAndSettle();
      await tester.tap(select);
      await tester.pump();
      await tester.pump();
      final cancel = find.byKey(const Key('cancel-content-upload'));
      expect(
        find.text(locale == 'zh' ? '取消上传' : 'Cancel upload'),
        findsOneWidget,
      );
      await tester.ensureVisible(cancel);
      await tester.pump();
      await tester.tap(cancel);
      await tester.pumpAndSettle();
      expect(repository.operations.single.token.isCancelled, isTrue);
      expect(cancel, findsNothing);
      expect(tester.widget<FilledButton>(select).onPressed, isNotNull);

      repository.operations.single.onProgress(100);
      repository.operations.single.succeed();
      await tester.pumpAndSettle();
      expect(select, findsOneWidget);
      expect(find.byKey(const Key('content-upload-error')), findsNothing);
      await tester.ensureVisible(select);
      await tester.pumpAndSettle();
      await tester.tap(select);
      await tester.pump();
      await tester.pump();
      expect(repository.operations, hasLength(2));
      await tester.ensureVisible(cancel);
      await tester.pump();
      await tester.tap(cancel);
      repository.operations.last.succeed();
      await tester.pumpAndSettle();
    });
  }
}
