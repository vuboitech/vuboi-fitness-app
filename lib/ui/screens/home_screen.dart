import 'package:fitness/ui/screens/exersice_page.dart';
import 'package:fitness/ui/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final navigationContainerState = GlobalKey<ScaffoldState>();

  late ScrollController _scrollController;
  bool _isStatusBarAnimationTriggered = false;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  double _scrollPercentage = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ).drive(Tween<double>(begin: 1.0, end: 0.7));

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark, //iOS
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      double height = getHeightOfWidget();
      print('Widget height: $height');
    });

    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      double threshold = 92;

      if (offset >= threshold && !_isStatusBarAnimationTriggered) {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFEFF0F6),
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light, //iOS
        ));

        _isStatusBarAnimationTriggered = true;
      } else if (offset < threshold && _isStatusBarAnimationTriggered) {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark, //iOS
        ));

        _isStatusBarAnimationTriggered = false;
      }

      // Navigation
      if (offset < threshold) {
        double newScrollPercentage = (_scrollController.position.pixels / _scrollController.position.maxScrollExtent).clamp(0.0, 1.0);

        if (newScrollPercentage != _scrollPercentage) {
          _scrollPercentage = newScrollPercentage;
          _animationController.animateTo(_scrollPercentage, duration: const Duration(milliseconds: 50 ));
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  double getHeightOfWidget() {
    final RenderBox renderBox = navigationContainerState.currentContext!.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }

  Widget _navigation() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0617, 0.9383],
          colors: [
            Color(0xFF5C03BC), // #5C03BC
            Color(0xFF0E0725), // #0E0725
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(
                          style: AppButtonStyle.secondary,
                          iconSvgUri: 'assets/icons/ic_people.svg',
                          text: "Discover",
                          fontSize: 14,
                          iconSize: 13,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          onPressed: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Button(
                            style: AppButtonStyle.active,
                            iconSvgUri: 'assets/icons/ic_dumbbell.svg',
                            text: "Exercise",
                            iconSize: 22,
                            fontSize: 16,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            onPressed: () {},
                          ),
                        ),
                        Button(
                          style: AppButtonStyle.secondary,
                          iconSvgUri: 'assets/icons/ic_pizza.svg',
                          text: "Nutrition",
                          fontSize: 14,
                          iconSize: 13,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _navigation(),
          SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 92),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 24,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF5C03BC),
                              Color(0xFF0E0725),
                            ],
                            stops: [0.096, 0.8736],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xFFEFF0F6),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: ExersicePage(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
