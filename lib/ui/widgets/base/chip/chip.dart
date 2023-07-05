import 'package:flutter/material.dart';

class AppChip extends StatelessWidget {
  final String label;
  final bool isActive;

  const AppChip({
    Key? key,
    required this.label,
    this.isActive = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 6, right: 12, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isActive ? Color(0xFF610BEF) : Color(0xFF6E7191)
                    ),
                  ),
                  SizedBox(width: 3),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: isActive ? Color(0xFF610BEF) : Color(0xFF6E7191),
                  )
                ],
              ),
            ),
            Container(
              height: 3,
              width: 32,
              decoration: BoxDecoration(
                color: isActive ? Color(0xFF610BEF) : Color(0xFF6E7191),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(2),
                  topLeft: Radius.circular(2),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
