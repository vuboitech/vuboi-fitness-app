import 'package:equatable/equatable.dart';
import 'package:fitness/features/exercise/domain/models/ongoing_exercise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ongoing_exercise_state.dart';

class OngoingExerciseCubit extends Cubit<OngoingExerciseState> {
  OngoingExerciseCubit() : super(OngoingExerciseInitial());

  Workout? ongoingExercise;

  void initOngoingExercise(Workout workout) {
    emit(StartExerciseInit());

    ongoingExercise = workout;

    emit(ExerciseInitialized());
  }

  void updateOngoingExercise(Workout workout) {
    emit(UpdateExerciseItemInit());

    ongoingExercise = workout;

    emit(UpdateExerciseItemFinished());
  }
}
