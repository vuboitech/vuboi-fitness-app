import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color primary;
  final Color success;
  final Color divider;
  final Color background;
  final Color surface;

  final Color bgPrimary;
  final Color bgSecondary;
  final Color bgTertiary;
  final Color bgActive;

  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;
  final Color textPlaceholder;

  final Color borderPrimary;
  final Color borderSecondary;
  final Color borderTertiary;
  final Color borderDisabled;

  AppColorExtension({
    required this.primary,
    required this.success,
    required this.divider,
    required this.background,
    required this.surface,

    required this.bgPrimary,
    required this.bgSecondary,
    required this.bgTertiary,
    required this.bgActive,

    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    required this.textPlaceholder,

    required this.borderPrimary,
    required this.borderSecondary,
    required this.borderTertiary,
    required this.borderDisabled,
  });

  @override
  ThemeExtension<AppColorExtension> copyWith({
    Color? primary,
    Color? success,
    Color? divider,
    Color? background,
    Color? surface,

    Color? bgPrimary,
    Color? bgSecondary,
    Color? bgTertiary,
    Color? bgActive,

    Color? textColorHeading,
    Color? textColorBody,
    Color? textColorDisabled,
    Color? textColorPlaceholder,
    Color? textColorOnColor,

    Color? borderPrimary,
    Color? borderSecondary,
    Color? borderTertiary,
    Color? borderDisabled,
  }) {
    return AppColorExtension(
      primary: primary ?? this.primary,
      success: success ?? this.success,
      divider: divider ?? this.divider,
      background: background ?? this.background,
      surface: surface ?? this.surface,

      bgPrimary: bgPrimary ?? this.bgPrimary,
      bgSecondary: bgSecondary ?? this.bgSecondary,
      bgTertiary: bgTertiary ?? this.bgTertiary,
      bgActive: bgActive ?? this.bgActive,

      textPrimary: textColorHeading ?? this.textPrimary,
      textSecondary: textColorBody ?? this.textSecondary,
      textTertiary: textColorDisabled ?? this.textTertiary,
      textDisabled: textColorPlaceholder ?? this.textDisabled,
      textPlaceholder: textColorOnColor ?? this.textPlaceholder,

      borderPrimary: borderPrimary ?? this.borderPrimary,
      borderSecondary: borderSecondary ?? this.borderSecondary,
      borderTertiary: borderTertiary ?? this.borderTertiary,
      borderDisabled: borderDisabled ?? this.borderDisabled,
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

      bgPrimary: Color.lerp(bgPrimary, other.bgPrimary, t)!,
      bgSecondary: Color.lerp(bgSecondary, other.bgSecondary, t)!,
      bgTertiary: Color.lerp(bgTertiary, other.bgTertiary, t)!,
      bgActive: Color.lerp(bgActive, other.bgActive, t)!,

      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textPlaceholder: Color.lerp(textPlaceholder, other.textPlaceholder, t)!,

      borderPrimary: Color.lerp(borderPrimary, other.borderPrimary, t)!,
      borderSecondary: Color.lerp(borderSecondary, other.borderSecondary, t)!,
      borderTertiary: Color.lerp(borderTertiary, other.borderTertiary, t)!,
      borderDisabled: Color.lerp(borderDisabled, other.borderDisabled, t)!,
    );
  }
}