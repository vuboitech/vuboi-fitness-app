import 'package:fitness/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AppButtonStyle {
  primary,
  secondary,
  tertiary,
  active,
  text,
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

    double borderRadius = 24;

    switch (style) {
      case AppButtonStyle.primary:
        borderRadius = 8;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Color(0xFF000A23)
          ),
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            child: Container(
              padding: padding ?? defaultButtonPadding,
              child: _buildButtonChild(
                textColor: Color(0xFFFFD700),
                warnaIcon: Colors.white
              ),
            )
          ),
        );

      case AppButtonStyle.secondary:
        borderRadius = 8;
        return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            side: const BorderSide(color: Colors.white),
          ),
          child: Container(
            padding: padding ?? defaultButtonPadding,
            child: _buildButtonChild(
              textColor: Colors.white,
              warnaIcon: Colors.white
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
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            side: const BorderSide(color: Color(0xFFD9DBE9)),
          ),
          child: Container(
            padding: padding ?? defaultButtonPadding,
            child: _buildButtonChild(
              textColor: Colors.black,
              warnaIcon: Colors.white
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
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Container(
            padding: padding ?? defaultButtonPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
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
              borderRadius: BorderRadius.circular(borderRadius),
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
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: mainAxisSize,
      children: <Widget>[
        iconSvgUri != null ? Row(
          children: [
            SvgPicture.asset(
              iconSvgUri!,
              theme: SvgTheme(
                currentColor: iconColor ?? warnaIcon!
              ),
              height: iconSize,
              width: iconSize,
            ),

            const SizedBox(width: 8)
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
