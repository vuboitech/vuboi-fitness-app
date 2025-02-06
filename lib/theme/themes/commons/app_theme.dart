import 'package:flutter/material.dart';

import '../extensions/color_extension.dart';
import '../extensions/text_theme_extension.dart';

AppTextThemeExtension createAppTextThemeExtension({
  required TextStyle body12Regular,
  required TextStyle body12SemiBold,
  required TextStyle body14Regular,
  required TextStyle body14SemiBold,
  required TextStyle body16Regular,
}) {
  return AppTextThemeExtension(
    body12Regular: body12Regular,
    body12SemiBold: body12SemiBold,
    body14Regular: body14Regular,
    body14SemiBold: body14SemiBold,
    body16Regular: body16Regular,
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
  );

  final lightTextTheme = createAppTextThemeExtension(
    body12Regular: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
    body12SemiBold: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    body14Regular: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    body14SemiBold: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    body16Regular: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  );

  final colorScheme = ColorScheme.fromSeed(
    seedColor: lightAppColor.primary,
    brightness: Brightness.light,
    background: lightAppColor.background,
    surface: lightAppColor.surface,
  );

  return createAppTheme(
    colorScheme: colorScheme,
    appColorExtension: lightAppColor,
    appTextThemeExtension: lightTextTheme,
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
  );

  final darkTextTheme = createAppTextThemeExtension(
    body12Regular: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
    body12SemiBold: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    body14Regular: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    body14SemiBold: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    body16Regular: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  );

  final colorScheme = ColorScheme.fromSeed(
    seedColor: darkAppColor.primary,
    brightness: Brightness.dark,
    background: darkAppColor.background,
    surface: darkAppColor.surface,
  );

  return createAppTheme(
    colorScheme: colorScheme,
    appColorExtension: darkAppColor,
    appTextThemeExtension: darkTextTheme,
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
  AppColorExtension get appColorExtension => extension<AppColorExtension>()!;

  AppTextThemeExtension get appTextThemeExtension => extension<AppTextThemeExtension>()!;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
