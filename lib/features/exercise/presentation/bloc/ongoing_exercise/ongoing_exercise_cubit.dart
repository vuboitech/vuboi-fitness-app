import 'package:equatable/equatable.dart';
import 'package:fitness/features/exercise/domain/models/ongoing_exercise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ongoing_exercise_state.dart';

class OngoingExerciseCubit extends Cubit<OngoingExerciseState> {
  OngoingExerciseCubit() : super(OngoingExerciseInitial());

  Workout? ongoingExercise;

  // Map to track expansion state of each item by its ID
  final Map<String, bool> expandedState = {};

  void setExpandedState(String id, bool isExpanded) {
    expandedState[id] = isExpanded;
  }

  void initOngoingExercise(Workout workout) {
    emit(StartExerciseInit());

    ongoingExercise = workout;

    emit(ExerciseInitialized());
  }

  void changeExerciseItemExpandedState(bool isExpanded) {
    emit(UpdateExerciseItemInit());

    ongoingExercise?.exercises = ongoingExercise?.exercises.map((element) {
      element.isExpanded = isExpanded;
      return element;
    }).toList() ?? [];

    emit(UpdateExerciseItemFinished());
  }

  void restoreExpandedState() {
    emit(UpdateExerciseItemInit());

    ongoingExercise?.exercises = ongoingExercise?.exercises.map((element) {
      element.isExpanded = expandedState[element.id] ?? true;
      return element;
    }).toList() ?? [];

    emit(UpdateExerciseItemFinished());
  }

  void updateOngoingExercise(Workout workout) {
    emit(UpdateExerciseItemInit());

    ongoingExercise = workout;

    emit(UpdateExerciseItemFinished());
  }
}
