import 'package:fitness/ui/widgets/base/chip/chip.dart';
import 'package:flutter/material.dart';

class ChipGroup extends StatelessWidget {
  final List<AppChip> chips;

  const ChipGroup({
    Key? key,
    required this.chips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: chips
          ),
          SizedBox(width: 4),
        ],
      ),
    );
  }
}
