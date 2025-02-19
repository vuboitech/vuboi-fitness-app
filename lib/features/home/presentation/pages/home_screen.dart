import 'package:fitness/features/exercise/presentation/pages/exercise_dashboard_page.dart';
import 'package:fitness/features/home/presentation/widgets/base/button.dart';
import 'package:fitness/features/home/presentation/widgets/modules/main_navigation_button.dart';
import 'package:fitness/features/profile/presentation/pages/profile_page.dart';
import 'package:fitness/theme/themes/commons/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const HomeScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print('hello');
    }
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark, //iOS
      ),
    );

    super.initState();
  }

  Widget _navigation() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.16,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 12),
                  Button.icon(
                    style: GoRouter.of(context)
                                .routerDelegate
                                .currentConfiguration
                                .uri
                                .toString() ==
                            ProfilePage.routeName
                        ? AppButtonStyle.active
                        : AppButtonStyle.secondary,
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    padding: GoRouter.of(context)
                        .routerDelegate
                        .currentConfiguration
                        .uri
                        .toString() ==
                        ProfilePage.routeName
                        ? const EdgeInsets.all(6)
                        : const EdgeInsets.all(10),
                    onPressed: () => widget.navigationShell.goBranch(0),
                  ),
                  const SizedBox(width: 8),
                  MainNavigationButton(
                    onPressed: () => widget.navigationShell.goBranch(1),
                    svg: 'assets/icons/ic_people.svg',
                    text: 'Discover',
                    isActive: GoRouter.of(context)
                            .routerDelegate
                            .currentConfiguration
                            .uri
                            .toString() ==
                        '/discover',
                  ),
                  const SizedBox(width: 8),
                  MainNavigationButton(
                    onPressed: () => widget.navigationShell.goBranch(2),
                    svg: 'assets/icons/ic_dumbbell.svg',
                    text: 'Exercise',
                    isActive: GoRouter.of(context)
                            .routerDelegate
                            .currentConfiguration
                            .uri
                            .toString() ==
                        ExerciseDashboardPage.routeName,
                  ),
                  const SizedBox(width: 8),
                  MainNavigationButton(
                    onPressed: () => widget.navigationShell.goBranch(3),
                    svg: 'assets/icons/ic_pizza.svg',
                    text: 'Nutrition',
                    isActive: GoRouter.of(context)
                            .routerDelegate
                            .currentConfiguration
                            .uri
                            .toString() ==
                        '/nutrition',
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
            Container(
              height: 12,
              decoration: BoxDecoration(
                color: context.theme.appColor.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _navigation(),
          Expanded(
            child: widget.navigationShell,
          ),
        ],
      ),
    );
  }
}
