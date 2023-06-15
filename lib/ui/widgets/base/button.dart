import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class Button extends StatelessWidget {
  final String? iconSvgUri;
  final double? iconSize;
  final String text;
  final double? fontSize;
  final Color? iconColor;
  final FontWeight? fontWeight;
  final VoidCallback onPressed;

  const Button({
    Key? key,
    this.iconSvgUri,
    this.iconSize,
    required this.text,
    this.fontSize,
    this.iconColor,
    this.fontWeight,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 13.5, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: const BorderSide(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          iconSvgUri != null ? Row(
            children: [
              SvgPicture.asset(
                iconSvgUri!,
                color: iconColor,
                height: iconSize ?? 22,
                width: iconSize ?? 22,
              ),

              const SizedBox(width: 4)
            ],
          ) :
          const SizedBox(),

          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight ?? FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}
