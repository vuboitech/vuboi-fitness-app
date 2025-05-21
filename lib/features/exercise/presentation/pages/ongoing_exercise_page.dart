import 'dart:async';

import 'package:fitness/core/theme_cubit/theme_cubit.dart';
import 'package:fitness/core/utils/format_duration.dart';
import 'package:fitness/features/exercise/presentation/bloc/ongoing_exercise/ongoing_exercise_cubit.dart';
import 'package:fitness/features/exercise/presentation/widgets/ongoing_exercise_items.dart';
import 'package:fitness/injection_container.dart';
import 'package:fitness/theme/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OngoingExercisePage extends StatefulWidget {
  static const String routeName = '/exercise/ongoing';

  const OngoingExercisePage({
    super.key,
  });

  @override
  State<OngoingExercisePage> createState() => _OngoingExercisePageState();
}

class _OngoingExercisePageState extends State<OngoingExercisePage> {
  final OngoingExerciseCubit _cubit = sl<OngoingExerciseCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: AppColors.purpleBlack,
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 24,
                          bottom: 24,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _cubit.ongoingExercise != null
                                      ? _cubit.ongoingExercise!.title
                                      : '-',
                                  style: context.theme.appTextTheme.textXlBold
                                      .copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/ic_clock.svg',
                                      width: 14,
                                      height: 14,
                                      color: const Color(0xFFFFFFCC),
                                    ),
                                    const SizedBox(width: 4),
                                    _cubit.ongoingExercise != null
                                        ? StopwatchText(
                                            startedAt: _cubit
                                                .ongoingExercise!.startedAt,
                                          )
                                        : Text(
                                            '-',
                                            style: context
                                                .theme.appTextTheme.textSmMedium
                                                .copyWith(
                                              color: const Color(0xFFFFFFCC),
                                            ),
                                          ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Opacity(
                                  opacity: 0.8,
                                  child: PrimaryButton(
                                    variant: ButtonVariant.secondary,
                                    text: 'End',
                                    onPressed: () {
                                      // Handle start button press
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Opacity(
                                  opacity: 0.8,
                                  child: PrimaryButton(
                                    variant: ButtonVariant.secondary,
                                    iconSvgUri: 'assets/icons/ic_settings.svg',
                                    onPressed: () {
                                      context.read<ThemeCubit>().toggleTheme();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: context.theme.appColor.background,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                              child: Text(
                                '${_cubit.ongoingExercise?.exercises.length ?? 0} Exercise',
                                style: context.theme.appTextTheme.textSmSemibold.copyWith(
                                  color: context.theme.appColor.textSecondary,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 4, top: 8),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                                  minimumSize: Size.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Add',
                                  style: context.theme.appTextTheme.textSmMedium.copyWith(
                                    color: context.theme.appColor.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: OngoingExerciseItems(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class StopwatchText extends StatefulWidget {
  final DateTime? startedAt;

  const StopwatchText({
    super.key,
    required this.startedAt,
  });

  @override
  State<StopwatchText> createState() => _StopwatchTextState();
}

class _StopwatchTextState extends State<StopwatchText> {
  Timer? _timer;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();

    _updateElapsedTime();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateElapsedTime();
    });
  }

  void _updateElapsedTime() {
    final startTime = widget.startedAt ?? DateTime.now();

    setState(() {
      _elapsed = DateTime.now().difference(startTime);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatDuration(_elapsed),
      style: context.theme.appTextTheme.textSmMedium.copyWith(
        color: const Color(0xFFFFFFCC),
      ),
    );
  }
}
