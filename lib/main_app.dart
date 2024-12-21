import 'package:fitness/theme/theme.dart';
import 'package:fitness/ui/screens/on_boarding_screen.dart';
import 'package:fitness/ui/screens/splash_page.dart';
import 'package:fitness/ui/screens/watch/welcome_screen.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vuboi Fitness',
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(context, false),
      home: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Watch-sized device
          if (constraints.maxWidth < 300) {
            return WelcomeScreen();
          }
          // Phone-sized device
          else {
            return const SplashPage();
          }
        },
      )
    );
  }
}
