import 'package:fitness/ui/screens/home_screen.dart';
import 'package:fitness/ui/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.hindTextTheme(Theme.of(context).textTheme),
      ),
      home: const OnBoardingScreen(),
    );
  }
}
