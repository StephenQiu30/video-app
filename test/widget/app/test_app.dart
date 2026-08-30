import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/app/app.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/data/refresh_credential_store.dart';
import 'package:framegrab/features/download/application/inspect_media_intent.dart';

import '../../support/auth_fakes.dart';

Future<void> pumpFramegrabApp(
  WidgetTester tester, {
  InspectMediaIntent? inspect,
  NativeAuthGateway? authGateway,
  RefreshCredentialStore? credentialStore,
  Locale locale = const Locale('zh'),
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        if (inspect != null)
          inspectMediaIntentProvider.overrideWithValue(inspect),
        nativeAuthGatewayProvider.overrideWithValue(
          authGateway ?? FakeAuthGateway(),
        ),
        refreshCredentialStoreProvider.overrideWithValue(
          credentialStore ?? MemoryCredentialStore('refresh-test'),
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
