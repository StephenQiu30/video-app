import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/theme_mode_controller.dart';
import 'package:framegrab/core/theme/theme_preference_store.dart';

import '../../../support/theme_fakes.dart';

void main() {
  test('restores a persisted dark preference', () async {
    final store = MemoryThemePreferenceStore(ThemeMode.dark);
    final container = ProviderContainer(
      overrides: [themePreferenceStoreProvider.overrideWithValue(store)],
    );
    addTearDown(container.dispose);

    container.read(themeModeProvider);
    await Future<void>.delayed(Duration.zero);

    expect(container.read(themeModeProvider), ThemeMode.dark);
  });

  test('persists light and dark selections', () async {
    final store = MemoryThemePreferenceStore();
    final container = ProviderContainer(
      overrides: [themePreferenceStoreProvider.overrideWithValue(store)],
    );
    addTearDown(container.dispose);
    container.read(themeModeProvider);

    await container.read(themeModeProvider.notifier).setDark(dark: true);
    expect(container.read(themeModeProvider), ThemeMode.dark);
    expect(store.value, ThemeMode.dark);

    await container.read(themeModeProvider.notifier).setDark(dark: false);
    expect(container.read(themeModeProvider), ThemeMode.light);
    expect(store.value, ThemeMode.light);
  });
}
