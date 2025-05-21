import 'package:fitness/features/exercise/domain/models/exercise_item.dart';
import 'package:fitness/features/exercise/domain/models/ongoing_exercise.dart';
import 'package:fitness/features/exercise/presentation/bloc/ongoing_exercise/ongoing_exercise_cubit.dart';
import 'package:fitness/features/exercise/presentation/widgets/ongoing_exercise_item.dart';
import 'package:fitness/injection_container.dart';
import 'package:fitness/theme/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class OngoingExerciseItems extends StatefulWidget {
  const OngoingExerciseItems({super.key});

  @override
  State<OngoingExerciseItems> createState() => _OngoingExerciseItemsState();
}

class _OngoingExerciseItemsState extends State<OngoingExerciseItems> {
  final OngoingExerciseCubit _cubit = sl<OngoingExerciseCubit>();

  // Flag to track if drag is in progress
  bool _isDragging = false;

  final AutoScrollController _autoScrollController = AutoScrollController();

  int? highlightedIndex;

  @override
  void initState() {
    super.initState();

    // Initialize dummy ongoing exercise
    _cubit.initOngoingExercise(
      Workout(
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
      ),
    );
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

    _cubit.updateOngoingExercise(
      _cubit.ongoingExercise!.copyWith(
        exercises: items,
      ),
    );

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
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
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
                  highlightedIndex == index
                      ? const BoxShadow(
                          color: Colors.blue,
                          blurRadius: 4,
                          offset: Offset(0.0, 1.0),
                          spreadRadius: 1,
                        )
                      : context.theme.appShadow.shadowXs,
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
                                          margin:
                                              const EdgeInsets.only(right: 5),
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

            _cubit.changeExerciseItemExpandedState(false);
          },
          onReorderEnd: (index) {
            setState(() {
              // Set dragging flag to false when drag ends (but before onReorder)
              // onReorder will be called immediately after this
              _isDragging = false;
            });

            _cubit.restoreExpandedState();
          },
          onReorder: _onReorder,
          itemCount: _cubit.ongoingExercise!.exercises.length,
          itemBuilder: (context, index) {
            final item = _cubit.ongoingExercise!.exercises[index];

            return AutoScrollTag(
              key: ValueKey(index),
              controller: _autoScrollController,
              index: index,
              child: OngoingExerciseItem(
                exerciseItem: item,
                isHighlighted: highlightedIndex == index,
                isExpanded: _isDragging ? false : item.isExpanded,
                updateExerciseItem: () {},
                onLongPress: () {},
                onExpansionChanged: (expanded) {
                  // Only update expansion state if not dragging
                  if (!_isDragging) {
                    _cubit.setExpandedState(item.id, expanded);

                    final exercises = List<ExerciseItem>.from(
                      _cubit.ongoingExercise!.exercises,
                    );
                    exercises[index] =
                        exercises[index].copyWith(isExpanded: expanded);

                    _cubit.updateOngoingExercise(
                      _cubit.ongoingExercise!.copyWith(
                        exercises: exercises,
                      ),
                    );
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
