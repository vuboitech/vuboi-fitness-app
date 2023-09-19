import 'package:flutter/material.dart';

ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  return ThemeData(
    visualDensity: VisualDensity.compact,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    fontFamily: "AlbertSans",
    scaffoldBackgroundColor: isDarkTheme ? Colors.black38 : const Color(0xFFEFF0F6),
    textTheme: Theme.of(context).textTheme.copyWith(
      titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12),
    ).apply(
      bodyColor: isDarkTheme ? Colors.white : Colors.black,
      displayColor: Colors.grey,
    ),
    extensions: <ThemeExtension<AppColors>>[
      AppColors(
        neutral10: isDarkTheme ? const Color(0xFF14142AFF) : const Color(0xFFf7f7fcff),
        neutral20: isDarkTheme ? const Color(0xff262338ff) : const Color(0xFFeff0f6ff),
        neutral30: isDarkTheme ? const Color(0xff4e4b66ff) : const Color(0xFFd9dbe9ff),
      ),
    ],
  );
}

AppColors appColors(context) => Theme.of(context).extension<AppColors>()!;

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color? neutral10;
  final Color? neutral20;
  final Color? neutral30;
  final Color? neutral40;
  final Color? neutral50;
  final Color? neutral60;
  final Color? neutral70;
  final Color? neutral80;
  final Color? neutral90;
  final Color? neutral00;

  final Color? purple10;
  final Color? purple20;
  final Color? purple30;
  final Color? purple40;
  final Color? purple50;
  final Color? purple60;
  final Color? purple70;
  final Color? purple80;

  final Color? green10;
  final Color? green20;
  final Color? green30;
  final Color? green40;
  final Color? green50;
  final Color? green60;
  final Color? green70;
  final Color? green80;

  final Color? scarlett10;
  final Color? scarlett20;
  final Color? scarlett30;
  final Color? scarlett40;
  final Color? scarlett50;
  final Color? scarlett60;
  final Color? scarlett70;
  final Color? scarlett80;

  final Color? rose10;
  final Color? rose20;
  final Color? rose30;
  final Color? rose40;
  final Color? rose50;
  final Color? rose60;
  final Color? rose70;
  final Color? rose80;

  const AppColors({
    this.neutral10,
    this.neutral20,
    this.neutral30,
    this.neutral40,
    this.neutral50,
    this.neutral60,
    this.neutral70,
    this.neutral80,
    this.neutral90,
    this.neutral00,
    this.purple10,
    this.purple20,
    this.purple30,
    this.purple40,
    this.purple50,
    this.purple60,
    this.purple70,
    this.purple80,
    this.green10,
    this.green20,
    this.green30,
    this.green40,
    this.green50,
    this.green60,
    this.green70,
    this.green80,
    this.scarlett10,
    this.scarlett20,
    this.scarlett30,
    this.scarlett40,
    this.scarlett50,
    this.scarlett60,
    this.scarlett70,
    this.scarlett80,
    this.rose10,
    this.rose20,
    this.rose30,
    this.rose40,
    this.rose50,
    this.rose60,
    this.rose70,
    this.rose80
  });

  @override
  AppColors copyWith({
    Color? neutral10,
    Color? neutral20,
    Color? neutral30,
    Color? neutral40,
    Color? neutral50,
    Color? neutral60,
    Color? neutral70,
    Color? neutral80,
    Color? neutral90,
    Color? neutral00,
    Color? purple10,
    Color? purple20,
    Color? purple30,
    Color? purple40,
    Color? purple50,
    Color? purple60,
    Color? purple70,
    Color? purple80,
    Color? green10,
    Color? green20,
    Color? green30,
    Color? green40,
    Color? green50,
    Color? green60,
    Color? green70,
    Color? green80,
    Color? scarlett10,
    Color? scarlett20,
    Color? scarlett30,
    Color? scarlett40,
    Color? scarlett50,
    Color? scarlett60,
    Color? scarlett70,
    Color? scarlett80,
    Color? rose10,
    Color? rose20,
    Color? rose30,
    Color? rose40,
    Color? rose50,
    Color? rose60,
    Color? rose70,
    Color? rose80
  }) {
    return AppColors(
      neutral10: neutral10 ?? this.neutral10,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      neutral10: Color.lerp(neutral10, other.neutral10, t),
      neutral20: Color.lerp(neutral20, other.neutral20, t),
    );
  }
}