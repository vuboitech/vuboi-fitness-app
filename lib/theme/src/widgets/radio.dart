import 'package:fitness/theme/lib.dart';
import 'package:flutter/material.dart';

class CustomRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String? label;
  final double size;
  final TextStyle? labelStyle;
  final Duration animationDuration;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    this.label,
    this.size = 16,
    this.labelStyle,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  bool get isSelected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    final activeColor = context.theme.appColor.primary;

    final defaultTextStyle = Theme.of(context).textTheme.bodyLarge;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: animationDuration,
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? activeColor : context.theme.appColor.borderPrimary,
              width: 1,
            ),
            color: activeColor,
          ),
          child: Center(
            child: AnimatedContainer(
              duration: animationDuration,
              width: isSelected ? size / 2.5 : size,
              height: isSelected ? size / 2.5 : size,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
        if (label != null) ...[
          const SizedBox(width: 8.0),
          Text(
            label!,
            style: labelStyle ?? defaultTextStyle,
          ),
        ],
      ],
    );
  }
}