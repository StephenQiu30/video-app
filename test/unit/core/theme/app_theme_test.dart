import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
