import 'package:fitness/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AppButtonStyle {
  primary,
  secondary,
  tertiary,
  active,
  text
}

class Button extends StatelessWidget {
  final AppButtonStyle style;
  final EdgeInsets? padding;
  final String? iconSvgUri;
  final double? iconSize;
  final String text;
  final double? fontSize;
  final Color? iconColor;
  final FontWeight? fontWeight;
  final VoidCallback onPressed;

  const Button({
    Key? key,
    this.style = AppButtonStyle.primary,
    this.padding,
    this.iconSvgUri,
    this.iconSize = 22,
    required this.text,
    this.fontSize,
    this.iconColor,
    this.fontWeight,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultButtonPadding = iconSvgUri != null
        ? const EdgeInsets.symmetric(horizontal: 8, vertical: 12)
        : const EdgeInsets.symmetric(horizontal: 8, vertical: 14.5);

    switch (style) {
      case AppButtonStyle.primary:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: AppColor.seaHalberd
          ),
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Container(
              padding: padding ?? defaultButtonPadding,
              child: _buildButtonChild(
                textColor: Colors.white,
                warnaIcon: Colors.white
              ),
            )
          ),
        );

      case AppButtonStyle.secondary:
        return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            side: const BorderSide(color: Colors.white),
          ),
          child: Container(
            padding: padding ?? defaultButtonPadding,
            child: _buildButtonChild(
              textColor: Colors.white
            ),
          ),
        );

      case AppButtonStyle.tertiary:
        return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            side: const BorderSide(color: Color(0xFFF7F7FC)),
          ),
          child: Container(
            padding: padding ?? defaultButtonPadding,
            child: _buildButtonChild(
              textColor: Colors.black,
            ),
          ),
        );

      case AppButtonStyle.active:
        return Container(
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
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: padding ?? defaultButtonPadding,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
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
            child: _buildButtonChild(
              textColor: Colors.black,
              warnaIcon: Colors.black
            ),
          ),
        );

      case AppButtonStyle.text:
        return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            side: const BorderSide(color: Colors.white),
          ),
          child: Container(
            padding: padding ?? defaultButtonPadding,
            child: _buildButtonChild(
              textColor: Colors.black,
              mainAxisSize: MainAxisSize.min
            ),
          ),
        );
    }
  }

  Widget _buildButtonChild({
    required Color textColor,
    Color? warnaIcon,
    MainAxisSize mainAxisSize = MainAxisSize.max
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: mainAxisSize,
      children: <Widget>[
        iconSvgUri != null ? Row(
          children: [
            SvgPicture.asset(
              iconSvgUri!,
              color: iconColor ?? warnaIcon,
              height: iconSize,
              width: iconSize,
            ),

            const SizedBox(width: 4)
          ],
        ) :
        const SizedBox(),

        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize ?? 16,
            fontWeight: fontWeight ?? FontWeight.w600
          ),
        ),
      ],
    );
  }
}
