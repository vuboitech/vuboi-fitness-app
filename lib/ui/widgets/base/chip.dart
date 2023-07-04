import 'package:flutter/material.dart';

class AppChip extends StatelessWidget {
  const AppChip({Key? key}) : super(key: key);

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
        side: const BorderSide(color: Colors.white),
      ),
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 6, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  Text(
                    'All Exercise',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
            Container(
              height: 3,
              width: 32,
              decoration: BoxDecoration(
                color: Color(0xFF610BEF),
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
