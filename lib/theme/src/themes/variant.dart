import 'package:flutter/material.dart';

import 'pink.dart';
import 'purple.dart';

enum AppThemeVariant {
  purple(Color(0xFF5C03BC)),
  pink(Color(0xFFB30550)),
  ;

  const AppThemeVariant(this.color);

  final Color color;

  ThemeData get theme => _appLightThemes[this]!;

  ThemeData get darkTheme => _appDarkThemes[this]!;
}

final _appLightThemes = <AppThemeVariant, ThemeData>{
  AppThemeVariant.purple: purpleLight,
  AppThemeVariant.pink: pinkLight,
};

final _appDarkThemes = <AppThemeVariant, ThemeData>{
  AppThemeVariant.purple: purpleDark,
  AppThemeVariant.pink: pinkDark,
};
