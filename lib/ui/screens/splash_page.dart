import 'package:fitness/ui/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((_) => {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => OnBoardingScreen()
      ))
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo_with_text.svg',
              semanticsLabel: 'Vuboi Logo',
            )
          ],
        ),
      ),
    );
  }
}
