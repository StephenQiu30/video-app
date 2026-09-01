import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_colors.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/core/theme/app_theme.dart';

void main() {
  test('secondary text meets WCAG AA contrast in both themes', () {
    for (final theme in [AppTheme.light, AppTheme.dark]) {
      final ratio = _contrastRatio(
        theme.colorScheme.onSurfaceVariant,
        theme.scaffoldBackgroundColor,
      );

      expect(ratio, greaterThanOrEqualTo(4.5));
    }
  });

  test('matches the Web semantic input and status tokens', () {
    expect(
      AppTheme.light.extension<AppColors>()?.input,
      const Color(0xFFF1F1F1),
    );
    expect(
      AppTheme.dark.extension<AppColors>()?.input,
      const Color(0xFF1C1C1C),
    );
    expect(
      AppTheme.light.extension<AppColors>()?.success,
      const Color(0xFF0F7040),
    );
    expect(
      AppTheme.dark.extension<AppColors>()?.success,
      const Color(0xFF54C58B),
    );
    expect(
      AppTheme.light.extension<AppColors>()?.warning,
      const Color(0xFF854D0E),
    );
    expect(
      AppTheme.dark.extension<AppColors>()?.warning,
      const Color(0xFFFBBF24),
    );
  });

  test('maps every Material surface role to the Web monochrome palette', () {
    final light = AppTheme.light.colorScheme;
    final dark = AppTheme.dark.colorScheme;

    expect(light.secondaryContainer, const Color(0xFFF5F5F5));
    expect(light.onSecondaryContainer, const Color(0xFF111111));
    expect(light.tertiaryContainer, const Color(0xFFECECEC));
    expect(light.surfaceContainerLow, Colors.white);
    expect(light.surfaceContainerHigh, const Color(0xFFF1F1F1));
    expect(light.surfaceContainerHighest, const Color(0xFFECECEC));

    expect(dark.secondaryContainer, const Color(0xFF1F1F1F));
    expect(dark.onSecondaryContainer, const Color(0xFFF5F5F5));
    expect(dark.tertiaryContainer, const Color(0xFF262626));
    expect(dark.surfaceContainerLow, const Color(0xFF111111));
    expect(dark.surfaceContainerHigh, const Color(0xFF1F1F1F));
    expect(dark.surfaceContainerHighest, const Color(0xFF262626));

    for (final scheme in [light, dark]) {
      for (final color in [
        scheme.primary,
        scheme.primaryContainer,
        scheme.secondary,
        scheme.secondaryContainer,
        scheme.tertiary,
        scheme.tertiaryContainer,
        scheme.surface,
        scheme.surfaceContainerLow,
        scheme.surfaceContainerHigh,
        scheme.surfaceContainerHighest,
      ]) {
        expect(_isAchromatic(color), isTrue, reason: '$color has a hue');
      }
      expect(scheme.surfaceTint, Colors.transparent);
    }
  });

  test('centralizes the editorial type and spacing scale', () {
    final textTheme = AppTheme.light.textTheme;

    expect(textTheme.displayLarge?.fontSize, 64);
    expect(textTheme.displayMedium?.fontSize, 52);
    expect(textTheme.displaySmall?.fontSize, 40);
    expect(textTheme.bodyLarge?.fontSize, 15);
    expect(AppSpacing.section, 40);
    expect(AppTheme.radius, 6);
  });
}

bool _isAchromatic(Color color) {
  final argb = color.toARGB32();
  final red = (argb >> 16) & 0xff;
  final green = (argb >> 8) & 0xff;
  final blue = argb & 0xff;
  return red == green && green == blue;
}

double _contrastRatio(Color first, Color second) {
  final firstLuminance = first.computeLuminance();
  final secondLuminance = second.computeLuminance();
  final lighter = firstLuminance > secondLuminance
      ? firstLuminance
      : secondLuminance;
  final darker = firstLuminance > secondLuminance
      ? secondLuminance
      : firstLuminance;

  return (lighter + 0.05) / (darker + 0.05);
}
