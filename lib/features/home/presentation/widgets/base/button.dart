import 'package:fitness/theme/lib.dart';
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
  final Widget? icon;
  final double? iconSize;
  final String? text;
  final double? fontSize;
  final Color? iconColor;
  final FontWeight? fontWeight;
  final VoidCallback onPressed;

  const Button._({
    super.key,
    required this.style,
    this.padding,
    this.iconSvgUri,
    this.icon,
    this.iconSize = 22,
    this.text,
    this.fontSize,
    this.iconColor,
    this.fontWeight,
    required this.onPressed,
  });

  factory Button({
    Key? key,
    AppButtonStyle style = AppButtonStyle.primary,
    EdgeInsets? padding,
    String? iconSvgUri,
    double? iconSize,
    required String text,
    double? fontSize,
    Color? iconColor,
    FontWeight? fontWeight,
    required VoidCallback onPressed,
  }) {
    return Button._(
      key: key,
      style: style,
      padding: padding,
      iconSvgUri: iconSvgUri,
      iconSize: iconSize,
      text: text,
      fontSize: fontSize ,
      iconColor: iconColor,
      fontWeight: fontWeight,
      onPressed: onPressed,
    );
  }

  factory Button.icon({
    Key? key,
    AppButtonStyle style = AppButtonStyle.primary,
    EdgeInsets? padding,
    required Widget icon,
    String? text,
    double? fontSize,
    Color? iconColor,
    FontWeight? fontWeight,
    required VoidCallback onPressed,
  }) {
    return Button._(
      key: key,
      style: style,
      padding: padding,
      icon: icon,
      text: text,
      fontSize: fontSize ,
      iconColor: iconColor,
      fontWeight: fontWeight,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    var defaultButtonPadding = iconSvgUri != null
        ? const EdgeInsets.symmetric(horizontal: 8, vertical: 12)
        : const EdgeInsets.symmetric(horizontal: 8, vertical: 14.5);

    double borderRadius = 24;

    switch (style) {
      case AppButtonStyle.primary:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: AppColors.seaHalberd,
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
                textColor: Colors.white,
                warnaIcon: Colors.white,
              ),
            ),
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
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            side: const BorderSide(color: Colors.white),
          ),
          child: Container(
            padding: padding ?? defaultButtonPadding,
            child: _buildButtonChild(
              textColor: Colors.white,
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
            ),
          ),
        );

      case AppButtonStyle.active:
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
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Container(
              padding: padding ?? defaultButtonPadding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                gradient: const LinearGradient(
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
                warnaIcon: Colors.black,
              ),
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
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        );
    }
  }

  Widget _buildButtonChild({
    required Color textColor,
    Color? warnaIcon,
    MainAxisSize mainAxisSize = MainAxisSize.max,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: mainAxisSize,
      children: <Widget>[
        if (iconSvgUri != null)
          Row(
            children: [
              SvgPicture.asset(
                iconSvgUri!,
                theme: SvgTheme(
                  currentColor: iconColor ?? warnaIcon ?? textColor,
                ),
                height: iconSize,
                width: iconSize,
              ),
              const SizedBox(width: 8),
            ],
          ),
        if (icon != null) icon!,
        if (text != null)
          Text(
            text!,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight ?? FontWeight.w600,
            ),
          ),
      ],
    );
  }
}
