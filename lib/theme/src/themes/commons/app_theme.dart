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

    textPrimary: AppColors.colorsGrayDarkMode50,
    textSecondary: AppColors.colorsGrayDarkMode300,
    textTertiary: AppColors.colorsGrayDarkMode400,
    textDisabled: AppColors.colorsGrayDarkMode500,
    textPlaceholder: AppColors.colorsGrayDarkMode500,

    borderPrimary: AppColors.colorsGrayDarkMode700,
    borderSecondary: AppColors.colorsGrayDarkMode800,
    borderTertiary: AppColors.colorsGrayDarkMode800,
    borderDisabled: AppColors.colorsGrayDarkMode700,
  );

  final darkTextTheme = createAppTextThemeExtension(
    headingTextColor: darkAppColor.textPrimary,
    bodyTextColor: darkAppColor.textSecondary,
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

    textPrimary: AppColors.colorsGrayLightMode900,
    textSecondary: AppColors.colorsGrayLightMode700,
    textTertiary: AppColors.colorsGrayLightMode600,
    textDisabled: AppColors.colorsGrayLightMode500,
    textPlaceholder: AppColors.colorsGrayLightMode500,

    borderPrimary: AppColors.colorsGrayLightMode300,
    borderSecondary: AppColors.colorsGrayLightMode200,
    borderTertiary: AppColors.colorsGrayLightMode100,
    borderDisabled: AppColors.colorsGrayLightMode300,
  );

  final lightTextTheme = createAppTextThemeExtension(
    headingTextColor: lightAppColor.primary,
    bodyTextColor: const Color(0xFF000000),
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
  );
}

ThemeData createAppTheme({
  required ColorScheme colorScheme,
  bool? useMaterial3 = true,
  required AppColorExtension appColorExtension,
  required AppTextThemeExtension appTextThemeExtension,
}) {
  return ThemeData(
    colorScheme: colorScheme,
    useMaterial3: useMaterial3,
    fontFamily: 'PlusJakartaSans',
    extensions: [
      appColorExtension,
      appTextThemeExtension,
    ],
  );
}

extension AppThemeExtension on ThemeData {
  AppColorExtension get appColor => extension<AppColorExtension>()!;

  AppTextThemeExtension get appTextTheme => extension<AppTextThemeExtension>()!;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
