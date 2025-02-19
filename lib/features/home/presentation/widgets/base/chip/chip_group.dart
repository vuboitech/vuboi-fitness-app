import 'package:flutter/material.dart';

import 'chip.dart';

class ChipGroup extends StatelessWidget {
  final List<AppChip> chips;

  const ChipGroup({
    super.key,
    required this.chips,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: chips,
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}
