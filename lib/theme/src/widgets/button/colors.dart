import 'package:flutter/material.dart';

class ButtonColors {
  final Color background;
  final Color foreground;
  final Color? border;
  final Color contentColor;

  ButtonColors({
    required this.background,
    required this.foreground,
    this.border,
    required this.contentColor,
  });
}