import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color primary;
  final Color success;
  final Color divider;
  final Color background;
  final Color surface;

  AppColorExtension({
    required this.primary,
    required this.success,
    required this.divider,
    required this.background,
    required this.surface,
  });

  @override
  ThemeExtension<AppColorExtension> copyWith({
    Color? primary,
    Color? success,
    Color? divider,
    Color? background,
    Color? surface,
  }) {
    return AppColorExtension(
      primary: primary ?? this.primary,
      success: success ?? this.success,
      divider: divider ?? this.divider,
      background: background ?? this.background,
      surface: surface ?? this.surface,
    );
  }

  @override
  ThemeExtension<AppColorExtension> lerp(covariant ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) {
      return this;
    }

    return AppColorExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      success: Color.lerp(success, other.success, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
    );
  }
}