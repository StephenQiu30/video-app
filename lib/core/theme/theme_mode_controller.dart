import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = NotifierProvider<ThemeModeController, ThemeMode>(
  ThemeModeController.new,
);

final class ThemeModeController extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.system;

  void setDark({required bool dark}) {
    state = dark ? ThemeMode.dark : ThemeMode.light;
  }
}

extension ThemeModeResolution on ThemeMode {
  bool resolvesToDark(Brightness platformBrightness) {
    return switch (this) {
      ThemeMode.dark => true,
      ThemeMode.light => false,
      ThemeMode.system => platformBrightness == Brightness.dark,
    };
  }
}
