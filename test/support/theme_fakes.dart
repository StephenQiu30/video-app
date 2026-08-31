import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/theme_preference_store.dart';

final class MemoryThemePreferenceStore implements ThemePreferenceStore {
  MemoryThemePreferenceStore([this.value]);

  ThemeMode? value;

  @override
  Future<ThemeMode?> read() async => value;

  @override
  Future<void> write(ThemeMode mode) async => value = mode;
}
