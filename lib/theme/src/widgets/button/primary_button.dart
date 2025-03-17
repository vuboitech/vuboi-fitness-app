import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';

enum IconPosition { leading, trailing }

enum ButtonVariant { primary, secondary, secondaryColor, tertiary }

class PrimaryButton extends StatelessWidget {
  final ButtonVariant variant;
  final String? text;
  final VoidCallback? onPressed;
  final String? iconSvgUri;
  final IconPosition iconPosition;

  const PrimaryButton({
    super.key,
    this.variant = ButtonVariant.primary,
    this.text,
    required this.onPressed,
    this.iconSvgUri,
    this.iconPosition = IconPosition.leading,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ButtonColors buttonColors = _getButtonColors(theme);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColors.background,
        foregroundColor: buttonColors.foreground,
        side: buttonColors.border != null ? BorderSide(
          color: buttonColors.border!,
          width: 1,
        ) : null,
        elevation: 1,
        shadowColor: variant != ButtonVariant.tertiary
            ? Colors.black.withOpacity(0.1)
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: _buildButtonChild(
        contentColor: buttonColors.contentColor,
      ),
    );
  }

  Widget _buildButtonChild({
    Color contentColor = Colors.black,
    MainAxisSize mainAxisSize = MainAxisSize.max,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: mainAxisSize,
      children: <Widget>[
        if (iconSvgUri != null && iconPosition == IconPosition.leading)
          Container(
            margin: text != null
                ? const EdgeInsets.only(right: 8)
                : EdgeInsets.zero,
            child: SvgPicture.asset(
              iconSvgUri!,
              color: contentColor,
              theme: SvgTheme(currentColor: contentColor),
            ),
          ),
        if (text != null)
          Text(
            text!,
            style: TextStyle(
              color: contentColor,
            ),
          ),
        if (iconSvgUri != null && iconPosition == IconPosition.trailing)
          Container(
            margin:
                text != null ? const EdgeInsets.only(left: 8) : EdgeInsets.zero,
            child: SvgPicture.asset(
              iconSvgUri!,
              color: contentColor,
              theme: SvgTheme(currentColor: contentColor),
            ),
          ),
      ],
    );
  }

  ButtonColors _getButtonColors(ThemeData theme) {
    Color mainColor = theme.colorScheme.primary;

    switch (variant) {
      case ButtonVariant.primary:
        return ButtonColors(
          background: mainColor,
          foreground: Colors.white,
          border: null,
          contentColor: Colors.white,
        );
      case ButtonVariant.secondary:
        return ButtonColors(
          background: Colors.transparent,
          foreground: Colors.black.withOpacity(0.05),
          border: Color(0xFFD5D7DA),
          contentColor: Colors.black,
        );
      case ButtonVariant.secondaryColor:
        return ButtonColors(
          background: Colors.transparent,
          foreground: mainColor,
          border: Color(0xFFD5D7DA),
          contentColor: mainColor,
        );
      case ButtonVariant.tertiary:
        return ButtonColors(
          background: Colors.transparent,
          foreground: mainColor,
          border: Colors.transparent,
          contentColor: mainColor,
        );
    }
  }
}
