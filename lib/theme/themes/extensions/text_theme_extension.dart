import 'package:flutter/material.dart';

class AppTextThemeExtension extends ThemeExtension<AppTextThemeExtension> {
  final TextStyle body12Regular;
  final TextStyle body12SemiBold;
  final TextStyle body14Regular;
  final TextStyle body14SemiBold;
  final TextStyle body16Regular;

  AppTextThemeExtension({
    required this.body12Regular,
    required this.body12SemiBold,
    required this.body14Regular,
    required this.body14SemiBold,
    required this.body16Regular,
  });

  @override
  ThemeExtension<AppTextThemeExtension> copyWith({
    TextStyle? body12Regular,
    TextStyle? body12SemiBold,
    TextStyle? body14Regular,
    TextStyle? body14SemiBold,
    TextStyle? body16Regular,
  }) {
    return AppTextThemeExtension(
      body12Regular: body12Regular ?? this.body12Regular,
      body12SemiBold: body12SemiBold ?? this.body12SemiBold,
      body14Regular: body14Regular ?? this.body14Regular,
      body14SemiBold: body14SemiBold ?? this.body14SemiBold,
      body16Regular: body16Regular ?? this.body16Regular,
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
      body12Regular: TextStyle.lerp(body12Regular, other.body12Regular, t)!,
      body12SemiBold: TextStyle.lerp(body12SemiBold, other.body12SemiBold, t)!,
      body14Regular: TextStyle.lerp(body14Regular, other.body14Regular, t)!,
      body14SemiBold: TextStyle.lerp(body14SemiBold, other.body14SemiBold, t)!,
      body16Regular: TextStyle.lerp(body16Regular, other.body16Regular, t)!,
    );
  }
}
