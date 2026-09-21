import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_colors.dart';
import 'package:framegrab/core/theme/web_colors.g.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Shad is the only component theme. Material is a bridge for Scaffold/media.
abstract final class AppTheme {
  static const radius = webRadius;
  static final shadLight = _shad(Brightness.light, lightWebColors);
  static final shadDark = _shad(Brightness.dark, darkWebColors);
  static final light = material(shadLight);
  static final dark = material(shadDark);

  static ShadThemeData _shad(Brightness brightness, Map<String, Color> c) {
    final colors = ShadColorScheme(
      background: c['background']!,
      foreground: c['foreground']!,
      card: c['card']!,
      cardForeground: c['card-foreground']!,
      popover: c['popover']!,
      popoverForeground: c['popover-foreground']!,
      primary: c['primary']!,
      primaryForeground: c['primary-foreground']!,
      secondary: c['secondary']!,
      secondaryForeground: c['secondary-foreground']!,
      muted: c['muted']!,
      mutedForeground: c['muted-foreground']!,
      accent: c['accent']!,
      accentForeground: c['accent-foreground']!,
      destructive: c['destructive']!,
      destructiveForeground: Colors.white,
      border: c['border']!,
      input: c['input']!,
      ring: c['ring']!,
      selection: c['foreground']!.withValues(alpha: .18),
      custom: {'success': c['success']!, 'warning': c['warning']!},
    );
    const font = 'packages/shadcn_ui/Geist';
    const body = TextStyle(fontFamily: font, fontSize: 14, height: 1.5);
    const button = ShadButtonTheme(
      gap: 6,
      shadows: [],
      textStyle: TextStyle(
        fontFamily: font,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
    return ShadThemeData(
      brightness: brightness,
      colorScheme: colors,
      radius: BorderRadius.circular(radius),
      decoration: ShadDecoration(
        errorBorder: ShadBorder.all(
          color: colors.destructive,
          radius: BorderRadius.circular(radius),
        ),
        secondaryErrorBorder: ShadBorder.all(
          color: colors.destructive.withValues(alpha: .2),
          width: 3,
          offset: 0,
          radius: BorderRadius.circular(radius),
        ),
        secondaryFocusedBorder: ShadBorder.all(
          color: colors.ring.withValues(alpha: .5),
          width: 3,
          radius: BorderRadius.circular(radius),
          offset: 0,
        ),
      ),
      textTheme: ShadTextTheme(
        family: font,
        p: body,
        small: body.copyWith(fontWeight: FontWeight.w500),
        muted: body.copyWith(color: colors.mutedForeground),
      ),
      primaryButtonTheme: button.copyWith(
        hoverBackgroundColor: colors.primary.withValues(alpha: .8),
      ),
      secondaryButtonTheme: button,
      ghostButtonTheme: button,
      outlineButtonTheme: button,
      linkButtonTheme: button,
      destructiveButtonTheme: button.copyWith(
        backgroundColor: colors.destructive.withValues(
          alpha: brightness == Brightness.dark ? .2 : .1,
        ),
        foregroundColor: colors.destructive,
        hoverBackgroundColor: colors.destructive.withValues(
          alpha: brightness == Brightness.dark ? .3 : .2,
        ),
        hoverForegroundColor: colors.destructive,
      ),
      buttonSizesTheme: const ShadButtonSizesTheme(
        regular: ShadButtonSizeTheme(
          height: 44,
          padding: EdgeInsets.symmetric(horizontal: 12),
        ),
        sm: ShadButtonSizeTheme(
          height: 44,
          padding: EdgeInsets.symmetric(horizontal: 10),
        ),
        lg: ShadButtonSizeTheme(
          height: 48,
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
        icon: ShadButtonSizeTheme(
          height: 44,
          width: 44,
          padding: EdgeInsets.all(10),
        ),
      ),
      inputTheme: ShadInputTheme(
        decoration: ShadDecoration(
          color: brightness == Brightness.dark
              ? colors.input.withValues(alpha: colors.input.a * .3)
              : Colors.transparent,
        ),
        style: body.copyWith(fontSize: 16),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        constraints: const BoxConstraints(minHeight: 44),
      ),
      progressTheme: const ShadProgressTheme(minHeight: 6),
    );
  }

  static ThemeData material(ShadThemeData shad) {
    final c = shad.colorScheme;
    final base = ThemeData(
      brightness: shad.brightness,
      fontFamily: shad.textTheme.family,
      scaffoldBackgroundColor: c.background,
      colorScheme:
          ColorScheme.fromSeed(
            seedColor: c.primary,
            brightness: shad.brightness,
          ).copyWith(
            primary: c.primary,
            onPrimary: c.primaryForeground,
            primaryContainer: c.accent,
            onPrimaryContainer: c.accentForeground,
            secondary: c.secondary,
            onSecondary: c.secondaryForeground,
            secondaryContainer: c.secondary,
            onSecondaryContainer: c.secondaryForeground,
            tertiary: c.muted,
            onTertiary: c.foreground,
            tertiaryContainer: c.accent,
            onTertiaryContainer: c.accentForeground,
            surface: c.muted,
            onSurface: c.foreground,
            onSurfaceVariant: c.mutedForeground,
            surfaceContainerLowest: c.background,
            surfaceContainerLow: c.card,
            surfaceContainer: c.muted,
            surfaceContainerHigh: c.muted,
            surfaceContainerHighest: c.accent,
            error: c.destructive,
            onError: c.destructiveForeground,
            errorContainer: Color.alphaBlend(
              c.destructive.withValues(alpha: .1),
              c.background,
            ),
            onErrorContainer: c.foreground,
            outline: c.border,
            outlineVariant: c.border,
            surfaceTint: Colors.transparent,
          ),
    );
    return base.copyWith(
      extensions: [
        AppColors(
          input: c.input,
          success: c.custom['success']!,
          warning: c.custom['warning']!,
        ),
      ],
      textTheme: base.textTheme
          .copyWith(
            displayLarge: shad.textTheme.h1Large.copyWith(
              fontSize: 64,
              fontWeight: FontWeight.w500,
              height: .96,
              letterSpacing: -3.5,
            ),
            displayMedium: shad.textTheme.h1.copyWith(
              fontSize: 52,
              fontWeight: FontWeight.w500,
            ),
            displaySmall: shad.textTheme.h2.copyWith(
              fontSize: 40,
              fontWeight: FontWeight.w500,
            ),
            bodyLarge: shad.textTheme.p.copyWith(fontSize: 16),
            bodyMedium: shad.textTheme.p,
            bodySmall: shad.textTheme.muted.copyWith(fontSize: 12),
            titleSmall: shad.textTheme.small,
          )
          .apply(bodyColor: c.foreground, displayColor: c.foreground),
      appBarTheme: AppBarTheme(
        backgroundColor: c.background,
        foregroundColor: c.foreground,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      iconTheme: IconThemeData(color: c.foreground, size: 18),
      dividerTheme: DividerThemeData(color: c.border, thickness: 1),
    );
  }
}
