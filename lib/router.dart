import 'package:fitness/features/discover/presentation/pages/discover_page.dart';
import 'package:fitness/features/exercise/presentation/pages/exercise_dashboard_page.dart';
import 'package:fitness/features/exercise/presentation/pages/exercise_list_page_new.dart';
import 'package:fitness/features/exercise/presentation/pages/exersice_page.dart';
import 'package:fitness/features/exercise/presentation/pages/ongoing_exercise_page.dart';
import 'package:fitness/features/exercise/presentation/pages/schedule_page.dart';
import 'package:fitness/features/home/presentation/pages/home_screen.dart';
import 'package:fitness/features/home/presentation/pages/on_boarding_screen.dart';
import 'package:fitness/features/profile/presentation/pages/profile_page.dart';
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
              path: DiscoverPage.routeName,
              builder: (context, state) => const DiscoverPage(),
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
    GoRoute(
      path: ExerciseListPageNew.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const ExerciseListPageNew(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: OngoingExercisePage.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const OngoingExercisePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    ),
  ],
);