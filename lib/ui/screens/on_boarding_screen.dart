import 'package:fitness/theme/colors.dart';
import 'package:fitness/ui/screens/home_screen.dart';
import 'package:fitness/ui/widgets/base/button.dart';
import 'package:fitness/ui/widgets/modules/app_bottom_sheet.dart';
import 'package:fitness/ui/widgets/modules/stacks/card_model.dart';
import 'package:fitness/ui/widgets/modules/stacks/card_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wear_os_connectivity/flutter_wear_os_connectivity.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> with TickerProviderStateMixin {
  late double stackCardHeight;
  late double stackCardWidth;

  late final AnimationController _arrowAnimationController;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFEFF0F6),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light, //iOS
    ));

    _arrowAnimationController = AnimationController(vsync: this);

    getWearOs();

    super.initState();
  }

  void getWearOs() async {
    FlutterWearOsConnectivity _flutterWearOsConnectivity = FlutterWearOsConnectivity();
    _flutterWearOsConnectivity.configureWearableAPI();

    List<WearOsDevice> _connectedDevices = await _flutterWearOsConnectivity.getConnectedDevices();
    _connectedDevices.length;

    await _flutterWearOsConnectivity.sendMessage(Uint8List(8),
      deviceId: _connectedDevices[0].id,
      path: "/sample-message",
      priority: MessagePriority.low
    );
  }

  @override
  void dispose() {
    _arrowAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    stackCardHeight = MediaQuery.of(context).size.height * 0.6;
    stackCardWidth = MediaQuery
        .of(context)
        .size
        .width - 32;

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
                    color: Colors.black
                  ),
                ),
                const Text(
                  'Discover Trifecta of Sustainable Fitness!',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.black
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
          Transform.translate(
            offset: Offset(0, 10),
            child: SizedBox(
              height: stackCardHeight,
              child: CardStackWidget(
                opacityChangeOnDrag: true,
                showIndicator: true,
                swipeOrientation: CardOrientation.both,
                cardDismissOrientation: CardOrientation.both,
                positionFactor: 2.8,
                scaleFactor: 2,
                alignment: Alignment.center,
                reverseOrder: true,
                dismissedCardDuration: const Duration(milliseconds: 150),
                animateCardScale: true,
                cardList: <CardModel>[
                  CardModel(
                    radius: const Radius.circular(12),
                    shadowColor: Colors.black.withOpacity(0.2),
                    cardTitle: "Power Progress",
                    child: SizedBox(
                      height: stackCardHeight,
                      width: stackCardWidth,
                      child: _onboardingItem(
                        imageAsset: 'assets/images/img_dumbbell.png',
                        title: "Power Progress",
                        description: "Say hello to workouts that work for you! Our versatile exercise feature lets you search for programs that fit your goals and lifestyle"
                      ),
                    ),
                  ),
                  CardModel(
                    radius: const Radius.circular(12),
                    shadowColor: Colors.black.withOpacity(0.2),
                    cardTitle: "Nourish Naturaly",
                    child: SizedBox(
                      height: stackCardHeight,
                      width: stackCardWidth,
                      child: _onboardingItem(
                        imageAsset: 'assets/images/img_yoghurt.png',
                        title: "Nourish Naturaly",
                        description: "Say hello to workouts that work for you! Our versatile exercise feature lets you search for programs that fit your goals and lifestyle"
                      ),
                    ),
                  ),
                  CardModel(
                    radius: const Radius.circular(12),
                    shadowColor: Colors.black.withOpacity(0.2),
                    cardTitle: "Strength in Unity",
                    child: SizedBox(
                      height: stackCardHeight,
                      width: stackCardWidth,
                      child: _onboardingItem(
                        imageAsset: 'assets/images/img_social.png',
                        title: "Strength in Unity",
                        description: "Connect, share, and learn from your friends workout routines and recipes. build a community that inspires and motivates you to keep going"
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Footer

          ClipPath(
            clipper: FooterShape(),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
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
                    const SizedBox(height: 8),

                    Text(
                      "1 / 2",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black
                      ),
                    ),

                    const SizedBox(height: 16),

                    Button(
                      style: AppButtonStyle.primary,
                      text: "Let's Get Started",
                      iconSvgUri: 'assets/icons/ic_lightning.svg',
                      onPressed: () => _showAuthBottomSheet(),
                    ),

                    const SizedBox(height: 16),

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

                    const SizedBox(height: 52),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAuthBottomSheet() {
    AppBottomSheet(
      context: context,
      title: 'Your Fitness Path Awaits',
      imageAssets: 'assets/images/img_lock.png',
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Log in to your Vuboi account to continue your fitness journey. Stay on track with your Progress',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400
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
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const HomeScreen()
              ));
            },
          ) /*: const SizedBox()*/,
        ],
      )
    ).show();
  }

  Widget _onboardingItem({
    required String imageAsset,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Color(0xFF000A23),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Image.asset(
            imageAsset,
            height: MediaQuery.of(context).size.height * 0.24,
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title.toUpperCase(),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 33,
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.white
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

class FooterShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addPolygon([
      Offset(0, size.height * 1 / 20),
      Offset(size.width / 2, 0),
      Offset(size.width, size.height * 1 / 20),
      Offset(size.width * 5 / 5, size.height),
      Offset(0, size.height),
    ], true);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}