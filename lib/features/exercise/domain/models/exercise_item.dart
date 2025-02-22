class ExerciseItem {
  String id;
  String title;
  String content;
  bool isExpanded;

  ExerciseItem({
    required this.id,
    required this.title,
    required this.content,
    this.isExpanded = false,
  });
}