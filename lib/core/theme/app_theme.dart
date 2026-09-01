import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_colors.dart';

abstract final class AppTheme {
  static const radius = 6.0;

  static final ThemeData light = _build(
    brightness: Brightness.light,
    background: const Color(0xFFFAFAFA),
    card: Colors.white,
    foreground: const Color(0xFF0A0A0A),
    surface: const Color(0xFFF5F5F5),
    muted: const Color(0xFFF1F1F1),
    input: const Color(0xFFF1F1F1),
    mutedForeground: const Color(0xFF686868),
    primary: const Color(0xFF111111),
    primaryHover: const Color(0xFF2B2B2B),
    primaryForeground: Colors.white,
    secondary: const Color(0xFFF5F5F5),
    secondaryForeground: const Color(0xFF111111),
    accent: const Color(0xFFECECEC),
    accentForeground: const Color(0xFF111111),
    popover: Colors.white,
    border: const Color(0xFFE6E6E6),
    success: const Color(0xFF0F7040),
    warning: const Color(0xFF854D0E),
    error: const Color(0xFFB91C1C),
  );

  static final ThemeData dark = _build(
    brightness: Brightness.dark,
    background: const Color(0xFF0A0A0A),
    card: const Color(0xFF111111),
    foreground: const Color(0xFFF5F5F5),
    surface: const Color(0xFF171717),
    muted: const Color(0xFF1F1F1F),
    input: const Color(0xFF1C1C1C),
    mutedForeground: const Color(0xFFA3A3A3),
    primary: const Color(0xFFF5F5F5),
    primaryHover: Colors.white,
    primaryForeground: const Color(0xFF0A0A0A),
    secondary: const Color(0xFF1F1F1F),
    secondaryForeground: const Color(0xFFF5F5F5),
    accent: const Color(0xFF262626),
    accentForeground: Colors.white,
    popover: const Color(0xFF171717),
    border: const Color(0xFF2A2A2A),
    success: const Color(0xFF54C58B),
    warning: const Color(0xFFFBBF24),
    error: const Color(0xFFF87171),
  );

  static ThemeData _build({
    required Brightness brightness,
    required Color background,
    required Color card,
    required Color foreground,
    required Color surface,
    required Color muted,
    required Color input,
    required Color mutedForeground,
    required Color primary,
    required Color primaryHover,
    required Color primaryForeground,
    required Color secondary,
    required Color secondaryForeground,
    required Color accent,
    required Color accentForeground,
    required Color popover,
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
          primaryContainer: accent,
          onPrimaryContainer: foreground,
          primaryFixed: primary,
          primaryFixedDim: primaryHover,
          onPrimaryFixed: primaryForeground,
          onPrimaryFixedVariant: primaryForeground,
          secondary: secondary,
          onSecondary: secondaryForeground,
          secondaryContainer: secondary,
          onSecondaryContainer: secondaryForeground,
          secondaryFixed: secondary,
          secondaryFixedDim: accent,
          onSecondaryFixed: secondaryForeground,
          onSecondaryFixedVariant: secondaryForeground,
          tertiary: accent,
          onTertiary: accentForeground,
          tertiaryContainer: accent,
          onTertiaryContainer: accentForeground,
          tertiaryFixed: accent,
          tertiaryFixedDim: accent,
          onTertiaryFixed: accentForeground,
          onTertiaryFixedVariant: accentForeground,
          error: error,
          onError: Colors.white,
          errorContainer: brightness == Brightness.dark
              ? const Color(0xFF3B1616)
              : const Color(0xFFFEE2E2),
          onErrorContainer: brightness == Brightness.dark
              ? const Color(0xFFFCA5A5)
              : const Color(0xFF991B1B),
          surface: surface,
          onSurface: foreground,
          surfaceDim: brightness == Brightness.dark ? background : accent,
          surfaceBright: brightness == Brightness.dark ? accent : background,
          surfaceContainerLowest: background,
          surfaceContainerLow: card,
          surfaceContainer: surface,
          surfaceContainerHigh: muted,
          surfaceContainerHighest: accent,
          onSurfaceVariant: mutedForeground,
          outline: border,
          outlineVariant: border,
          inverseSurface: foreground,
          onInverseSurface: background,
          inversePrimary: primaryForeground,
          surfaceTint: Colors.transparent,
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

    final inputDecorationTheme = InputDecorationTheme(
      filled: true,
      fillColor: input,
      border: _inputBorder,
      enabledBorder: _inputBorder,
      focusedBorder: _inputBorder.copyWith(
        borderSide: BorderSide(color: foreground, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    );
    final menuStyle = MenuStyle(
      backgroundColor: WidgetStatePropertyAll(popover),
      elevation: const WidgetStatePropertyAll(8),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
      side: const WidgetStatePropertyAll(BorderSide.none),
      surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
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
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: popover,
        modalBackgroundColor: popover,
        elevation: 0,
        modalElevation: 0,
        shape: const RoundedRectangleBorder(),
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        color: card,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: popover,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: inputDecorationTheme,
        menuStyle: menuStyle,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          elevation: 0,
          minimumSize: const Size(44, 64),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(minimumSize: const Size.square(44)),
      ),
      inputDecorationTheme: inputDecorationTheme,
      menuTheme: MenuThemeData(style: menuStyle),
      navigationDrawerTheme: NavigationDrawerThemeData(
        backgroundColor: background,
        elevation: 0,
        indicatorColor: input,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: background,
        elevation: 0,
        height: 72,
        indicatorColor: input,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
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
      popupMenuTheme: PopupMenuThemeData(
        color: popover,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primary,
        circularTrackColor: input,
        linearTrackColor: input,
      ),
      snackBarTheme: SnackBarThemeData(
        actionTextColor: background,
        backgroundColor: foreground,
        behavior: SnackBarBehavior.floating,
        contentTextStyle: base.textTheme.bodyMedium?.copyWith(
          color: background,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: foreground,
          minimumSize: const Size(44, 44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
      textTheme: textTheme,
    );
  }

  static final _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide.none,
  );
}
