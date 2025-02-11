import 'package:fitness/theme/variant.dart';
import 'package:fitness/ui/screens/on_boarding_screen.dart';
import 'package:fitness/ui/screens/watch/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'theme/theme_widgets/inherited_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      data: const AppThemeData(
        variant: AppThemeVariant.purple,
        themeMode: ThemeMode.system,
      ),
      builder: (context, themeData, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: themeData.theme,
          home: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              debugPrint('Host device screen width: ${constraints.maxWidth}');

              // Watch-sized device
              if (constraints.maxWidth < 300) {
                return const WelcomeScreen();
              }
              // Phone-sized device
              else {
                return const OnBoardingScreen();
              }
            },
          ),
        );
      },
    );
  }
}
