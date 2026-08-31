import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/theme_preference_store.dart';

final themeModeProvider = NotifierProvider<ThemeModeController, ThemeMode>(
  ThemeModeController.new,
);

final class ThemeModeController extends Notifier<ThemeMode> {
  bool _changed = false;

  @override
  ThemeMode build() {
    unawaited(_restore());
    return ThemeMode.light;
  }

  Future<void> setDark({required bool dark}) async {
    _changed = true;
    state = dark ? ThemeMode.dark : ThemeMode.light;
    try {
      await ref.read(themePreferenceStoreProvider).write(state);
    } catch (_) {
      // A storage failure must not prevent the in-memory theme change.
    }
  }

  Future<void> _restore() async {
    try {
      final stored = await ref.read(themePreferenceStoreProvider).read();
      if (!_changed && stored != null) state = stored;
    } catch (_) {
      // Keep the deterministic light default when preferences are unavailable.
    }
  }
}
