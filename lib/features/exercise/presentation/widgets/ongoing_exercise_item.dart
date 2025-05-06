import 'package:fitness/features/exercise/presentation/widgets/exercise_set_rest_timer.dart';
import 'package:fitness/theme/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'exercise_item_option_dropdown.dart';

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
        elevation: 0,
        backgroundColor: context.theme.appColor.bgPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          side: BorderSide(
            color: context.theme.appColor.borderSecondary,
            width: 0.5,
          ),
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
                  ReorderableListView.builder(
                    shrinkWrap: true,
                    itemCount: _exerciseRepetitions.length,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    proxyDecorator:
                        (Widget child, int index, Animation<double> animation) {
                      return Material(
                        elevation: 0.0,
                        color: Colors.transparent,
                        child: child,
                      );
                    },
                    onReorder: (int oldIndex, int newIndex) {
                      setState(() {
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        final ExerciseRepetition item =
                            _exerciseRepetitions.removeAt(oldIndex);
                        _exerciseRepetitions.insert(newIndex, item);
                      });
                    },
                    itemBuilder: (context, index) {
                      return Slidable(
                        key: Key('slidable-$index'),
                        closeOnScroll: true,
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          openThreshold: 1 / 4,
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                setState(() {
                                  _exerciseRepetitions.removeAt(index);
                                });
                              },
                              autoClose: true,
                              backgroundColor:
                                  context.theme.appColor.utilityError500,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                        child: Container(
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
                                    value: _exerciseRepetitions[index]
                                            .finishedAt !=
                                        null,
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    side: BorderSide(
                                      color:
                                          context.theme.appColor.textSecondary,
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
                        ),
                      );
                    },
                  ),
                  ExerciseSetRestTimer(
                    duration: const Duration(seconds: 90),
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
                          child: ExerciseItemOptionDropdown(
                            onSelected: (value) {},
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
