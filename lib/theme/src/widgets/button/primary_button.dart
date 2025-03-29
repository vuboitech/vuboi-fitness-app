import 'package:fitness/theme/src/themes/commons/app_theme.dart';
import 'package:fitness/theme/src/themes/token/colors.dart';
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

    var defaultButtonPadding = iconSvgUri != null
        ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
        : const EdgeInsets.symmetric(horizontal: 12, vertical: 12);

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed) || states.contains(WidgetState.hovered)) {
              return buttonColors.backgroundHover;
            }
            return buttonColors.background;
          },
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed) || states.contains(WidgetState.hovered)) {
              return buttonColors.foregroundHover;
            }
            return buttonColors.foreground;
          },
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all<Size>(Size.zero),
        elevation: WidgetStateProperty.all<double>(0),
        shadowColor: WidgetStateProperty.all<Color>(variant != ButtonVariant.tertiary
            ? Colors.black.withOpacity(0.1)
            : Colors.transparent),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        splashFactory: InkRipple.splashFactory,
      ),
      onPressed: onPressed,
      child: Container(
        padding: defaultButtonPadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: buttonColors.border ?? Colors.transparent,
            width: 1,
            style: buttonColors.border != null
                ? BorderStyle.solid
                : BorderStyle.none,
          ),
        ),
        child: _buildButtonChild(
          contentColor: buttonColors.foreground,
        ),
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
    Color mainColor = theme.appColor.primary;

    switch (variant) {
      case ButtonVariant.primary:
        return ButtonColors(
          background: mainColor,
          backgroundHover: AppColors.colorsBrand700,
          foreground: AppColors.colorsBaseWhite,
          foregroundHover: AppColors.colorsBaseWhite,
          border: null,
          borderHover: null,
        );
      case ButtonVariant.secondary:
        return ButtonColors(
          background: theme.appColor.btnSecondaryBg,
          backgroundHover: theme.appColor.btnSecondaryBgHover,
          foreground: theme.appColor.btnSecondaryFg,
          foregroundHover: theme.appColor.btnSecondaryFgHover,
          border: theme.appColor.btnSecondaryBorder,
          borderHover: theme.appColor.btnSecondaryBorderHover,
        );
      case ButtonVariant.secondaryColor:
        return ButtonColors(
          background: Colors.transparent,
          backgroundHover: Colors.transparent,
          foreground: mainColor,
          foregroundHover: mainColor,
          border: theme.appColor.borderSecondary,
          borderHover: theme.appColor.borderSecondary,
        );
      case ButtonVariant.tertiary:
        return ButtonColors(
          background: Colors.transparent,
          backgroundHover: Colors.transparent,
          foreground: mainColor,
          foregroundHover: mainColor,
          border: Colors.transparent,
          borderHover: Colors.transparent,
        );
    }
  }
}
