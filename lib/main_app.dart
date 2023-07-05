import 'package:fitness/ui/screens/on_boarding_screen.dart';
import 'package:fitness/ui/screens/watch/welcome_screen.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.compact,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "AlbertSans",
      ),
      home: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          debugPrint('Host device screen width: ${constraints.maxWidth}');

          // Watch-sized device
          if (constraints.maxWidth < 300) {
            return WelcomeScreen();
          }
          // Phone-sized device
          else {
            return const OnBoardingScreen();
          }
        },
      )
    );
  }
}
