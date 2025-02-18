import 'package:fitness/features/home/presentation/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainNavigationButton extends StatelessWidget {
  final String svg, text;
  final VoidCallback onPressed;
  final bool isActive;

  const MainNavigationButton({
    super.key,
    required this.svg,
    required this.text,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    var defaultButtonPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    );

    if (isActive) {
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0617, 0.9383],
              colors: [
                Color(0xFF5B86E5),
                Color(0xFF36D1DC),
              ],
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Container(
            padding: defaultButtonPadding,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.1358, 0.8678],
                colors: [
                  Color(0xFFCEC1DE),
                  Color(0xFF9E89BA),
                ],
              ),
            ),
            child: _buttonChild(),
          ),
        ),
      );
    } else {
      return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: defaultButtonPadding,
          minimumSize: const Size(0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          side: const BorderSide(color: Color(0xFFD9DBE9)),
        ),
        child: _buttonChild(),
      );
    }
  }

  Widget _buttonChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: [
            SvgPicture.asset(
              svg,
              color: isActive ? Colors.black : Colors.white,
              height: 18,
              width: 18,
            ),
            const SizedBox(width: 8),
          ],
        ),
        Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}