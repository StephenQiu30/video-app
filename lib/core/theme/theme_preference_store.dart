import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themePreferenceStoreProvider = Provider<ThemePreferenceStore>(
  (_) => SharedPreferencesThemePreferenceStore(),
);

abstract interface class ThemePreferenceStore {
  Future<ThemeMode?> read();

  Future<void> write(ThemeMode mode);
}

final class SharedPreferencesThemePreferenceStore
    implements ThemePreferenceStore {
  static const _key = 'framegrab_theme';

  final SharedPreferencesAsync _preferences = SharedPreferencesAsync();

  @override
  Future<ThemeMode?> read() async {
    return switch (await _preferences.getString(_key)) {
      'dark' => ThemeMode.dark,
      'light' => ThemeMode.light,
      _ => null,
    };
  }

  @override
  Future<void> write(ThemeMode mode) async {
    final value = mode == ThemeMode.dark ? 'dark' : 'light';
    await _preferences.setString(_key, value);
  }
}
