import 'package:flutter/material.dart';

class AppTextThemeExtension extends ThemeExtension<AppTextThemeExtension> {
  final TextStyle body12Regular;
  final TextStyle body12SemiBold;
  final TextStyle body13Medium;
  final TextStyle body14Regular;
  final TextStyle body14Medium;
  final TextStyle body14SemiBold;
  final TextStyle body16Regular;
  final TextStyle body20Regular;
  final TextStyle title24SemiBold;
  final TextStyle title24Bold;
  final TextStyle title32Bold;

  AppTextThemeExtension({
    required this.body12Regular,
    required this.body12SemiBold,
    required this.body13Medium,
    required this.body14Regular,
    required this.body14Medium,
    required this.body14SemiBold,
    required this.body16Regular,
    required this.body20Regular,
    required this.title24SemiBold,
    required this.title24Bold,
    required this.title32Bold,
  });

  @override
  ThemeExtension<AppTextThemeExtension> copyWith({
    TextStyle? body12Regular,
    TextStyle? body12SemiBold,
    TextStyle? body13Medium,
    TextStyle? body14Regular,
    TextStyle? body14Medium,
    TextStyle? body14SemiBold,
    TextStyle? body16Regular,
    TextStyle? body20Regular,
    TextStyle? title24SemiBold,
    TextStyle? title24Bold,
    TextStyle? title32Bold,
  }) {
    return AppTextThemeExtension(
      body12Regular: body12Regular ?? this.body12Regular,
      body12SemiBold: body12SemiBold ?? this.body12SemiBold,
      body13Medium: body13Medium ?? this.body13Medium,
      body14Regular: body14Regular ?? this.body14Regular,
      body14Medium: body14Medium ?? this.body14Medium,
      body14SemiBold: body14SemiBold ?? this.body14SemiBold,
      body16Regular: body16Regular ?? this.body16Regular,
      body20Regular: body20Regular ?? this.body20Regular,
      title24SemiBold: title24SemiBold ?? this.title24SemiBold,
      title24Bold: title24Bold ?? this.title24Bold,
      title32Bold: title32Bold ?? this.title32Bold,
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
      body13Medium: TextStyle.lerp(body13Medium, other.body13Medium, t)!,
      body14Regular: TextStyle.lerp(body14Regular, other.body14Regular, t)!,
      body14Medium: TextStyle.lerp(body14Medium, other.body14Medium, t)!,
      body14SemiBold: TextStyle.lerp(body14SemiBold, other.body14SemiBold, t)!,
      body16Regular: TextStyle.lerp(body16Regular, other.body16Regular, t)!,
      body20Regular: TextStyle.lerp(body20Regular, other.body20Regular, t)!,
      title24SemiBold: TextStyle.lerp(title24SemiBold, other.title24SemiBold, t)!,
      title24Bold: TextStyle.lerp(title24Bold, other.title24Bold, t)!,
      title32Bold: TextStyle.lerp(title32Bold, other.title32Bold, t)!,
    );
  }
}
