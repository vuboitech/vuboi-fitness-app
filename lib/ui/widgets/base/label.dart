import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;

  const Label({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Color(0xFF2AA8F8),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFFF7F7FC),
          fontSize: 12,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
