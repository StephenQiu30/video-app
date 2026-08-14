import 'package:flutter/material.dart';

@immutable
final class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.input,
    required this.success,
    required this.warning,
  });

  final Color input;
  final Color success;
  final Color warning;

  @override
  AppColors copyWith({Color? input, Color? success, Color? warning}) {
    return AppColors(
      input: input ?? this.input,
      success: success ?? this.success,
      warning: warning ?? this.warning,
    );
  }

  @override
  AppColors lerp(covariant AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      input: Color.lerp(input, other.input, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
    );
  }
}

extension AppColorsContext on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}
