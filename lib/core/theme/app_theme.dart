import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const _radius = 6.0;

  static final ThemeData light = _build(
    brightness: Brightness.light,
    background: const Color(0xFFFAFAFA),
    foreground: const Color(0xFF0A0A0A),
    surface: const Color(0xFFF5F5F5),
    mutedForeground: const Color(0xFF686868),
    primary: const Color(0xFF111111),
    border: const Color(0xFFE6E6E6),
    error: const Color(0xFFB91C1C),
  );

  static final ThemeData dark = _build(
    brightness: Brightness.dark,
    background: const Color(0xFF0A0A0A),
    foreground: const Color(0xFFF5F5F5),
    surface: const Color(0xFF171717),
    mutedForeground: const Color(0xFFA3A3A3),
    primary: const Color(0xFFF5F5F5),
    border: const Color(0xFF2A2A2A),
    error: const Color(0xFFF87171),
  );

  static ThemeData _build({
    required Brightness brightness,
    required Color background,
    required Color foreground,
    required Color surface,
    required Color mutedForeground,
    required Color primary,
    required Color border,
    required Color error,
  }) {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: primary,
          brightness: brightness,
        ).copyWith(
          primary: primary,
          onPrimary: background,
          surface: surface,
          onSurface: foreground,
          onSurfaceVariant: mutedForeground,
          outline: border,
          error: error,
        );

    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
    );

    return base.copyWith(
      dividerTheme: DividerThemeData(color: border, space: 1, thickness: 1),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        border: _inputBorder,
        enabledBorder: _inputBorder,
        focusedBorder: _inputBorder.copyWith(
          borderSide: BorderSide(color: foreground, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(44, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_radius),
          ),
        ),
      ),
      textTheme: base.textTheme.apply(
        bodyColor: foreground,
        displayColor: foreground,
        decorationColor: mutedForeground,
      ),
    );
  }

  static final _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(_radius),
    borderSide: BorderSide.none,
  );
}
