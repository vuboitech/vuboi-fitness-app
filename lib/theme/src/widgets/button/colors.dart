import 'package:flutter/material.dart';

class ButtonColors {
  final Color foreground;
  final Color foregroundHover;
  final Color background;
  final Color backgroundHover;

  final Color? border;
  final Color? borderHover;

  ButtonColors({
    required this.foreground,
    required this.foregroundHover,
    required this.background,
    required this.backgroundHover,
    this.border,
    this.borderHover,
  });
}