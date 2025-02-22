import 'dart:ui';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:fitness/features/exercise/presentation/pages/exercise_dashboard_page.dart';
import 'package:fitness/features/exercise/presentation/pages/ongoing_exercise_page.dart';
import 'package:fitness/features/exercise/presentation/pages/schedule_page.dart';
import 'package:fitness/theme/themes/commons/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExercisePage extends StatefulWidget {
  final Widget navigationShell;

  const ExercisePage({
    super.key,
    required this.navigationShell,
  });

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(OngoingExercisePage.routeName);
        },
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Container(
          height: 54,
          width: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/img_social.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: 4,
        gapLocation: GapLocation.center,
        imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        tabBuilder: (index, isActive) {
          final icons = [
            Icons.dashboard,
            Icons.calendar_month,
            Icons.area_chart,
            Icons.badge,
          ];

          final labels = [
            'Dashboard',
            'Schedule',
            'Report',
            'Badge',
          ];

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons[index],
                size: 24,
                color: isActive
                    ? context.theme.colorScheme.primary
                    : context.theme.colorScheme.onSurface,
              ),
              const SizedBox(height: 4),
              Text(
                labels[index],
                style: context.theme.appTextTheme.body14Medium.copyWith(
                  color: isActive
                      ? context.theme.colorScheme.primary
                      : context.theme.colorScheme.onSurface,
                ),
                maxLines: 1,
              ),
            ],
          );
        },
        backgroundColor: context.theme.colorScheme.surface,
        activeIndex: 0,
        splashSpeedInMilliseconds: 300,
        height: 64,
        splashColor: Colors.transparent,
        splashRadius: 0,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) {
          switch (index) {
            case 0:
              context.push(ExerciseDashboardPage.routeName);
              break;
            case 1:
              context.push(SchedulePage.routeName);
              break;
            case 2:
              context.go('/exercise/report');
              break;
            case 3:
              context.go('/exercise/badge');
              break;
            default:
              context.go('/exercise/dashboard');
              break;
          }
        },
      ),
      body: widget.navigationShell,
    );
  }
}
