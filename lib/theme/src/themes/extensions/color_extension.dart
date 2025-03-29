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

  final Color fgPrimary;
  final Color fgSecondary;
  final Color fgTertiary;
  final Color fgQuinary;

  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;
  final Color textPlaceholder;

  final Color borderPrimary;
  final Color borderSecondary;
  final Color borderTertiary;
  final Color borderDisabled;
  final Color borderError;
  final Color borderErrorSubtle;

  final Color btnSecondaryFg;
  final Color btnSecondaryFgHover;
  final Color btnSecondaryBg;
  final Color btnSecondaryBgHover;
  final Color btnSecondaryBorder;
  final Color btnSecondaryBorderHover;

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

    required this.fgPrimary,
    required this.fgSecondary,
    required this.fgTertiary,
    required this.fgQuinary,

    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    required this.textPlaceholder,

    required this.borderPrimary,
    required this.borderSecondary,
    required this.borderTertiary,
    required this.borderDisabled,
    required this.borderError,
    required this.borderErrorSubtle,

    required this.btnSecondaryFg,
    required this.btnSecondaryFgHover,
    required this.btnSecondaryBg,
    required this.btnSecondaryBgHover,
    required this.btnSecondaryBorder,
    required this.btnSecondaryBorderHover,
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

    Color? fgPrimary,
    Color? fgSecondary,
    Color? fgTertiary,
    Color? fgQuinary,

    Color? textColorHeading,
    Color? textColorBody,
    Color? textColorDisabled,
    Color? textColorPlaceholder,
    Color? textColorOnColor,

    Color? borderPrimary,
    Color? borderSecondary,
    Color? borderTertiary,
    Color? borderDisabled,
    Color? borderError,
    Color? borderErrorSubtle,

    Color? buttonSecondaryFg,
    Color? buttonSecondaryFgHover,
    Color? buttonSecondaryBg,
    Color? buttonSecondaryBgHover,
    Color? buttonSecondaryBorder,
    Color? buttonSecondaryBorderHover,
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

      fgPrimary: fgPrimary ?? this.fgPrimary,
      fgSecondary: fgSecondary ?? this.fgSecondary,
      fgTertiary: fgTertiary ?? this.fgTertiary,
      fgQuinary: fgQuinary ?? this.fgQuinary,

      textPrimary: textColorHeading ?? this.textPrimary,
      textSecondary: textColorBody ?? this.textSecondary,
      textTertiary: textColorDisabled ?? this.textTertiary,
      textDisabled: textColorPlaceholder ?? this.textDisabled,
      textPlaceholder: textColorOnColor ?? this.textPlaceholder,

      borderPrimary: borderPrimary ?? this.borderPrimary,
      borderSecondary: borderSecondary ?? this.borderSecondary,
      borderTertiary: borderTertiary ?? this.borderTertiary,
      borderDisabled: borderDisabled ?? this.borderDisabled,
      borderError: borderError ?? this.borderError,
      borderErrorSubtle: borderErrorSubtle ?? this.borderErrorSubtle,

      btnSecondaryFg: buttonSecondaryFg ?? this.btnSecondaryFg,
      btnSecondaryFgHover: buttonSecondaryFgHover ?? this.btnSecondaryFgHover,
      btnSecondaryBg: buttonSecondaryBg ?? this.btnSecondaryBg,
      btnSecondaryBgHover: buttonSecondaryBgHover ?? this.btnSecondaryBgHover,
      btnSecondaryBorder: buttonSecondaryBorder ?? this.btnSecondaryBorder,
      btnSecondaryBorderHover: buttonSecondaryBorderHover ?? this.btnSecondaryBorderHover,
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

      fgPrimary: Color.lerp(fgPrimary, other.fgPrimary, t)!,
      fgSecondary: Color.lerp(fgSecondary, other.fgSecondary, t)!,
      fgTertiary: Color.lerp(fgTertiary, other.fgTertiary, t)!,
      fgQuinary: Color.lerp(fgQuinary, other.fgQuinary, t)!,

      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textPlaceholder: Color.lerp(textPlaceholder, other.textPlaceholder, t)!,

      borderPrimary: Color.lerp(borderPrimary, other.borderPrimary, t)!,
      borderSecondary: Color.lerp(borderSecondary, other.borderSecondary, t)!,
      borderTertiary: Color.lerp(borderTertiary, other.borderTertiary, t)!,
      borderDisabled: Color.lerp(borderDisabled, other.borderDisabled, t)!,
      borderError: Color.lerp(borderError, other.borderError, t)!,
      borderErrorSubtle: Color.lerp(borderErrorSubtle, other.borderErrorSubtle, t)!,

      btnSecondaryFg: Color.lerp(btnSecondaryFg, other.btnSecondaryFg, t)!,
      btnSecondaryFgHover: Color.lerp(btnSecondaryFgHover, other.btnSecondaryFgHover, t)!,
      btnSecondaryBg: Color.lerp(btnSecondaryBg, other.btnSecondaryBg, t)!,
      btnSecondaryBgHover: Color.lerp(btnSecondaryBgHover, other.btnSecondaryBgHover, t)!,
      btnSecondaryBorder: Color.lerp(btnSecondaryBorder, other.btnSecondaryBorder, t)!,
      btnSecondaryBorderHover: Color.lerp(btnSecondaryBorderHover, other.btnSecondaryBorderHover, t)!,
    );
  }
}