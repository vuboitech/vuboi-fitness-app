import 'package:fitness/theme/lib.dart';
import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hintText;
  final bool isPassword;
  final bool isReadOnly;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;

  const Textfield({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.hintText,
    this.isPassword = false,
    this.isReadOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          theme.appShadow.shadowXs,
        ],
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        obscureText: isPassword,
        readOnly: isReadOnly,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onChanged: onChanged,
        validator: validator,
        onTap: isReadOnly ? onTap : null,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          hintStyle: theme.appTextTheme.textMdRegular.copyWith(
            color: theme.appColor.textPlaceholder,
          ),
          filled: true,
          fillColor: theme.appColor.bgPrimary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: theme.appColor.borderPrimary,
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: theme.appColor.primary,
              width: 0.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: theme.appColor.borderErrorSubtle,
              width: 0.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: theme.appColor.borderPrimary,
              width: 0.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: theme.appColor.borderDisabled,
              width: 0.5,
            ),
          ),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: theme.iconTheme.color)
              : null,
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: theme.iconTheme.color)
              : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
