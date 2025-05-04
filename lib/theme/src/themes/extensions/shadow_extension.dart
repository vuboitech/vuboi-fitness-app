import 'package:flutter/material.dart';

class AppShadowExtension extends ThemeExtension<AppShadowExtension> {
  final BoxShadow shadowXs;
  final BoxShadow shadowLg1;
  final BoxShadow shadowLg2;
  final BoxShadow shadowLg3;

  AppShadowExtension({
    required this.shadowXs,
    required this.shadowLg1,
    required this.shadowLg2,
    required this.shadowLg3,
  });

  @override
  ThemeExtension<AppShadowExtension> copyWith({
    BoxShadow? shadowXs,
    BoxShadow? shadowLg1,
    BoxShadow? shadowLg2,
    BoxShadow? shadowLg3,
  }) {
    return AppShadowExtension(
      shadowXs: shadowXs ?? this.shadowXs,
      shadowLg1: shadowLg1 ?? this.shadowLg1,
      shadowLg2: shadowLg2 ?? this.shadowLg2,
      shadowLg3: shadowLg3 ?? this.shadowLg3,
    );
  }

  @override
  ThemeExtension<AppShadowExtension> lerp(
      covariant ThemeExtension<AppShadowExtension>? other,
      double t,
      ) {
    if (other is! AppShadowExtension) {
      return this;
    }

    return AppShadowExtension(
      shadowXs: BoxShadow.lerp(shadowXs, other.shadowXs, t)!,
      shadowLg1: BoxShadow.lerp(shadowLg1, other.shadowLg1, t)!,
      shadowLg2: BoxShadow.lerp(shadowLg2, other.shadowLg2, t)!,
      shadowLg3: BoxShadow.lerp(shadowLg3, other.shadowLg3, t)!,
    );
  }
}