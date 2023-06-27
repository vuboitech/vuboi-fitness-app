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

  static LinearGradient purpleBlack = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF5C03BC),
      Color(0xFF000000),
    ],
    stops: [0.1385, 1],
  );

  static LinearGradient cyanBlack = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF28B8D5),
      Color(0xFF000000),
    ],
    stops: [0.1385, 1],
  );

  static LinearGradient redBlack = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFB3044F),
      Color(0xFF000000),
    ],
    stops: [0.1385, 1],
  );
}