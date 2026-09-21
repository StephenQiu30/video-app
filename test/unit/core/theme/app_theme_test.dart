import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_colors.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/core/theme/web_colors.g.dart';

void main() {
  test('secondary text meets WCAG AA contrast in both themes', () {
    for (final theme in [AppTheme.light, AppTheme.dark]) {
      expect(
        _contrastRatio(
          theme.colorScheme.onSurfaceVariant,
          theme.scaffoldBackgroundColor,
        ),
        greaterThanOrEqualTo(4.5),
      );
    }
  });

  test('Shad and infrastructure bridge use generated Web semantic tokens', () {
    for (final (shad, bridge, tokens) in [
      (AppTheme.shadLight, AppTheme.light, lightWebColors),
      (AppTheme.shadDark, AppTheme.dark, darkWebColors),
    ]) {
      final c = shad.colorScheme;
      expect(c.primary, tokens['primary']);
      expect(c.input, tokens['input']);
      expect(c.destructive, tokens['destructive']);
      expect(c.border, tokens['border']);
      expect(bridge.scaffoldBackgroundColor, tokens['background']);
      expect(bridge.extension<AppColors>()?.input, tokens['input']);
      expect(bridge.extension<AppColors>()?.success, tokens['success']);
      expect(bridge.extension<AppColors>()?.warning, tokens['warning']);
      expect(bridge.colorScheme.secondaryContainer, c.secondary);
      expect(bridge.colorScheme.tertiaryContainer, c.accent);
      expect(bridge.colorScheme.surfaceContainerLow, c.card);
      expect(bridge.colorScheme.surfaceContainerHigh, c.muted);
      expect(bridge.colorScheme.surfaceContainerHighest, c.accent);
      expect(bridge.colorScheme.surfaceTint, Colors.transparent);
      expect(
        bridge.colorScheme.errorContainer,
        Color.alphaBlend(c.destructive.withValues(alpha: .1), c.background),
      );
      expect(
        _contrastRatio(
          bridge.colorScheme.onErrorContainer,
          bridge.colorScheme.errorContainer,
        ),
        greaterThanOrEqualTo(4.5),
      );
    }
  });

  test('uses Geist and Shad scale with accessible native touch targets', () {
    final shad = AppTheme.shadLight;
    expect(shad.textTheme.family, 'packages/shadcn_ui/Geist');
    expect(shad.textTheme.p.fontSize, 14);
    expect(shad.buttonSizesTheme.regular?.height, 44);
    expect(AppTheme.light.textTheme.bodyLarge?.fontSize, 16);
    expect(AppSpacing.section, 40);
    expect(AppTheme.radius, 10);
  });
}

double _contrastRatio(Color first, Color second) {
  final a = first.computeLuminance();
  final b = second.computeLuminance();
  return ((a > b ? a : b) + .05) / ((a > b ? b : a) + .05);
}
