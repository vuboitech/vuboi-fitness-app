import 'package:flutter/cupertino.dart';

class AppColor {
  static Color primaryColor = const Color(0xFFF9701F);

  static LinearGradient seaHalberd = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6503CE),
      Color(0xFF00B5DA),
    ],
    stops: [0.1385, 1],
    transform: GradientRotation(105.89 * 3.14159 / 180),
  );
}