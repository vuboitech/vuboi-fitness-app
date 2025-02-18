import 'package:fitness/features/exercise/presentation/pages/exercise_dashboard_page.dart';
import 'package:fitness/features/exercise/presentation/pages/exersice_page.dart';
import 'package:fitness/features/exercise/presentation/pages/schedule_page.dart';
import 'package:fitness/features/profile/presentation/pages/profile_page.dart';
import 'package:fitness/features/home/presentation/pages/home_screen.dart';
import 'package:fitness/features/home/presentation/pages/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _discoverNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _exerciseNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _nutritionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: OnBoardingScreen.routeName,
  routes: [
    GoRoute(
      path: OnBoardingScreen.routeName,
      builder: (context, state) => const OnBoardingScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state, StatefulNavigationShell child) {
        return HomeScreen(navigationShell: child);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ProfilePage.routeName,
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _discoverNavigatorKey,
          routes: [
            GoRoute(
              path: '/discover',
              builder: (context, state) => const Placeholder(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            ShellRoute(
              navigatorKey: _exerciseNavigatorKey,
              builder: (BuildContext context, GoRouterState state, Widget child) {
                return ExercisePage(navigationShell: child);
              },
              routes: [
                GoRoute(
                  path: ExerciseDashboardPage.routeName,
                  builder: (context, state) => const ExerciseDashboardPage(),
                ),
                GoRoute(
                  path: SchedulePage.routeName,
                  builder: (context, state) => const SchedulePage(),
                ),
                GoRoute(
                  path: '/exercise/program',
                  builder: (context, state) => const Placeholder(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _nutritionNavigatorKey,
          routes: [
            GoRoute(
              path: '/nutrition',
              builder: (context, state) => const Placeholder(),
            ),
          ],
        ),
      ],
    ),
  ],
);