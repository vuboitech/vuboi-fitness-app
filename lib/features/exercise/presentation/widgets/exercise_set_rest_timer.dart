import 'dart:async';

import 'package:fitness/theme/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RestTimerColor {
  final Color background;
  final Color border;
  final LinearGradient progress;

  const RestTimerColor({
    required this.background,
    required this.border,
    required this.progress,
  });
}

class ExerciseSetRestTimer extends StatefulWidget {
  final VoidCallback onSkipPressed;
  final VoidCallback onTimerFinished;
  final Duration duration;

  const ExerciseSetRestTimer({
    super.key,
    required this.duration,
    required this.onSkipPressed,
    required this.onTimerFinished,
  });

  @override
  State<ExerciseSetRestTimer> createState() => _ExerciseSetRestTimerState();
}

class _ExerciseSetRestTimerState extends State<ExerciseSetRestTimer> {
  late Timer _timer;
  late Duration _remainingTime;

  final GlobalKey _contentKey = GlobalKey();
  double _measuredWidth = 0;
  double _measuredHeight = 0;

  @override
  void initState() {
    super.initState();

    _remainingTime = widget.duration;
    _startTimer();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox =
      _contentKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        setState(() {
          _measuredWidth = renderBox.size.width;
          _measuredHeight = renderBox.size.height;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const tickTime = Duration(seconds: 1);
    _timer = Timer.periodic(tickTime, (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime = _remainingTime - tickTime;
        } else {
          _timer.cancel();
          widget.onTimerFinished.call();
        }
      });
    });
  }

  void _increaseDuration() {
    setState(() {
      _remainingTime += const Duration(minutes: 0, seconds: 30);
    });
  }

  String _formatDuration(Duration duration) {
    String minutes = (duration.inMinutes).toString();
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes min $seconds sec';
  }

  double _getProgressPercentage() {
    return _remainingTime.inMilliseconds / widget.duration.inMilliseconds;
  }

  RestTimerColor _getColorByProgress() {
    double progress = _getProgressPercentage();

    if (progress <= 0.33) {
      // Red (0-33%)
      return RestTimerColor(
        background: context.theme.appColor.utilityError50,
        border: context.theme.appColor.utilityError400,
        progress: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            context.theme.appColor.utilityError50,
            context.theme.appColor.utilityError200,
          ],
          stops: [0.0, 1.0],
        ),
      );
    } else if (progress <= 0.66) {
      // Yellow (34-66%)
      return RestTimerColor(
        background: context.theme.appColor.utilityWarning50,
        border: context.theme.appColor.utilityWarning400,
        progress: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            context.theme.appColor.utilityWarning50,
            context.theme.appColor.utilityWarning200,
          ],
          stops: [0.0, 1.0],
        ),
      );
    } else {
      // Green (67-100%)
      return RestTimerColor(
        background: context.theme.appColor.utilitySuccess50,
        border: context.theme.appColor.utilitySuccess400,
        progress: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            context.theme.appColor.utilitySuccess50,
            context.theme.appColor.utilitySuccess200,
          ],
          stops: [0.0, 1.0],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final RestTimerColor color = _getColorByProgress();

    return Stack(
      children: [
        Stack(
          children: [
            Container(
              height: _measuredHeight,
              width: _measuredWidth,
              color: color.background,
            ),
            if (_measuredWidth > 0)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: _measuredHeight,
                width: _measuredWidth * _getProgressPercentage(),
                decoration: BoxDecoration(
                  gradient: color.progress,
                  border: Border(
                    right: BorderSide(
                      color: color.border,
                      width: 1,
                    ),
                  ),
                ),
              ),
          ],
        ),
        Container(
          key: _contentKey,
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(_remainingTime),
                style: context.theme.appTextTheme.textSmSemibold.copyWith(
                  color: context.theme.appColor.textSecondary,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: _increaseDuration,
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      minimumSize: const Size(0, 0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '0.5 min',
                          style: context.theme.appTextTheme.textSmSemibold
                              .copyWith(
                            color: context.theme.appColor.textSecondary,
                          ),
                        ),
                        const SizedBox(width: 2),
                        SvgPicture.asset(
                          'assets/icons/ic_plus.svg',
                          colorFilter: ColorFilter.mode(
                            context.theme.appColor.textSecondary,
                            BlendMode.srcIn,
                          ),
                          height: 18,
                          width: 18,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  PrimaryButton(
                    variant: ButtonVariant.secondary,
                    text: 'Skip',
                    onPressed: () {
                      // Handle start button press
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}