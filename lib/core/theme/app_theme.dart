import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_colors.dart';

abstract final class AppTheme {
  static const _radius = 6.0;

  static final ThemeData light = _build(
    brightness: Brightness.light,
    background: const Color(0xFFFAFAFA),
    foreground: const Color(0xFF0A0A0A),
    surface: const Color(0xFFF5F5F5),
    input: const Color(0xFFF1F1F1),
    mutedForeground: const Color(0xFF686868),
    primary: const Color(0xFF111111),
    primaryForeground: Colors.white,
    border: const Color(0xFFE6E6E6),
    success: const Color(0xFF0F7040),
    warning: const Color(0xFFA16207),
    error: const Color(0xFFB91C1C),
  );

  static final ThemeData dark = _build(
    brightness: Brightness.dark,
    background: const Color(0xFF0A0A0A),
    foreground: const Color(0xFFF5F5F5),
    surface: const Color(0xFF171717),
    input: const Color(0xFF1C1C1C),
    mutedForeground: const Color(0xFFA3A3A3),
    primary: const Color(0xFFF5F5F5),
    primaryForeground: const Color(0xFF0A0A0A),
    border: const Color(0xFF2A2A2A),
    success: const Color(0xFF54C58B),
    warning: const Color(0xFFFBBF24),
    error: const Color(0xFFF87171),
  );

  static ThemeData _build({
    required Brightness brightness,
    required Color background,
    required Color foreground,
    required Color surface,
    required Color input,
    required Color mutedForeground,
    required Color primary,
    required Color primaryForeground,
    required Color border,
    required Color success,
    required Color warning,
    required Color error,
  }) {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: primary,
          brightness: brightness,
        ).copyWith(
          primary: primary,
          onPrimary: primaryForeground,
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

    final textTheme = base.textTheme
        .copyWith(
          displayLarge: base.textTheme.displayLarge?.copyWith(
            fontSize: 64,
            fontWeight: FontWeight.w500,
            height: 0.98,
            letterSpacing: -3.5,
          ),
          displayMedium: base.textTheme.displayMedium?.copyWith(
            fontSize: 52,
            fontWeight: FontWeight.w500,
            height: 0.98,
            letterSpacing: -3,
          ),
          displaySmall: base.textTheme.displaySmall?.copyWith(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            height: 1.02,
            letterSpacing: -2,
          ),
          headlineLarge: base.textTheme.headlineLarge?.copyWith(
            fontSize: 44,
            fontWeight: FontWeight.w500,
            height: 1,
            letterSpacing: -2.5,
          ),
          bodyLarge: base.textTheme.bodyLarge?.copyWith(
            fontSize: 15,
            height: 1.75,
          ),
          bodyMedium: base.textTheme.bodyMedium?.copyWith(height: 1.65),
          titleSmall: base.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        )
        .apply(
          bodyColor: foreground,
          fontFamilyFallback: const [
            '.SF Pro Text',
            'PingFang SC',
            'Noto Sans CJK SC',
          ],
          displayColor: foreground,
          decorationColor: mutedForeground,
        );

    return base.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        centerTitle: false,
        foregroundColor: foreground,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      dividerTheme: DividerThemeData(color: border, space: 1, thickness: 1),
      extensions: [AppColors(input: input, success: success, warning: warning)],
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: input,
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
          minimumSize: const Size(44, 64),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_radius),
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(minimumSize: const Size.square(44)),
      ),
      navigationDrawerTheme: NavigationDrawerThemeData(
        backgroundColor: background,
        elevation: 0,
        indicatorColor: input,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radius),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: background,
        elevation: 0,
        height: 72,
        indicatorColor: input,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radius),
        ),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          return IconThemeData(
            color: states.contains(WidgetState.selected)
                ? foreground
                : mutedForeground,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => base.textTheme.labelSmall?.copyWith(
            color: states.contains(WidgetState.selected)
                ? foreground
                : mutedForeground,
            fontWeight: states.contains(WidgetState.selected)
                ? FontWeight.w600
                : FontWeight.w400,
          ),
        ),
      ),
      textTheme: textTheme,
    );
  }

  static final _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(_radius),
    borderSide: BorderSide.none,
  );
}
