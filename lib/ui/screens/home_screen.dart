import 'package:fitness/ui/screens/exersice_page.dart';
import 'package:fitness/ui/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final navigationContainerState = GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();
  bool _isStatusBarAnimationTriggered = false;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      double height = getHeightOfWidget();
      print('Widget height: $height');
    });

    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      double threshold = 100;

      if (offset >= threshold && !_isStatusBarAnimationTriggered) {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFEFF0F6),
          statusBarIconBrightness: Brightness.dark,
        ));

        _isStatusBarAnimationTriggered = true;
      } else if (offset < threshold && _isStatusBarAnimationTriggered) {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ));

        _isStatusBarAnimationTriggered = false;
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
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF5C03BC),
            Color(0xFF0E0725),
          ],
          stops: [0.096, 0.8736],
        ),
      ),
      child: SafeArea(
        child: Container(
          key: navigationContainerState,
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Button(
                iconSvgUri: 'assets/icons/ic_people.svg',
                text: "Discover",
                iconSize: 22,
                onPressed: () {},
              ),
              Button(
                iconSvgUri: 'assets/icons/ic_dumbbell.svg',
                text: "Exercise",
                iconColor: Colors.white,
                iconSize: 22,
                onPressed: () {},
              ),
              Button(
                iconSvgUri: 'assets/icons/ic_pizza.svg',
                text: "Nutrition",
                iconSize: 22,
                onPressed: () {},
              )
            ],
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
              padding: EdgeInsets.only(top: 104),
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
