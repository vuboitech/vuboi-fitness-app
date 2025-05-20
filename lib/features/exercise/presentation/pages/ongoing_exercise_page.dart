import 'package:fitness/core/theme_cubit/theme_cubit.dart';
import 'package:fitness/features/exercise/domain/models/exercise_item.dart';
import 'package:fitness/features/exercise/domain/models/ongoing_exercise.dart';
import 'package:fitness/features/exercise/presentation/bloc/ongoing_exercise/ongoing_exercise_cubit.dart';
import 'package:fitness/features/exercise/presentation/widgets/ongoing_exercise_item.dart';
import 'package:fitness/injection_container.dart';
import 'package:fitness/theme/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class OngoingExercisePage extends StatefulWidget {
  static const String routeName = '/exercise/ongoing';

  const OngoingExercisePage({
    super.key,
  });

  @override
  State<OngoingExercisePage> createState() => _OngoingExercisePageState();
}

class _OngoingExercisePageState extends State<OngoingExercisePage> {

  @override
  Widget build(BuildContext context) {
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
                              '👑 Chest Pride',
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
                                Text(
                                  '12 min 20 sec',
                                  style: context.theme.appTextTheme.textSmMedium
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
                    height: 8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: context.theme.appColor.background,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: ReorderableExpandableListExample(),
          ),
        ],
      ),
    );
  }
}

class ReorderableExpandableListExample extends StatefulWidget {
  const ReorderableExpandableListExample({super.key});

  @override
  State<ReorderableExpandableListExample> createState() =>
      _ReorderableExpandableListExampleState();
}

class _ReorderableExpandableListExampleState
    extends State<ReorderableExpandableListExample> {

  final OngoingExerciseCubit _cubit = sl<OngoingExerciseCubit>();

  // Map to track expansion state of each item by its ID
  final Map<String, bool> _expandedState = {};

  // Flag to track if drag is in progress
  bool _isDragging = false;

  final AutoScrollController _autoScrollController = AutoScrollController();

  int? highlightedIndex;

  @override
  void initState() {
    super.initState();

    // Initialize dummy ongoing exercise
    _cubit.initOngoingExercise(Workout(
      title: 'Upper Body Workout',
      startedAt: DateTime.now(),
      exercises: List.generate(
        8,
            (index) => ExerciseItem(
          id: 'item-$index',
          title: 'Item ${index + 1}',
          isExpanded: true,
          content:
          'This is the content for item ${index + 1}. You can put any widget here.',
          sets: List.generate(
            4,
                (setIndex) => ExerciseSet(
                  reps: setIndex,
                  weight: 20,
                  repsController: TextEditingController(),
                  weightController: TextEditingController(),
                  repsHint: 0,
                  weightHint: 0,
            ),
          ),
        ),
      ),
    ),);
  }

  void _onReorder(int oldIndex, int newIndex) async {
    final items = _cubit.ongoingExercise!.exercises;

    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = items.removeAt(oldIndex);
      items.insert(newIndex, item);

      // Set dragging flag to false as reorder is complete
      _isDragging = false;

      highlightedIndex = newIndex;
    });

    _cubit.updateOngoingExercise(_cubit.ongoingExercise!.copyWith(
      exercises: items,
    ));

    await Future.delayed(const Duration(milliseconds: 250));
    if (mounted) {
      setState(() {
        highlightedIndex = null;
      });
    }

    _autoScrollController.scrollToIndex(
      newIndex,
      preferPosition: AutoScrollPosition.middle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _cubit,
      builder: (context, state) {
        if (_cubit.ongoingExercise == null) {
          return Container();
        }

        return ReorderableListView.builder(
          scrollController: _autoScrollController,
          padding: const EdgeInsets.all(16),
          proxyDecorator: (child, index, animation) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: context.theme.appColor.borderSecondary,
                  width: 0.5,
                ),
                boxShadow: [
                  highlightedIndex == index ? const BoxShadow(
                    color: Colors.blue,
                    blurRadius: 4,
                    offset: Offset(0.0, 1.0),
                    spreadRadius: 1,
                  ) : context.theme.appShadow.shadowXs,
                ],
              ),
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
                                        const Text(
                                        'Hewo',
                                        ),
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.expand_more,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          onReorderStart: (index) {
            setState(() {
              // Set dragging flag to true when drag starts
              _isDragging = true;
            });
          },
          onReorderEnd: (index) async {
            setState(() {
              // Set dragging flag to false when drag ends (but before onReorder)
              // onReorder will be called immediately after this
              _isDragging = false;
            });
          },
          onReorder: _onReorder,
          itemCount: _cubit.ongoingExercise!.exercises.length,
          itemBuilder: (context, index) {
            final item = _cubit.ongoingExercise!.exercises[index];
            // Use the item's id to track its expanded state, default to false if not found
            final isExpanded = !_isDragging && (_expandedState[item.id] ?? false);

            return AutoScrollTag(
              key: ValueKey(index),
              controller: _autoScrollController,
              index: index,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: context.theme.appColor.borderSecondary,
                    width: 0.5,
                  ),
                  boxShadow: [
                    highlightedIndex == index ? const BoxShadow(
                      color: Colors.blue,
                      blurRadius: 4,
                      offset: Offset(0.0, 1.0),
                      spreadRadius: 1,
                    ) : context.theme.appShadow.shadowXs,
                  ],
                ),
                child: OngoingExerciseItem(
                  exerciseItem: item,
                  updateExerciseItem: () {
                  },
                  onLongPress: () {},
                  onExpansionChanged: (expanded) {
                    // Only update expansion state if not dragging
                    if (!_isDragging) {
                      setState(() {
                        _expandedState[item.id] = expanded;
                      });
                    }
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
