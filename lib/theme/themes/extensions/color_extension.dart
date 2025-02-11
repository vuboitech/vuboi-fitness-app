import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color primary;
  final Color success;
  final Color divider;
  final Color background;
  final Color surface;

  final Color textColorHeading;
  final Color textColorBody;
  final Color textColorDisabled;
  final Color textColorPlaceholder;
  final Color textColorOnColor;

  AppColorExtension({
    required this.primary,
    required this.success,
    required this.divider,
    required this.background,
    required this.surface,

    required this.textColorHeading,
    required this.textColorBody,
    required this.textColorDisabled,
    required this.textColorPlaceholder,
    required this.textColorOnColor,
  });

  @override
  ThemeExtension<AppColorExtension> copyWith({
    Color? primary,
    Color? success,
    Color? divider,
    Color? background,
    Color? surface,

    Color? textColorHeading,
    Color? textColorBody,
    Color? textColorDisabled,
    Color? textColorPlaceholder,
    Color? textColorOnColor,
  }) {
    return AppColorExtension(
      primary: primary ?? this.primary,
      success: success ?? this.success,
      divider: divider ?? this.divider,
      background: background ?? this.background,
      surface: surface ?? this.surface,

      textColorHeading: textColorHeading ?? this.textColorHeading,
      textColorBody: textColorBody ?? this.textColorBody,
      textColorDisabled: textColorDisabled ?? this.textColorDisabled,
      textColorPlaceholder: textColorPlaceholder ?? this.textColorPlaceholder,
      textColorOnColor: textColorOnColor ?? this.textColorOnColor,
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

      textColorHeading: Color.lerp(textColorHeading, other.textColorHeading, t)!,
      textColorBody: Color.lerp(textColorBody, other.textColorBody, t)!,
      textColorDisabled: Color.lerp(textColorDisabled, other.textColorDisabled, t)!,
      textColorPlaceholder: Color.lerp(textColorPlaceholder, other.textColorPlaceholder, t)!,
      textColorOnColor: Color.lerp(textColorOnColor, other.textColorOnColor, t)!,
    );
  }
}