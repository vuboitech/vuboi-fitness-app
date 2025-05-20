import 'package:flutter/cupertino.dart';

enum ExerciseUnitMeasurement {
  kg,
  lbs,
}

class ExerciseSet {
  TextEditingController repsController;
  int reps;
  int repsHint;
  TextEditingController weightController;
  double weight;
  double weightHint;
  DateTime? finishedAt;

  ExerciseSet({
    required this.repsHint,
    required this.weightHint,
    required this.weightController,
    required this.reps,
    required this.repsController,
    required this.weight,
    this.finishedAt,
  });
}

class ExerciseItem {
  String id;
  String title;
  String content;
  bool isExpanded;
  ExerciseUnitMeasurement unitMeasurement;
  List<ExerciseSet> sets;

  ExerciseItem({
    required this.id,
    required this.title,
    required this.content,
    this.isExpanded = false,
    this.unitMeasurement = ExerciseUnitMeasurement.kg,
    this.sets = const [],
  });

  ExerciseItem copyWith({
    String? id,
    String? title,
    String? content,
    bool? isExpanded,
    ExerciseUnitMeasurement? unitMeasurement,
    List<ExerciseSet>? sets,
  }) {
    return ExerciseItem(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      isExpanded: isExpanded ?? this.isExpanded,
      unitMeasurement: unitMeasurement ?? this.unitMeasurement,
      sets: sets ?? this.sets,
    );
  }
}