import 'package:flutter/material.dart';

import '../token/text_styles.dart';

class AppTextThemeExtension extends ThemeExtension<AppTextThemeExtension> {
  final TextStyle textXlSemibold;
  final TextStyle textXlRegular;
  final TextStyle textXlMedium;
  final TextStyle textXlBold;
  final TextStyle displayLgRegular;
  final TextStyle displayLgMedium;
  final TextStyle displayLgSemibold;
  final TextStyle displayLgBold;
  final TextStyle textLgRegular;
  final TextStyle textLgMedium;
  final TextStyle textLgSemibold;
  final TextStyle textLgBold;
  final TextStyle textMdRegular;
  final TextStyle textMdMedium;
  final TextStyle textMdSemibold;
  final TextStyle textMdBold;
  final TextStyle displayXlSemibold;
  final TextStyle displayXlRegular;
  final TextStyle displayXlMedium;
  final TextStyle displayXlBold;
  final TextStyle displayMdRegular;
  final TextStyle displayMdMedium;
  final TextStyle displayMdSemibold;
  final TextStyle displayMdBold;
  final TextStyle displayXsSemibold;
  final TextStyle displayXsMedium;
  final TextStyle displayXsRegular;
  final TextStyle displayXsBold;
  final TextStyle textSmMedium;
  final TextStyle textSmRegular;
  final TextStyle textSmSemibold;
  final TextStyle textSmBold;
  final TextStyle displaySmSemibold;
  final TextStyle displaySmRegular;
  final TextStyle displaySmMedium;
  final TextStyle displaySmBold;
  final TextStyle display2XlRegular;
  final TextStyle display2XlMedium;
  final TextStyle display2XlSemibold;
  final TextStyle display2XlBold;
  final TextStyle textXsMedium;
  final TextStyle textXsRegular;
  final TextStyle textXsSemibold;
  final TextStyle textXsBold;

  AppTextThemeExtension({
    required this.textXlSemibold,
    required this.textXlRegular,
    required this.textXlMedium,
    required this.textXlBold,
    required this.displayLgRegular,
    required this.displayLgMedium,
    required this.displayLgSemibold,
    required this.displayLgBold,
    required this.textLgRegular,
    required this.textLgMedium,
    required this.textLgSemibold,
    required this.textLgBold,
    required this.textMdRegular,
    required this.textMdMedium,
    required this.textMdSemibold,
    required this.textMdBold,
    required this.displayXlSemibold,
    required this.displayXlRegular,
    required this.displayXlMedium,
    required this.displayXlBold,
    required this.displayMdRegular,
    required this.displayMdMedium,
    required this.displayMdSemibold,
    required this.displayMdBold,
    required this.displayXsSemibold,
    required this.displayXsMedium,
    required this.displayXsRegular,
    required this.displayXsBold,
    required this.textSmMedium,
    required this.textSmRegular,
    required this.textSmSemibold,
    required this.textSmBold,
    required this.displaySmSemibold,
    required this.displaySmRegular,
    required this.displaySmMedium,
    required this.displaySmBold,
    required this.display2XlRegular,
    required this.display2XlMedium,
    required this.display2XlSemibold,
    required this.display2XlBold,
    required this.textXsMedium,
    required this.textXsRegular,
    required this.textXsSemibold,
    required this.textXsBold,
  });

  factory AppTextThemeExtension.fromAppTextStyles() {
    return AppTextThemeExtension(
      textXlSemibold: AppTextStyles.textXlSemibold,
      textXlRegular: AppTextStyles.textXlRegular,
      textXlMedium: AppTextStyles.textXlMedium,
      textXlBold: AppTextStyles.textXlBold,
      displayLgRegular: AppTextStyles.displayLgRegular,
      displayLgMedium: AppTextStyles.displayLgMedium,
      displayLgSemibold: AppTextStyles.displayLgSemibold,
      displayLgBold: AppTextStyles.displayLgBold,
      textLgRegular: AppTextStyles.textLgRegular,
      textLgMedium: AppTextStyles.textLgMedium,
      textLgSemibold: AppTextStyles.textLgSemibold,
      textLgBold: AppTextStyles.textLgBold,
      textMdRegular: AppTextStyles.textMdRegular,
      textMdMedium: AppTextStyles.textMdMedium,
      textMdSemibold: AppTextStyles.textMdSemibold,
      textMdBold: AppTextStyles.textMdBold,
      displayXlSemibold: AppTextStyles.displayXlSemibold,
      displayXlRegular: AppTextStyles.displayXlRegular,
      displayXlMedium: AppTextStyles.displayXlMedium,
      displayXlBold: AppTextStyles.displayXlBold,
      displayMdRegular: AppTextStyles.displayMdRegular,
      displayMdMedium: AppTextStyles.displayMdMedium,
      displayMdSemibold: AppTextStyles.displayMdSemibold,
      displayMdBold: AppTextStyles.displayMdBold,
      displayXsSemibold: AppTextStyles.displayXsSemibold,
      displayXsMedium: AppTextStyles.displayXsMedium,
      displayXsRegular: AppTextStyles.displayXsRegular,
      displayXsBold: AppTextStyles.displayXsBold,
      textSmMedium: AppTextStyles.textSmMedium,
      textSmRegular: AppTextStyles.textSmRegular,
      textSmSemibold: AppTextStyles.textSmSemibold,
      textSmBold: AppTextStyles.textSmBold,
      displaySmSemibold: AppTextStyles.displaySmSemibold,
      displaySmRegular: AppTextStyles.displaySmRegular,
      displaySmMedium: AppTextStyles.displaySmMedium,
      displaySmBold: AppTextStyles.displaySmBold,
      display2XlRegular: AppTextStyles.display2XlRegular,
      display2XlMedium: AppTextStyles.display2XlMedium,
      display2XlSemibold: AppTextStyles.display2XlSemibold,
      display2XlBold: AppTextStyles.display2XlBold,
      textXsMedium: AppTextStyles.textXsMedium,
      textXsRegular: AppTextStyles.textXsRegular,
      textXsSemibold: AppTextStyles.textXsSemibold,
      textXsBold: AppTextStyles.textXsBold,
    );
  }

  @override
  ThemeExtension<AppTextThemeExtension> copyWith({
    TextStyle? textXlSemibold,
    TextStyle? textXlRegular,
    TextStyle? textXlMedium,
    TextStyle? textXlBold,
    TextStyle? displayLgRegular,
    TextStyle? displayLgMedium,
    TextStyle? displayLgSemibold,
    TextStyle? displayLgBold,
    TextStyle? textLgRegular,
    TextStyle? textLgMedium,
    TextStyle? textLgSemibold,
    TextStyle? textLgBold,
    TextStyle? textMdRegular,
    TextStyle? textMdMedium,
    TextStyle? textMdSemibold,
    TextStyle? textMdBold,
    TextStyle? displayXlSemibold,
    TextStyle? displayXlRegular,
    TextStyle? displayXlMedium,
    TextStyle? displayXlBold,
    TextStyle? displayMdRegular,
    TextStyle? displayMdMedium,
    TextStyle? displayMdSemibold,
    TextStyle? displayMdBold,
    TextStyle? displayXsSemibold,
    TextStyle? displayXsMedium,
    TextStyle? displayXsRegular,
    TextStyle? displayXsBold,
    TextStyle? textSmMedium,
    TextStyle? textSmRegular,
    TextStyle? textSmSemibold,
    TextStyle? textSmBold,
    TextStyle? displaySmSemibold,
    TextStyle? displaySmRegular,
    TextStyle? displaySmMedium,
    TextStyle? displaySmBold,
    TextStyle? display2XlRegular,
    TextStyle? display2XlMedium,
    TextStyle? display2XlSemibold,
    TextStyle? display2XlBold,
    TextStyle? textXsMedium,
    TextStyle? textXsRegular,
    TextStyle? textXsSemibold,
    TextStyle? textXsBold,
  }) {
    return AppTextThemeExtension(
      textXlSemibold: textXlSemibold ?? this.textXlSemibold,
      textXlRegular: textXlRegular ?? this.textXlRegular,
      textXlMedium: textXlMedium ?? this.textXlMedium,
      textXlBold: textXlBold ?? this.textXlBold,
      displayLgRegular: displayLgRegular ?? this.displayLgRegular,
      displayLgMedium: displayLgMedium ?? this.displayLgMedium,
      displayLgSemibold: displayLgSemibold ?? this.displayLgSemibold,
      displayLgBold: displayLgBold ?? this.displayLgBold,
      textLgRegular: textLgRegular ?? this.textLgRegular,
      textLgMedium: textLgMedium ?? this.textLgMedium,
      textLgSemibold: textLgSemibold ?? this.textLgSemibold,
      textLgBold: textLgBold ?? this.textLgBold,
      textMdRegular: textMdRegular ?? this.textMdRegular,
      textMdMedium: textMdMedium ?? this.textMdMedium,
      textMdSemibold: textMdSemibold ?? this.textMdSemibold,
      textMdBold: textMdBold ?? this.textMdBold,
      displayXlSemibold: displayXlSemibold ?? this.displayXlSemibold,
      displayXlRegular: displayXlRegular ?? this.displayXlRegular,
      displayXlMedium: displayXlMedium ?? this.displayXlMedium,
      displayXlBold: displayXlBold ?? this.displayXlBold,
      displayMdRegular: displayMdRegular ?? this.displayMdRegular,
      displayMdMedium: displayMdMedium ?? this.displayMdMedium,
      displayMdSemibold: displayMdSemibold ?? this.displayMdSemibold,
      displayMdBold: displayMdBold ?? this.displayMdBold,
      displayXsSemibold: displayXsSemibold ?? this.displayXsSemibold,
      displayXsMedium: displayXsMedium ?? this.displayXsMedium,
      displayXsRegular: displayXsRegular ?? this.displayXsRegular,
      displayXsBold: displayXsBold ?? this.displayXsBold,
      textSmMedium: textSmMedium ?? this.textSmMedium,
      textSmRegular: textSmRegular ?? this.textSmRegular,
      textSmSemibold: textSmSemibold ?? this.textSmSemibold,
      textSmBold: textSmBold ?? this.textSmBold,
      displaySmSemibold: displaySmSemibold ?? this.displaySmSemibold,
      displaySmRegular: displaySmRegular ?? this.displaySmRegular,
      displaySmMedium: displaySmMedium ?? this.displaySmMedium,
      displaySmBold: displaySmBold ?? this.displaySmBold,
      display2XlRegular: display2XlRegular ?? this.display2XlRegular,
      display2XlMedium: display2XlMedium ?? this.display2XlMedium,
      display2XlSemibold: display2XlSemibold ?? this.display2XlSemibold,
      display2XlBold: display2XlBold ?? this.display2XlBold,
      textXsMedium: textXsMedium ?? this.textXsMedium,
      textXsRegular: textXsRegular ?? this.textXsRegular,
      textXsSemibold: textXsSemibold ?? this.textXsSemibold,
      textXsBold: textXsBold ?? this.textXsBold,
    );
  }

  @override
  ThemeExtension<AppTextThemeExtension> lerp(
    covariant ThemeExtension<AppTextThemeExtension>? other,
    double t,
  ) {
    if (other is! AppTextThemeExtension) {
      return this;
    }

    return AppTextThemeExtension(
      textXlSemibold: TextStyle.lerp(textXlSemibold, other.textXlSemibold, t)!,
      textXlRegular: TextStyle.lerp(textXlRegular, other.textXlRegular, t)!,
      textXlMedium: TextStyle.lerp(textXlMedium, other.textXlMedium, t)!,
      textXlBold: TextStyle.lerp(textXlBold, other.textXlBold, t)!,
      displayLgRegular: TextStyle.lerp(displayLgRegular, other.displayLgRegular, t)!,
      displayLgMedium: TextStyle.lerp(displayLgMedium, other.displayLgMedium, t)!,
      displayLgSemibold: TextStyle.lerp(displayLgSemibold, other.displayLgSemibold, t)!,
      displayLgBold: TextStyle.lerp(displayLgBold, other.displayLgBold, t)!,
      textLgRegular: TextStyle.lerp(textLgRegular, other.textLgRegular, t)!,
      textLgMedium: TextStyle.lerp(textLgMedium, other.textLgMedium, t)!,
      textLgSemibold: TextStyle.lerp(textLgSemibold, other.textLgSemibold, t)!,
      textLgBold: TextStyle.lerp(textLgBold, other.textLgBold, t)!,
      textMdRegular: TextStyle.lerp(textMdRegular, other.textMdRegular, t)!,
      textMdMedium: TextStyle.lerp(textMdMedium, other.textMdMedium, t)!,
      textMdSemibold: TextStyle.lerp(textMdSemibold, other.textMdSemibold, t)!,
      textMdBold: TextStyle.lerp(textMdBold, other.textMdBold, t)!,
      displayXlSemibold: TextStyle.lerp(displayXlSemibold, other.displayXlSemibold, t)!,
      displayXlRegular: TextStyle.lerp(displayXlRegular, other.displayXlRegular, t)!,
      displayXlMedium: TextStyle.lerp(displayXlMedium, other.displayXlMedium, t)!,
      displayXlBold: TextStyle.lerp(displayXlBold, other.displayXlBold, t)!,
      displayMdRegular: TextStyle.lerp(displayMdRegular, other.displayMdRegular, t)!,
      displayMdMedium: TextStyle.lerp(displayMdMedium, other.displayMdMedium, t)!,
      displayMdSemibold: TextStyle.lerp(displayMdSemibold, other.displayMdSemibold, t)!,
      displayMdBold: TextStyle.lerp(displayMdBold, other.displayMdBold, t)!,
      displayXsSemibold: TextStyle.lerp(displayXsSemibold, other.displayXsSemibold, t)!,
      displayXsMedium: TextStyle.lerp(displayXsMedium, other.displayXsMedium, t)!,
      displayXsRegular: TextStyle.lerp(displayXsRegular, other.displayXsRegular, t)!,
      displayXsBold: TextStyle.lerp(displayXsBold, other.displayXsBold, t)!,
      textSmMedium: TextStyle.lerp(textSmMedium, other.textSmMedium, t)!,
      textSmRegular: TextStyle.lerp(textSmRegular, other.textSmRegular, t)!,
      textSmSemibold: TextStyle.lerp(textSmSemibold, other.textSmSemibold, t)!,
      textSmBold: TextStyle.lerp(textSmBold, other.textSmBold, t)!,
      displaySmSemibold: TextStyle.lerp(displaySmSemibold, other.displaySmSemibold, t)!,
      displaySmRegular: TextStyle.lerp(displaySmRegular, other.displaySmRegular, t)!,
      displaySmMedium: TextStyle.lerp(displaySmMedium, other.displaySmMedium, t)!,
      displaySmBold: TextStyle.lerp(displaySmBold, other.displaySmBold, t)!,
      display2XlRegular: TextStyle.lerp(display2XlRegular, other.display2XlRegular, t)!,
      display2XlMedium: TextStyle.lerp(display2XlMedium, other.display2XlMedium, t)!,
      display2XlSemibold: TextStyle.lerp(display2XlSemibold, other.display2XlSemibold, t)!,
      display2XlBold: TextStyle.lerp(display2XlBold, other.display2XlBold, t)!,
      textXsMedium: TextStyle.lerp(textXsMedium, other.textXsMedium, t)!,
      textXsRegular: TextStyle.lerp(textXsRegular, other.textXsRegular, t)!,
      textXsSemibold: TextStyle.lerp(textXsSemibold, other.textXsSemibold, t)!,
      textXsBold: TextStyle.lerp(textXsBold, other.textXsBold, t)!,
    );
  }
}