import 'package:fitness/theme/text/typography.dart';
import 'package:flutter/material.dart';

import '../extensions/color_extension.dart';
import '../extensions/text_theme_extension.dart';

AppTextThemeExtension createAppTextThemeExtension({
  required Color headingTextColor,
  required Color bodyTextColor,
}) {
  return AppTextThemeExtension(
    body12Regular: AppTypography.body12Regular.copyWith(color: bodyTextColor),
    body12SemiBold: AppTypography.body12SemiBold.copyWith(color: bodyTextColor),
    body13Medium: AppTypography.body13Medium.copyWith(color: bodyTextColor),
    body14Regular: AppTypography.body14Regular.copyWith(color: bodyTextColor),
    body14Medium: AppTypography.body14Medium.copyWith(color: bodyTextColor),
    body14SemiBold: AppTypography.body14SemiBold.copyWith(color: bodyTextColor),
    body16Regular: AppTypography.body16Regular.copyWith(color: bodyTextColor),
    body20Regular: AppTypography.body20Regular.copyWith(color: bodyTextColor),
    title24SemiBold: AppTypography.title24SemiBold.copyWith(color: headingTextColor),
    title24Bold: AppTypography.title24Bold.copyWith(color: headingTextColor),
    title32Bold: AppTypography.title32Bold.copyWith(color: headingTextColor),
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

    textColorHeading: const Color(0xFFF7F7F7),
    textColorBody: const Color(0xFFEEEEEE),
    textColorDisabled: const Color(0xFFF7F7F7),
    textColorPlaceholder: const Color(0xFFFFFFFF),
    textColorOnColor: const Color(0xFFFFFFFF),
  );

  final darkTextTheme = createAppTextThemeExtension(
    headingTextColor: darkAppColor.textColorHeading,
    bodyTextColor: darkAppColor.textColorBody,
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

    textColorHeading: const Color(0xFF101010),
    textColorBody: const Color(0xFF616161),
    textColorDisabled: const Color(0xFFCECECE),
    textColorPlaceholder: const Color(0xFF888888),
    textColorOnColor: const Color(0xFFFFFFFF),
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
