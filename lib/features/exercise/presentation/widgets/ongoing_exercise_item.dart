import 'dart:async';

import 'package:fitness/theme/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseRepetition {
  int repetition;
  final TextEditingController repetitionController;
  double weight;
  DateTime? finishedAt;

  ExerciseRepetition({
    required this.repetition,
    required this.repetitionController,
    required this.weight,
    this.finishedAt,
  });
}

class OngoingExerciseItem extends StatefulWidget {
  final bool isExpanded;
  final Function(bool) onExpansionChanged;
  final VoidCallback? onLongPress;

  const OngoingExerciseItem({
    super.key,
    required this.isExpanded,
    required this.onExpansionChanged,
    this.onLongPress,
  });

  @override
  State<OngoingExerciseItem> createState() => _OngoingExerciseItemState();
}

class _OngoingExerciseItemState extends State<OngoingExerciseItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<ExerciseRepetition> _exerciseRepetitions = [
    ExerciseRepetition(
      repetition: 10,
      repetitionController: TextEditingController(),
      weight: 20,
    ),
    ExerciseRepetition(
      repetition: 12,
      repetitionController: TextEditingController(),
      weight: 25,
    ),
    ExerciseRepetition(
      repetition: 8,
      repetitionController: TextEditingController(),
      weight: 30,
    ),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    if (widget.isExpanded) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    for (var exerciseSet in _exerciseRepetitions) {
      exerciseSet.repetitionController.dispose();
    }

    super.dispose();
  }

  @override
  void didUpdateWidget(covariant OngoingExerciseItem oldWidget) {
    if (oldWidget.isExpanded != widget.isExpanded) {
      if (widget.isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => widget.onExpansionChanged(!widget.isExpanded),
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lat Pulldown•Cable',
                            style: context.theme.appTextTheme.textSmMedium,
                          ),
                          SizedBox(
                            height: 20,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, item) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 6,
                                        width: 6,
                                        margin: const EdgeInsets.only(right: 5),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green,
                                        ),
                                      ),
                                      const Text('Hewo'),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.isExpanded ? Icons.expand_less : Icons.expand_more,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          GestureDetector(
            onLongPress: () {
              widget.onLongPress?.call();
            },
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return ClipRect(
                  child: Align(
                    heightFactor: _animation.value,
                    alignment: Alignment.topCenter,
                    child: child,
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: context.theme.appColor.bgTertiary,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Set',
                            style: context.theme.appTextTheme.textXsMedium
                                .copyWith(
                              color: context.theme.appColor.textSecondary,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Repetition',
                            style: context.theme.appTextTheme.textXsMedium
                                .copyWith(
                              color: context.theme.appColor.textSecondary,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Weight',
                            style: context.theme.appTextTheme.textXsMedium
                                .copyWith(
                              color: context.theme.appColor.textSecondary,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            '',
                            style: context.theme.appTextTheme.textXsMedium
                                .copyWith(
                              color: context.theme.appColor.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _exerciseRepetitions.length,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        key: Key('container-$index'),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: context.theme.appColor.background,
                          border: Border(
                            bottom: BorderSide(
                              color: context.theme.appColor.borderSecondary,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                (index + 1).toString(),
                                style: context.theme.appTextTheme.textXsMedium
                                    .copyWith(
                                  color: context.theme.appColor.textSecondary,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: _exerciseRepetitions[index]
                                    .repetitionController,
                                onChanged: (value) {
                                  // also update
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  filled: false,
                                  contentPadding: EdgeInsets.zero,
                                  isDense: true,
                                  hintStyle: context
                                      .theme.appTextTheme.textXlBold
                                      .copyWith(
                                    color: context.theme.appColor.textTertiary
                                        .withOpacity(0.3),
                                  ),
                                  hintText: _exerciseRepetitions[index]
                                      .repetition
                                      .toString(),
                                ),
                                textAlign: TextAlign.left,
                                style: context.theme.appTextTheme.textXlBold
                                    .copyWith(
                                  color: context.theme.appColor.textTertiary,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Weight',
                                style: context.theme.appTextTheme.textXsMedium
                                    .copyWith(
                                  color: context.theme.appColor.textSecondary,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Checkbox(
                                  value:
                                      _exerciseRepetitions[index].finishedAt !=
                                          null,
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  side: BorderSide(
                                    color: context.theme.appColor.textSecondary,
                                    width: 1,
                                  ),
                                  onChanged: (bool? isChecked) {
                                    setState(() {
                                      _exerciseRepetitions[index].finishedAt =
                                          isChecked == true
                                              ? DateTime.now()
                                              : null;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  ExerciseSetRestTimer(
                    duration: const Duration(seconds: 10),
                    onSkipPressed: () {},
                    onTimerFinished: () {},
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: context.theme.appColor.bgTertiary,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: PrimaryButton(
                            text: 'Add Set',
                            variant: ButtonVariant.secondary,
                            onPressed: () {
                              setState(() {
                                _exerciseRepetitions.add(
                                  ExerciseRepetition(
                                    repetition: 0,
                                    repetitionController:
                                        TextEditingController(),
                                    weight: 0,
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 1,
                          child: PrimaryButton(
                            iconSvgUri: 'assets/icons/ic_book.svg',
                            variant: ButtonVariant.secondary,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
