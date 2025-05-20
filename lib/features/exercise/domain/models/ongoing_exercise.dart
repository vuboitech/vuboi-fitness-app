import 'package:fitness/features/exercise/domain/models/exercise_item.dart';

class Workout {
  String title;
  List<ExerciseItem> exercises;
  DateTime? startedAt;

  Workout({
    required this.title,
    required this.exercises,
    this.startedAt,
  });

  Workout copyWith({
    String? title,
    List<ExerciseItem>? exercises,
    DateTime? startedAt,
  }) {
    return Workout(
      title: title ?? this.title,
      exercises: exercises ?? this.exercises,
      startedAt: startedAt ?? this.startedAt,
    );
  }
}