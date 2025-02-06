import 'package:fitness/theme/colors.dart';
import 'package:fitness/ui/screens/home_screen.dart';
import 'package:fitness/ui/widgets/base/button.dart';
import 'package:fitness/ui/widgets/modules/app_bottom_sheet.dart';
import 'package:fitness/ui/widgets/modules/stacks/card_model.dart';
import 'package:fitness/ui/widgets/modules/stacks/card_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wear_os_connectivity/flutter_wear_os_connectivity.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  late double stackCardHeight;
  late double stackCardWidth;

  late final AnimationController _arrowAnimationController;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFEFF0F6),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light, //iOS
      ),
    );

    _arrowAnimationController = AnimationController(vsync: this);

    getWearOs();

    super.initState();
  }

  void getWearOs() async {
    FlutterWearOsConnectivity flutterWearOsConnectivity =
        FlutterWearOsConnectivity();
    flutterWearOsConnectivity.configureWearableAPI();

    List<WearOsDevice> connectedDevices =
        await flutterWearOsConnectivity.getConnectedDevices();
    connectedDevices.length;

    await flutterWearOsConnectivity.sendMessage(
      Uint8List(8),
      deviceId: connectedDevices[0].id,
      path: '/sample-message',
      priority: MessagePriority.low,
    );
  }

  @override
  void dispose() {
    _arrowAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    stackCardHeight = MediaQuery.of(context).size.height * 0.57;
    stackCardWidth = MediaQuery.of(context).size.width - 32;

    return Scaffold(
      backgroundColor: const Color(0xFFEFF0F6),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                const Text(
                  'Welcome to Vuboi',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'Discover Trifecta of Sustainable Fitness!',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -10, 0.0),
                  child: Transform.rotate(
                    angle: 45 * (3.1415926535897932 / 180),
                    child: Lottie.asset(
                      'assets/lottie/arrow-right.json',
                      width: 118,
                      height: 118,
                      fit: BoxFit.fill,
                      controller: _arrowAnimationController,
                      onLoaded: (composition) {
                        _arrowAnimationController.duration =
                            composition.duration;
                        _playDelayedArrowAnimation();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: stackCardHeight,
            child: CardStackWidget(
              opacityChangeOnDrag: true,
              showIndicator: true,
              swipeOrientation: CardOrientation.both,
              cardDismissOrientation: CardOrientation.both,
              positionFactor: 2.4,
              scaleFactor: 1,
              alignment: Alignment.center,
              reverseOrder: true,
              dismissedCardDuration: const Duration(milliseconds: 150),
              animateCardScale: true,
              cardList: <CardModel>[
                CardModel(
                  radius: const Radius.circular(12),
                  shadowColor: Colors.black.withOpacity(0.2),
                  cardTitle: 'Power Progress',
                  child: SizedBox(
                    height: stackCardHeight,
                    width: stackCardWidth,
                    child: _onboardingItem(
                      imageAsset: 'assets/images/img_dumbbell.png',
                      gradient: AppColors.purpleBlack,
                      title: 'Power Progress',
                      description:
                          'Say hello to workouts that work for you! Our versatile exercise feature lets you search for programs that fit your goals and lifestyle',
                    ),
                  ),
                ),
                CardModel(
                  radius: const Radius.circular(12),
                  shadowColor: Colors.black.withOpacity(0.2),
                  cardTitle: 'Nourish Naturaly',
                  child: SizedBox(
                    height: stackCardHeight,
                    width: stackCardWidth,
                    child: _onboardingItem(
                      imageAsset: 'assets/images/img_yoghurt.png',
                      gradient: AppColors.cyanBlack,
                      title: 'Nourish Naturaly',
                      description:
                          'Say hello to workouts that work for you! Our versatile exercise feature lets you search for programs that fit your goals and lifestyle',
                    ),
                  ),
                ),
                CardModel(
                  radius: const Radius.circular(12),
                  shadowColor: Colors.black.withOpacity(0.2),
                  cardTitle: 'Strength in Unity',
                  child: SizedBox(
                    height: stackCardHeight,
                    width: stackCardWidth,
                    child: _onboardingItem(
                      imageAsset: 'assets/images/img_social.png',
                      gradient: AppColors.redBlack,
                      title: 'Strength in Unity',
                      description:
                          'Connect, share, and learn from your friends workout routines and recipes. build a community that inspires and motivates you to keep going',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -9),
                  blurRadius: 11,
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                ),
              ],
            ),
            child: SafeArea(
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
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Button(
                    style: AppButtonStyle.primary,
                    text: "Let's Get Started",
                    iconSvgUri: 'assets/icons/ic_lightning.svg',
                    onPressed: () => _showAuthBottomSheet(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _playDelayedArrowAnimation() {
    _arrowAnimationController.forward(from: 0);
    Future.delayed(const Duration(milliseconds: 560), () {
      _arrowAnimationController.stop();

      _replayDelayedArrowAninmation();
    });
  }

  void _replayDelayedArrowAninmation() {
    Future.delayed(const Duration(seconds: 2), () {
      _arrowAnimationController.forward();

      Future.delayed(const Duration(seconds: 2), () {
        _playDelayedArrowAnimation();
      });
    });
  }

  void _showAuthBottomSheet() {
    AppBottomSheet(
      context: context,
      title: 'Your Fitness Path Awaits',
      imageAssets: 'assets/images/image_lock.png',
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Log in to your Vuboi account to continue your fitness journey. Stay on track with your Progress',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 16),
          Button(
            style: AppButtonStyle.tertiary,
            iconSvgUri: 'assets/icons/ic_google.svg',
            text: 'Continue with Google',
            onPressed: () async {
              // Trigger the authentication flow
              // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

              // Obtain the auth details from the request
              // final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

              // Create a new credential
              /*final credential = GoogleAuthProvider.credential(
                accessToken: googleAuth?.accessToken,
                idToken: googleAuth?.idToken,
              );*/

              // UserCredential result = await FirebaseAuth.instance.signInWithCredential(credential);
            },
          ),
          const SizedBox(height: 16),
          Button(
            style: AppButtonStyle.tertiary,
            iconSvgUri: 'assets/icons/ic_facebook.svg',
            text: 'Continue with Facebook',
            onPressed: () async {
              // Trigger the sign-in flow
              /*final LoginResult loginResult = await FacebookAuth.instance.login();
              switch (loginResult.status) {
                case LoginStatus.success:
                  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
                  UserCredential result = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
                case LoginStatus.cancelled:

                case LoginStatus.failed:

                default:

              }*/
            },
          ),
          const SizedBox(height: 16),
          /*Platform.isIOS ?*/ Button(
            style: AppButtonStyle.tertiary,
            iconSvgUri: 'assets/icons/ic_apple.svg',
            text: 'Continue with Apple',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ) /*: const SizedBox()*/,
        ],
      ),
    ).show();
  }

  Widget _onboardingItem({
    required String imageAsset,
    required String title,
    required String description,
    required LinearGradient gradient,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        gradient: gradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Image.asset(
            imageAsset,
            height: MediaQuery.of(context).size.height * 0.24,
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.7,
      size.width * 0.5,
      size.height * 0.8,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.9,
      size.width * 1.0,
      size.height * 0.8,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawShadow(path, Colors.red.withAlpha(90), 4.0, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
