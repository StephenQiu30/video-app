import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/app/app.dart';
import 'package:framegrab/core/theme/theme_preference_store.dart';
import 'package:framegrab/features/analysis/data/analysis_repository.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/data/refresh_credential_store.dart';
import 'package:framegrab/features/documents/data/document_repository.dart';
import 'package:framegrab/features/download/data/download_intake_repository.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:framegrab/features/providers/data/provider_status_repository.dart';

import '../../support/analysis_fakes.dart';
import '../../support/auth_fakes.dart';
import '../../support/data_fakes.dart';
import '../../support/intake_fakes.dart';
import '../../support/theme_fakes.dart';

Future<void> pumpFramegrabApp(
  WidgetTester tester, {
  AnalysisRepository? analysisRepository,
  NativeAuthGateway? authGateway,
  RefreshCredentialStore? credentialStore,
  DocumentRepository? documentRepository,
  DownloadIntakeRepository? downloadIntakeRepository,
  DownloadHistoryRepository? downloadHistoryRepository,
  ProviderStatusRepository? providerStatusRepository,
  ThemePreferenceStore? themePreferenceStore,
  Locale locale = const Locale('zh'),
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        analysisRepositoryProvider.overrideWithValue(
          analysisRepository ?? FakeAnalysisRepository(),
        ),
        downloadIntakeRepositoryProvider.overrideWithValue(
          downloadIntakeRepository ?? FakeDownloadIntakeRepository(),
        ),
        nativeAuthGatewayProvider.overrideWithValue(
          authGateway ?? FakeAuthGateway(),
        ),
        refreshCredentialStoreProvider.overrideWithValue(
          credentialStore ?? MemoryCredentialStore('refresh-test'),
        ),
        documentRepositoryProvider.overrideWithValue(
          documentRepository ?? FakeDocumentRepository(),
        ),
        downloadHistoryRepositoryProvider.overrideWithValue(
          downloadHistoryRepository ?? FakeDownloadHistoryRepository(),
        ),
        providerStatusRepositoryProvider.overrideWithValue(
          providerStatusRepository ?? FakeProviderStatusRepository(),
        ),
        themePreferenceStoreProvider.overrideWithValue(
          themePreferenceStore ?? MemoryThemePreferenceStore(),
        ),
      ],
      child: FramegrabApp(locale: locale),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> setMobileViewport(WidgetTester tester) async {
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = const Size(390, 844);
  addTearDown(tester.view.reset);
}

void setAccessibilityTextScale(WidgetTester tester) {
  tester.platformDispatcher.textScaleFactorTestValue = 2;
  addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
}
