/*
import 'package:fitness/theme/themes/commons/app_theme.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_svg/flutter_svg.dart';

import 'button/enums.dart';

enum ButtonVariant { primary, secondary, secondaryColor, tertiary }

enum ButtonStyleVariant { info, destructive }

class AppButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonStyleVariant? styleVariant;
  final String? iconSvgUri;
  final IconPosition iconPosition;

  const AppButton({
    super.key,
    this.text,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.styleVariant,
    this.iconSvgUri,
    this.iconPosition = IconPosition.leading,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _ButtonColors buttonColors = _getButtonColors(theme);
    final Widget buttonChild = _buildButtonChild(
      contentColor: buttonColors.contentColor,
    );

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColors.background,
        foregroundColor: buttonColors.foreground,
        side: BorderSide(
          color: buttonColors.border,
          width: 1,
        ),
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: buttonChild,
    );
  }

  // Building whole button content
  Widget _buildButtonChild({
    Color contentColor = Colors.black,
    MainAxisSize mainAxisSize = MainAxisSize.max,
  }) {
    final Widget icon = SvgPicture.asset(
      iconSvgUri!,
      color: contentColor,
      theme: SvgTheme(currentColor: contentColor),
    );

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
            child: icon,
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
            child: icon,
          ),
      ],
    );
  }

  _ButtonColors colors(ThemeData theme) {
    switch (variant) {
      case ButtonVariant.primary:
        if (styleVariant == null) {
          return _ButtonColors(
            background: theme.appColor.primary,
            foreground: theme.appColor.primary.withOpacity(0.1),
            border: Colors.transparent,
            contentColor: theme.appColor.textColorBody,
          );
        } if (styleVariant == ButtonStyleVariant.info) {
          return _ButtonColors(
            background: Color(0xFF1877F2),
            foreground: Color(0xFF0C63D4),
            border: Colors.transparent,
            contentColor: theme.appColor.textColorBody,
          );
        } else if (styleVariant == ButtonStyleVariant.destructive) {
          return _ButtonColors(
            background: Color(0xFFD92D20),
            foreground: Color(0xFFB42318),
            border: Colors.transparent,
            contentColor: theme.appColor.textColorBody,
          );
        }

      case ButtonVariant.secondary:
        if (styleVariant == null) {
          return _ButtonColors(
            background: theme.appColor.background,
            foreground: theme.colorScheme.primary.withOpacity(0.1),
            border: Colors.transparent,
            contentColor: theme.appColor.background,
          );
        } if (styleVariant == ButtonStyleVariant.info) {
          return _ButtonColors(
            background: Color(0xFF1877F2),
            foreground: Color(0xFF0C63D4),
            border: Colors.transparent,
            contentColor: Colors.white,
          );
        } else if (styleVariant == ButtonStyleVariant.destructive) {
          return _ButtonColors(
            background: Color(0xFFD92D20),
            foreground: Color(0xFFB42318),
            border: Colors.transparent,
            contentColor: Colors.white,
          );
        }

      case ButtonVariant.secondaryColor:

      case ButtonVariant.tertiary:

    }
  }

  _ButtonColors _getButtonColors(ThemeData theme) {
    Color primaryColor = theme.colorScheme.primary;
    Color infoColor = Colors.blue.shade600;
    Color warningColor = Colors.amber.shade700;
    Color dangerColor = Colors.red.shade600;

    Color selectedColor;

    switch (styleVariant) {
      case ButtonStyleVariant.info:
        selectedColor = infoColor;
        break;
      case ButtonStyleVariant.warning:
        selectedColor = warningColor;
        break;
      case ButtonStyleVariant.danger:
        selectedColor = dangerColor;
        break;
      case ButtonStyleVariant.normal:
      default:
        selectedColor = primaryColor;
        break;
    }

    switch (variant) {
      case ButtonVariant.primary:
        return _ButtonColors(
          background: selectedColor,
          foreground: Colors.white, // Always white for primary buttons
          border: selectedColor,
          contentColor: Colors.white,
        );
      case ButtonVariant.secondary:
        return _ButtonColors(
          background: Colors.transparent,
          foreground: selectedColor,
          border: selectedColor,
          contentColor: selectedColor,
        );
      case ButtonVariant.tertiary:
        Color contentColor = styleVariant == ButtonStyleVariant.color
            ? selectedColor
            : Colors.black;

        return _ButtonColors(
            background: Colors.transparent,
            foreground: selectedColor, // Text and icon take the style color
            border: Colors.transparent,
            contentColor: contentColor);
    }
  }
}
*/
