import 'package:fitness/theme/src/themes/extensions/shadow_extension.dart';
import 'package:flutter/material.dart';

import '../extensions/color_extension.dart';
import '../extensions/text_theme_extension.dart';
import '../token/colors.dart';
import '../token/text_styles.dart';

AppTextThemeExtension createAppTextThemeExtension({
  required Color headingTextColor,
  required Color bodyTextColor,
}) {
  return AppTextThemeExtension(
    textXlSemibold: AppTextStyles.textXlSemibold.copyWith(color: bodyTextColor),
    textXlRegular: AppTextStyles.textXlRegular.copyWith(color: bodyTextColor),
    textXlMedium: AppTextStyles.textXlMedium.copyWith(color: bodyTextColor),
    textXlBold: AppTextStyles.textXlBold.copyWith(color: bodyTextColor),
    displayLgRegular: AppTextStyles.displayLgRegular.copyWith(color: headingTextColor),
    displayLgMedium: AppTextStyles.displayLgMedium.copyWith(color: headingTextColor),
    displayLgSemibold: AppTextStyles.displayLgSemibold.copyWith(color: headingTextColor),
    displayLgBold: AppTextStyles.displayLgBold.copyWith(color: headingTextColor),
    textLgRegular: AppTextStyles.textLgRegular.copyWith(color: bodyTextColor),
    textLgMedium: AppTextStyles.textLgMedium.copyWith(color: bodyTextColor),
    textLgSemibold: AppTextStyles.textLgSemibold.copyWith(color: bodyTextColor),
    textLgBold: AppTextStyles.textLgBold.copyWith(color: bodyTextColor),
    textMdRegular: AppTextStyles.textMdRegular.copyWith(color: bodyTextColor),
    textMdMedium: AppTextStyles.textMdMedium.copyWith(color: bodyTextColor),
    textMdSemibold: AppTextStyles.textMdSemibold.copyWith(color: bodyTextColor),
    textMdBold: AppTextStyles.textMdBold.copyWith(color: bodyTextColor),
    displayXlSemibold: AppTextStyles.displayXlSemibold.copyWith(color: headingTextColor),
    displayXlRegular: AppTextStyles.displayXlRegular.copyWith(color: headingTextColor),
    displayXlMedium: AppTextStyles.displayXlMedium.copyWith(color: headingTextColor),
    displayXlBold: AppTextStyles.displayXlBold.copyWith(color: headingTextColor),
    displayMdRegular: AppTextStyles.displayMdRegular.copyWith(color: headingTextColor),
    displayMdMedium: AppTextStyles.displayMdMedium.copyWith(color: headingTextColor),
    displayMdSemibold: AppTextStyles.displayMdSemibold.copyWith(color: headingTextColor),
    displayMdBold: AppTextStyles.displayMdBold.copyWith(color: headingTextColor),
    displayXsSemibold: AppTextStyles.displayXsSemibold.copyWith(color: headingTextColor),
    displayXsMedium: AppTextStyles.displayXsMedium.copyWith(color: headingTextColor),
    displayXsRegular: AppTextStyles.displayXsRegular.copyWith(color: headingTextColor),
    displayXsBold: AppTextStyles.displayXsBold.copyWith(color: headingTextColor),
    textSmMedium: AppTextStyles.textSmMedium.copyWith(color: bodyTextColor),
    textSmRegular: AppTextStyles.textSmRegular.copyWith(color: bodyTextColor),
    textSmSemibold: AppTextStyles.textSmSemibold.copyWith(color: bodyTextColor),
    textSmBold: AppTextStyles.textSmBold.copyWith(color: bodyTextColor),
    displaySmSemibold: AppTextStyles.displaySmSemibold.copyWith(color: headingTextColor),
    displaySmRegular: AppTextStyles.displaySmRegular.copyWith(color: headingTextColor),
    displaySmMedium: AppTextStyles.displaySmMedium.copyWith(color: headingTextColor),
    displaySmBold: AppTextStyles.displaySmBold.copyWith(color: headingTextColor),
    display2XlRegular: AppTextStyles.display2XlRegular.copyWith(color: headingTextColor),
    display2XlMedium: AppTextStyles.display2XlMedium.copyWith(color: headingTextColor),
    display2XlSemibold: AppTextStyles.display2XlSemibold.copyWith(color: headingTextColor),
    display2XlBold: AppTextStyles.display2XlBold.copyWith(color: headingTextColor),
    textXsMedium: AppTextStyles.textXsMedium.copyWith(color: bodyTextColor),
    textXsRegular: AppTextStyles.textXsRegular.copyWith(color: bodyTextColor),
    textXsSemibold: AppTextStyles.textXsSemibold.copyWith(color: bodyTextColor),
    textXsBold: AppTextStyles.textXsBold.copyWith(color: bodyTextColor),
  );
}

ThemeData createAppLightTheme({
  required Color primaryColor,
  Color? elevatedButtonColor,
  Color? elevatedButtonTextColor,
  bool? useMaterial3 = true,
}) {
  AppColorExtension lightAppColor = AppColorExtension(
    primary: primaryColor,
    success: const Color(0xFF00C48C),
    divider: const Color(0xFFE0E0E0),
    background: const Color(0xFFFFFFFF),
    surface: const Color(0xFFFFFFFF),

    bgPrimary: AppColors.colorsBaseWhite,
    bgSecondary: AppColors.colorsGrayLightMode50,
    bgTertiary: AppColors.colorsGrayLightMode100,
    bgActive: AppColors.colorsGrayLightMode50,

    fgPrimary: AppColors.colorsGrayLightMode900,
    fgSecondary: AppColors.colorsGrayLightMode700,
    fgTertiary: AppColors.colorsGrayLightMode600,
    fgQuinary: AppColors.colorsGrayLightMode400,
    fgQuaternary: AppColors.colorsGrayLightMode400,
    fgErrorPrimary: AppColors.colorsError600,
    fgErrorSecondary: AppColors.colorsError500,
    fgWarningPrimary: AppColors.colorsWarning600,
    fgWarningSecondary: AppColors.colorsWarning500,

    textPrimary: AppColors.colorsGrayLightMode900,
    textSecondary: AppColors.colorsGrayLightMode700,
    textTertiary: AppColors.colorsGrayLightMode600,
    textDisabled: AppColors.colorsGrayLightMode500,
    textPlaceholder: AppColors.colorsGrayLightMode500,
    textQuaternary: AppColors.colorsGrayLightMode500,

    borderPrimary: AppColors.colorsGrayLightMode300,
    borderSecondary: AppColors.colorsGrayLightMode200,
    borderTertiary: AppColors.colorsGrayLightMode100,
    borderDisabled: AppColors.colorsGrayLightMode300,
    borderError: AppColors.colorsError500,
    borderErrorSubtle: AppColors.colorsError300,

    utilityError50: AppColors.colorsError50,
    utilityError100: AppColors.colorsError100,
    utilityError200: AppColors.colorsError200,
    utilityError300: AppColors.colorsError300,
    utilityError400: AppColors.colorsError400,
    utilityError500: AppColors.colorsError500,
    utilityError600: AppColors.colorsError600,
    utilityError700: AppColors.colorsError700,

    utilitySuccess50: AppColors.colorsSuccess50,
    utilitySuccess100: AppColors.colorsSuccess100,
    utilitySuccess200: AppColors.colorsSuccess200,
    utilitySuccess300: AppColors.colorsSuccess300,
    utilitySuccess400: AppColors.colorsSuccess400,
    utilitySuccess500: AppColors.colorsSuccess500,
    utilitySuccess600: AppColors.colorsSuccess600,
    utilitySuccess700: AppColors.colorsSuccess700,

    utilityWarning50: AppColors.colorsWarning50,
    utilityWarning100: AppColors.colorsWarning100,
    utilityWarning200: AppColors.colorsWarning200,
    utilityWarning300: AppColors.colorsWarning300,
    utilityWarning400: AppColors.colorsWarning400,
    utilityWarning500: AppColors.colorsWarning500,
    utilityWarning600: AppColors.colorsWarning600,
    utilityWarning700: AppColors.colorsWarning700,

    btnSecondaryBg: AppColors.colorsBaseWhite,
    btnSecondaryBgHover: AppColors.colorsGrayLightMode50,
    btnSecondaryFg: AppColors.colorsGrayLightMode700,
    btnSecondaryFgHover: AppColors.colorsGrayLightMode800,
    btnSecondaryBorder: AppColors.colorsGrayLightMode300,
    btnSecondaryBorderHover: AppColors.colorsGrayLightMode300,
  );

  final lightTextTheme = createAppTextThemeExtension(
    headingTextColor: lightAppColor.textSecondary,
    bodyTextColor: lightAppColor.textTertiary,
  );

  final lightShadowTheme = AppShadowExtension(
    shadowXs: const BoxShadow(
      color: Color(0x0D0A0D12),
      blurRadius: 2,
      offset: Offset(0.0, 1.0),
      spreadRadius: 0,
    ),
    shadowLg1: const BoxShadow(
      color: Color(0x140A0D12),
      offset: Offset(0, 12),
      blurRadius: 16,
      spreadRadius: -4,
    ),
    shadowLg2: const BoxShadow(
      color: Color(0x080A0D12),
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -2,
    ),
    shadowLg3: const BoxShadow(
      color: Color(0x0A0A0D12),
      offset: Offset(0, 2),
      blurRadius: 2,
      spreadRadius: -1,
    ),
  );

  final colorScheme = ColorScheme.fromSeed(
    seedColor: lightAppColor.primary,
    brightness: Brightness.light,
    surface: lightAppColor.surface,
  );

  return createAppTheme(
    colorScheme: colorScheme,
    appColorExtension: lightAppColor,
    appTextThemeExtension: lightTextTheme,
    appShadowExtension: lightShadowTheme,
  );
}

ThemeData createAppDarkTheme({
  required Color primaryColor,
  Color? elevatedButtonColor,
  Color? elevatedButtonTextColor,
  bool? useMaterial3 = true,
}) {
  AppColorExtension darkAppColor = AppColorExtension(
    primary: primaryColor,
    success: const Color(0xFF00C48C),
    divider: const Color(0xFFE0E0E0),
    background: const Color(0xFF121212),
    surface: const Color(0xFF121212),

    bgPrimary: AppColors.colorsGrayDarkMode950,
    bgSecondary: AppColors.colorsGrayDarkMode900,
    bgTertiary: AppColors.colorsGrayDarkMode800,
    bgActive: AppColors.colorsGrayDarkMode800,

    fgPrimary: AppColors.colorsBaseWhite,
    fgSecondary: AppColors.colorsGrayDarkMode300,
    fgTertiary: AppColors.colorsGrayDarkMode400,
    fgQuinary: AppColors.colorsGrayDarkMode500,
    fgQuaternary: AppColors.colorsGrayDarkMode600,
    fgErrorPrimary: AppColors.colorsError500,
    fgErrorSecondary: AppColors.colorsError400,
    fgWarningPrimary: AppColors.colorsWarning500,
    fgWarningSecondary: AppColors.colorsWarning400,

    textPrimary: AppColors.colorsGrayDarkMode50,
    textSecondary: AppColors.colorsGrayDarkMode300,
    textTertiary: AppColors.colorsGrayDarkMode400,
    textDisabled: AppColors.colorsGrayDarkMode500,
    textPlaceholder: AppColors.colorsGrayDarkMode500,
    textQuaternary: AppColors.colorsGrayDarkMode400,

    borderPrimary: AppColors.colorsGrayDarkMode700,
    borderSecondary: AppColors.colorsGrayDarkMode800,
    borderTertiary: AppColors.colorsGrayDarkMode800,
    borderDisabled: AppColors.colorsGrayDarkMode700,
    borderError: AppColors.colorsError400,
    borderErrorSubtle: AppColors.colorsError400,

    utilityError50: AppColors.colorsError950,
    utilityError100: AppColors.colorsError900,
    utilityError200: AppColors.colorsError800,
    utilityError300: AppColors.colorsError700,
    utilityError400: AppColors.colorsError600,
    utilityError500: AppColors.colorsError500,
    utilityError600: AppColors.colorsError400,
    utilityError700: AppColors.colorsError300,

    utilitySuccess50: AppColors.colorsSuccess950,
    utilitySuccess100: AppColors.colorsSuccess900,
    utilitySuccess200: AppColors.colorsSuccess800,
    utilitySuccess300: AppColors.colorsSuccess700,
    utilitySuccess400: AppColors.colorsSuccess600,
    utilitySuccess500: AppColors.colorsSuccess500,
    utilitySuccess600: AppColors.colorsSuccess400,
    utilitySuccess700: AppColors.colorsSuccess300,

    utilityWarning50: AppColors.colorsWarning950,
    utilityWarning100: AppColors.colorsWarning900,
    utilityWarning200: AppColors.colorsWarning800,
    utilityWarning300: AppColors.colorsWarning700,
    utilityWarning400: AppColors.colorsWarning600,
    utilityWarning500: AppColors.colorsWarning500,
    utilityWarning600: AppColors.colorsWarning400,
    utilityWarning700: AppColors.colorsWarning300,

    btnSecondaryBg: AppColors.colorsGrayDarkMode900,
    btnSecondaryBgHover: AppColors.colorsGrayDarkMode800,
    btnSecondaryFg: AppColors.colorsGrayDarkMode300,
    btnSecondaryFgHover: AppColors.colorsGrayDarkMode100,
    btnSecondaryBorder: AppColors.colorsGrayDarkMode700,
    btnSecondaryBorderHover: AppColors.colorsGrayDarkMode700,
  );

  final darkTextTheme = createAppTextThemeExtension(
    headingTextColor: darkAppColor.textSecondary,
    bodyTextColor: darkAppColor.textTertiary,
  );

  final darkShadowTheme = AppShadowExtension(
    shadowXs: const BoxShadow(
      color: AppColors.colorsBaseTransparent,
      blurRadius: 2,
      offset: Offset(0.0, 1.0),
      spreadRadius: 0,
    ),
    shadowLg1: const BoxShadow(
      color: AppColors.colorsBaseTransparent,
      offset: Offset(0, 12),
      blurRadius: 16,
      spreadRadius: -4,
    ),
    shadowLg2: const BoxShadow(
      color: AppColors.colorsBaseTransparent,
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -2,
    ),
    shadowLg3: const BoxShadow(
      color: AppColors.colorsBaseTransparent,
      offset: Offset(0, 2),
      blurRadius: 2,
      spreadRadius: -1,
    ),
  );

  final colorScheme = ColorScheme.fromSeed(
    seedColor: darkAppColor.primary,
    brightness: Brightness.dark,
    surface: darkAppColor.surface,
  );

  return createAppTheme(
    colorScheme: colorScheme,
    appColorExtension: darkAppColor,
    appTextThemeExtension: darkTextTheme,
    appShadowExtension: darkShadowTheme,
  );
}

ThemeData createAppTheme({
  required ColorScheme colorScheme,
  bool? useMaterial3 = true,
  required AppColorExtension appColorExtension,
  required AppTextThemeExtension appTextThemeExtension,
  required AppShadowExtension appShadowExtension,
}) {
  return ThemeData(
    colorScheme: colorScheme,
    useMaterial3: useMaterial3,
    fontFamily: 'PlusJakartaSans',
    extensions: [
      appColorExtension,
      appTextThemeExtension,
      appShadowExtension,
    ],
  );
}

extension AppThemeExtension on ThemeData {
  AppColorExtension get appColor => extension<AppColorExtension>()!;

  AppTextThemeExtension get appTextTheme => extension<AppTextThemeExtension>()!;
  AppShadowExtension get appShadow => extension<AppShadowExtension>()!;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
