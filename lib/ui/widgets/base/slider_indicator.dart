import 'package:flutter/material.dart';

class SliderIndicator extends StatelessWidget {
  final int indicatorCount;
  final int activeIndicator;
  final double indicatorSize;

  SliderIndicator({
    required this.indicatorCount,
    required this.activeIndicator,
    this.indicatorSize = 8
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(indicatorCount, (index) {
        return Container(
          height: indicatorSize,
          width: indicatorSize,
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: index == activeIndicator - 1
                ? Colors.white
                : Colors.white.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}