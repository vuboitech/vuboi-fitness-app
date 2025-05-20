part of 'ongoing_exercise_cubit.dart';

sealed class OngoingExerciseState extends Equatable {
  const OngoingExerciseState();

  @override
  List<Object> get props => [];
}

final class OngoingExerciseInitial extends OngoingExerciseState {}

final class StartExerciseInit extends OngoingExerciseState {}

final class ExerciseInitialized extends OngoingExerciseState {}

final class UpdateExerciseItemInit extends OngoingExerciseState {}

final class UpdateExerciseItemFinished extends OngoingExerciseState {}
