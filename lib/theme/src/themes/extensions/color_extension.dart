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
  final Color fgQuaternary;
  final Color fgErrorPrimary;
  final Color fgErrorSecondary;
  final Color fgWarningPrimary;
  final Color fgWarningSecondary;

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

  // Component Colors
  final Color utilityError50;
  final Color utilityError100;
  final Color utilityError200;
  final Color utilityError300;
  final Color utilityError400;
  final Color utilityError500;
  final Color utilityError600;
  final Color utilityError700;

  final Color utilitySuccess50;
  final Color utilitySuccess100;
  final Color utilitySuccess200;
  final Color utilitySuccess300;
  final Color utilitySuccess400;
  final Color utilitySuccess500;
  final Color utilitySuccess600;
  final Color utilitySuccess700;

  final Color utilityWarning50;
  final Color utilityWarning100;
  final Color utilityWarning200;
  final Color utilityWarning300;
  final Color utilityWarning400;
  final Color utilityWarning500;
  final Color utilityWarning600;
  final Color utilityWarning700;

  // Components
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
    required this.fgQuaternary,
    required this.fgErrorPrimary,
    required this.fgErrorSecondary,
    required this.fgWarningPrimary,
    required this.fgWarningSecondary,

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

    required this.utilityError50,
    required this.utilityError100,
    required this.utilityError200,
    required this.utilityError300,
    required this.utilityError400,
    required this.utilityError500,
    required this.utilityError600,
    required this.utilityError700,

    required this.utilitySuccess50,
    required this.utilitySuccess100,
    required this.utilitySuccess200,
    required this.utilitySuccess300,
    required this.utilitySuccess400,
    required this.utilitySuccess500,
    required this.utilitySuccess600,
    required this.utilitySuccess700,

    required this.utilityWarning50,
    required this.utilityWarning100,
    required this.utilityWarning200,
    required this.utilityWarning300,
    required this.utilityWarning400,
    required this.utilityWarning500,
    required this.utilityWarning600,
    required this.utilityWarning700,

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
    Color? fgQuaternary,
    Color? fgErrorPrimary,
    Color? fgErrorSecondary,
    Color? fgWarningPrimary,
    Color? fgWarningSecondary,

    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textDisabled,
    Color? textPlaceholder,

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

    Color? utilityError50,
    Color? utilityError100,
    Color? utilityError200,
    Color? utilityError300,
    Color? utilityError400,
    Color? utilityError500,
    Color? utilityError600,
    Color? utilityError700,

    Color? utilitySuccess50,
    Color? utilitySuccess100,
    Color? utilitySuccess200,
    Color? utilitySuccess300,
    Color? utilitySuccess400,
    Color? utilitySuccess500,
    Color? utilitySuccess600,
    Color? utilitySuccess700,

    Color? utilityWarning50,
    Color? utilityWarning100,
    Color? utilityWarning200,
    Color? utilityWarning300,
    Color? utilityWarning400,
    Color? utilityWarning500,
    Color? utilityWarning600,
    Color? utilityWarning700,

    Color? btnSecondaryFg,
    Color? btnSecondaryFgHover,
    Color? btnSecondaryBg,
    Color? btnSecondaryBgHover,
    Color? btnSecondaryBorder,
    Color? btnSecondaryBorderHover,
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
      fgQuaternary: fgQuaternary ?? this.fgQuaternary,
      fgErrorPrimary: fgErrorPrimary ?? this.fgErrorPrimary,
      fgErrorSecondary: fgErrorSecondary ?? this.fgErrorSecondary,
      fgWarningPrimary: fgWarningPrimary ?? this.fgWarningPrimary,
      fgWarningSecondary: fgWarningSecondary ?? this.fgWarningSecondary,

      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textDisabled: textDisabled ?? this.textDisabled,
      textPlaceholder: textPlaceholder ?? this.textPlaceholder,

      borderPrimary: borderPrimary ?? this.borderPrimary,
      borderSecondary: borderSecondary ?? this.borderSecondary,
      borderTertiary: borderTertiary ?? this.borderTertiary,
      borderDisabled: borderDisabled ?? this.borderDisabled,
      borderError: borderError ?? this.borderError,
      borderErrorSubtle: borderErrorSubtle ?? this.borderErrorSubtle,

      utilityError50: utilityError50 ?? this.utilityError50,
      utilityError100: utilityError100 ?? this.utilityError100,
      utilityError200: utilityError200 ?? this.utilityError200,
      utilityError300: utilityError300 ?? this.utilityError300,
      utilityError400: utilityError400 ?? this.utilityError400,
      utilityError500: utilityError500 ?? this.utilityError500,
      utilityError600: utilityError600 ?? this.utilityError600,
      utilityError700: utilityError700 ?? this.utilityError700,

      utilitySuccess50: utilitySuccess50 ?? this.utilitySuccess50,
      utilitySuccess100: utilitySuccess100 ?? this.utilitySuccess100,
      utilitySuccess200: utilitySuccess200 ?? this.utilitySuccess200,
      utilitySuccess300: utilitySuccess300 ?? this.utilitySuccess300,
      utilitySuccess400: utilitySuccess400 ?? this.utilitySuccess400,
      utilitySuccess500: utilitySuccess500 ?? this.utilitySuccess500,
      utilitySuccess600: utilitySuccess600 ?? this.utilitySuccess600,
      utilitySuccess700: utilitySuccess700 ?? this.utilitySuccess700,

      utilityWarning50: utilityWarning50 ?? this.utilityWarning50,
      utilityWarning100: utilityWarning100 ?? this.utilityWarning100,
      utilityWarning200: utilityWarning200 ?? this.utilityWarning200,
      utilityWarning300: utilityWarning300 ?? this.utilityWarning300,
      utilityWarning400: utilityWarning400 ?? this.utilityWarning400,
      utilityWarning500: utilityWarning500 ?? this.utilityWarning500,
      utilityWarning600: utilityWarning600 ?? this.utilityWarning600,
      utilityWarning700: utilityWarning700 ?? this.utilityWarning700,

      btnSecondaryFg: btnSecondaryFg ?? this.btnSecondaryFg,
      btnSecondaryFgHover: btnSecondaryFgHover ?? this.btnSecondaryFgHover,
      btnSecondaryBg: btnSecondaryBg ?? this.btnSecondaryBg,
      btnSecondaryBgHover: btnSecondaryBgHover ?? this.btnSecondaryBgHover,
      btnSecondaryBorder: btnSecondaryBorder ?? this.btnSecondaryBorder,
      btnSecondaryBorderHover: btnSecondaryBorderHover ?? this.btnSecondaryBorderHover,
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
      fgQuaternary: Color.lerp(fgQuaternary, other.fgQuaternary, t)!,
      fgErrorPrimary: Color.lerp(fgErrorPrimary, other.fgErrorPrimary, t)!,
      fgErrorSecondary: Color.lerp(fgErrorSecondary, other.fgErrorSecondary, t)!,
      fgWarningPrimary: Color.lerp(fgWarningPrimary, other.fgWarningPrimary, t)!,
      fgWarningSecondary: Color.lerp(fgWarningSecondary, other.fgWarningSecondary, t)!,

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

      utilityError50: Color.lerp(utilityError50, other.utilityError50, t)!,
      utilityError100: Color.lerp(utilityError100, other.utilityError100, t)!,
      utilityError200: Color.lerp(utilityError200, other.utilityError200, t)!,
      utilityError300: Color.lerp(utilityError300, other.utilityError300, t)!,
      utilityError400: Color.lerp(utilityError400, other.utilityError400, t)!,
      utilityError500: Color.lerp(utilityError500, other.utilityError500, t)!,
      utilityError600: Color.lerp(utilityError600, other.utilityError600, t)!,
      utilityError700: Color.lerp(utilityError700, other.utilityError700, t)!,

      utilitySuccess50: Color.lerp(utilitySuccess50, other.utilitySuccess50, t)!,
      utilitySuccess100: Color.lerp(utilitySuccess100, other.utilitySuccess100, t)!,
      utilitySuccess200: Color.lerp(utilitySuccess200, other.utilitySuccess200, t)!,
      utilitySuccess300: Color.lerp(utilitySuccess300, other.utilitySuccess300, t)!,
      utilitySuccess400: Color.lerp(utilitySuccess400, other.utilitySuccess400, t)!,
      utilitySuccess500: Color.lerp(utilitySuccess500, other.utilitySuccess500, t)!,
      utilitySuccess600: Color.lerp(utilitySuccess600, other.utilitySuccess600, t)!,
      utilitySuccess700: Color.lerp(utilitySuccess700, other.utilitySuccess700, t)!,

      utilityWarning50: Color.lerp(utilityWarning50, other.utilityWarning50, t)!,
      utilityWarning100: Color.lerp(utilityWarning100, other.utilityWarning100, t)!,
      utilityWarning200: Color.lerp(utilityWarning200, other.utilityWarning200, t)!,
      utilityWarning300: Color.lerp(utilityWarning300, other.utilityWarning300, t)!,
      utilityWarning400: Color.lerp(utilityWarning400, other.utilityWarning400, t)!,
      utilityWarning500: Color.lerp(utilityWarning500, other.utilityWarning500, t)!,
      utilityWarning600: Color.lerp(utilityWarning600, other.utilityWarning600, t)!,
      utilityWarning700: Color.lerp(utilityWarning700, other.utilityWarning700, t)!,

      btnSecondaryFg: Color.lerp(btnSecondaryFg, other.btnSecondaryFg, t)!,
      btnSecondaryFgHover: Color.lerp(btnSecondaryFgHover, other.btnSecondaryFgHover, t)!,
      btnSecondaryBg: Color.lerp(btnSecondaryBg, other.btnSecondaryBg, t)!,
      btnSecondaryBgHover: Color.lerp(btnSecondaryBgHover, other.btnSecondaryBgHover, t)!,
      btnSecondaryBorder: Color.lerp(btnSecondaryBorder, other.btnSecondaryBorder, t)!,
      btnSecondaryBorderHover: Color.lerp(btnSecondaryBorderHover, other.btnSecondaryBorderHover, t)!,
    );
  }
}