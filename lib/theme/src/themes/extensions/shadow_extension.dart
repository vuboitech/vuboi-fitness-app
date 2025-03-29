import 'package:flutter/material.dart';

class AppShadowExtension extends ThemeExtension<AppShadowExtension> {
  final List<BoxShadow> shadowXs;

  AppShadowExtension({
    required this.shadowXs,
  });

  @override
  ThemeExtension<AppShadowExtension> copyWith({
    List<BoxShadow>? surface,
  }) {
    return AppShadowExtension(
      shadowXs: surface ?? this.shadowXs,
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

    final shorterList = shadowXs.length < other.shadowXs.length ? shadowXs : other.shadowXs;
    final longerList = shadowXs.length >= other.shadowXs.length ? shadowXs : other.shadowXs;

    final lerpedSurface = List<BoxShadow>.generate(longerList.length, (i) {
      if (i < shorterList.length) {
        return BoxShadow.lerp(shorterList[i], longerList[i], t)!;
      } else {
        // Handle cases where one theme has more shadows
        return longerList[i].scale(t); // Apply scaling for missing shadows
      }
    });

    return AppShadowExtension(
      shadowXs: lerpedSurface,
    );
  }
}