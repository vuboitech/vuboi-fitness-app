import 'package:card_stack_widget/model/card_model.dart';
import 'package:card_stack_widget/model/card_orientation.dart';
import 'package:card_stack_widget/widget/card_stack_widget.dart';
import 'package:fitness/ui/screens/home_screen.dart';
import 'package:fitness/ui/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFEFF0F6),
      statusBarIconBrightness: Brightness.dark,
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F6),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 48),

              Text(
                'Welcome to Vuboi',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 32,
                  color: Colors.black
                ),
              ),
              Text(
                'Discover Trifecta of Sustainable Fitness!',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.black
                ),
              ),

              Transform.rotate(
                angle: 45 * (3.1415926535897932 / 180),
                child: Lottie.asset(
                  'assets/lottie/arrow-right.json',
                  width: 118,
                  height: 118,
                  fit: BoxFit.fill,
                ),
              ),

              SizedBox(
                height: 262,
                child: CardStackWidget(
                  opacityChangeOnDrag: true,
                  swipeOrientation: CardOrientation.up,
                  positionFactor: 2,
                  scaleFactor: 1.5,
                  alignment: Alignment.center,
                  dismissedCardDuration: const Duration(milliseconds: 150),
                  animateCardScale: true,
                  cardList: _buildMockList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -9),
              blurRadius: 11,
              color: Color.fromRGBO(0, 0, 0, 0.1),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                "Dive into your personalized fitness journey with Vuboi. Let's start making progress today!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black
                ),
              ),
            ),

            const SizedBox(height: 16),

            Button(
              text: "Let's Get Started",
              iconSvgUri: 'assets/icons/ic_lightning.svg',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HomeScreen()
                ));
              },
            )
          ],
        ),
      ),
    );
  }

  List<CardModel> _buildMockList() {
    final double containerWidth = MediaQuery
        .of(context)
        .size
        .width - 16;

    var list = <CardModel>[
      CardModel(
        radius: Radius.circular(8),
        shadowColor: Colors.black.withOpacity(0.2),
        child: SizedBox(
          height: 310,
          width: containerWidth,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Color(0xFFD9DBE9)
            ),
          ), // Whatever you want
        ),
      ),
      CardModel(
        radius: Radius.circular(8),
        shadowColor: Colors.black.withOpacity(0.2),
        child: SizedBox(
          height: 310,
          width: containerWidth,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Color(0xFFA0A3BD)
            ),
          ), // Whatever you want
        ),
      ),
      CardModel(
        radius: Radius.circular(8),
        shadowColor: Colors.black.withOpacity(0.2),
        child: SizedBox(
          height: 310,
          width: containerWidth,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF6503CE),
                  Color(0xFF00B5DA),
                ],
                stops: [0.1385, 1],
                transform: GradientRotation(105.89 * 3.14159 / 180),
              ),
            ),
          ), // Whatever you want
        ),
      ),
    ];

    return list;
  }
}
