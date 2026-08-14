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
  });

  test('centralizes the editorial type and spacing scale', () {
    final textTheme = AppTheme.light.textTheme;

    expect(textTheme.displayLarge?.fontSize, 64);
    expect(textTheme.displayMedium?.fontSize, 52);
    expect(textTheme.displaySmall?.fontSize, 40);
    expect(textTheme.bodyLarge?.fontSize, 15);
    expect(AppSpacing.section, 40);
  });
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
