import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/extensions/context_extension.dart';

class MTextFormField extends StatelessWidget {
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool isDense;
  final bool enabled;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final VoidCallback? onEditingComplete;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextCapitalization textCapitalization;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforced;
  final int? errorMaxLines;
  final List<TextInputFormatter>? inputFormatters;
  final Color? enabledBorderColor;
  final bool readOnly;
  final Function? onTap;
  final double? suffixIconWidth;
  final double? suffixIconHeight;
  final TextStyle? style;
  final bool disableSuffixIconConstraints;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final bool autofocus;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final bool useBorder;
  final Color? hoverColor;

  const MTextFormField({
    super.key,
    this.disableSuffixIconConstraints = false,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.autocorrect = false,
    this.isDense = false,
    this.enabled = true,
    this.maxLengthEnforced,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.autofillHints,
    this.onEditingComplete,
    this.validator,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.errorMaxLines,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.readOnly = false,
    this.enabledBorderColor,
    this.onTap,
    this.style,
    this.suffixIconWidth,
    this.suffixIconHeight,
    this.contentPadding,
    this.hintStyle,
    this.fillColor,
    this.autofocus = false,
    this.focusNode,
    this.autovalidateMode,
    this.useBorder = true,
    this.hoverColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      autofocus: autofocus,
      readOnly: readOnly,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      enabled: enabled,
      focusNode: focusNode,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      cursorColor: context.primaryColor,
      cursorWidth: 1,
      autofillHints: autofillHints,
      onEditingComplete: onEditingComplete,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      textCapitalization: textCapitalization,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforced,
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      style: style != null
          ? style!.copyWith(fontSize: context.bodyLargeTextStyle!.fontSize)
          : context.getBodyMediumTextStyle(context.onSurfaceColor),
      inputFormatters: inputFormatters ?? [],
      decoration: InputDecoration(
        filled: fillColor != null ? true : false,
        fillColor: fillColor,
        contentPadding: contentPadding,
        suffixIconConstraints: disableSuffixIconConstraints
            ? null
            : BoxConstraints(
                maxHeight: suffixIconHeight ?? 24,
                maxWidth: suffixIconWidth ?? 24,
              ),
        isDense: isDense,
        hintText: hintText,
        labelText: labelText,
        errorText: errorText,
        helperText: helperText,
        prefixText: prefixText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconColor: context.onSurfaceVariantColor,
        prefixIconColor: context.onSurfaceVariantColor,
        border: useBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.outlineColor.withValues(alpha: .35),
                  width: 1,
                  style: BorderStyle.solid,
                ),
              )
            : InputBorder.none,
        enabledBorder: useBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.outlineColor.withValues(alpha: .35),
                  width: 1,
                  style: BorderStyle.solid,
                ),
              )
            : InputBorder.none,
        focusedBorder: useBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.primaryColor,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              )
            : InputBorder.none,
        errorBorder: useBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.errorColor,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              )
            : InputBorder.none,
        errorMaxLines: errorMaxLines,
        errorStyle: context.getBodySmallTextStyle(context.errorColor),
        helperStyle: context.getBodySmallTextStyle(
          context.onSurfaceVariantColor,
        ),
        labelStyle: context.getBodyMediumTextStyle(Colors.grey),
        hintStyle: hintStyle ?? context.getBodyMediumTextStyle(Colors.grey),
        prefixStyle: context.getBodyMediumTextStyle(Colors.grey),
        hoverColor: hoverColor,
      ),
    );
  }
}

class MTextFormFieldLabelInside extends StatelessWidget {
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool isDense;
  final bool enabled;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final VoidCallback? onEditingComplete;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextCapitalization textCapitalization;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforced;
  final int? errorMaxLines;
  final List<TextInputFormatter>? inputFormatters;
  final Color? enabledBorderColor;
  final bool readOnly;
  final Function? onTap;
  final double? suffixIconWidth;
  final double? suffixIconHeight;
  final bool disableSuffixIconConstraints;
  final bool isFilled;
  final Color? fillColor;
  final FloatingLabelBehavior floatingLabelBehavior;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextAlign textAlign;

  const MTextFormFieldLabelInside({
    super.key,
    this.disableSuffixIconConstraints = false,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.autocorrect = false,
    this.isDense = false,
    this.isFilled = false,
    this.enabled = true,
    this.autofocus = false,
    this.maxLengthEnforced,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.autofillHints,
    this.onEditingComplete,
    this.validator,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.errorMaxLines,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.readOnly = false,
    this.enabledBorderColor,
    this.onTap,
    this.suffixIconWidth,
    this.fillColor,
    this.suffixIconHeight,
    this.focusNode,
    this.textAlign = TextAlign.left,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      autofocus: autofocus,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      enabled: enabled,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      cursorColor: context.primaryColor,
      cursorWidth: 1,
      focusNode: focusNode,
      autofillHints: autofillHints,
      onEditingComplete: onEditingComplete,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      textCapitalization: textCapitalization,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      textAlign: textAlign,
      maxLengthEnforcement: maxLengthEnforced,
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      style: context.getBodyMediumTextStyle(context.onSurfaceColor),
      inputFormatters: inputFormatters ?? [],
      decoration: InputDecoration(
        suffixIconConstraints: disableSuffixIconConstraints
            ? null
            : BoxConstraints(
                maxHeight: suffixIconHeight ?? 24,
                maxWidth: suffixIconWidth ?? 24,
              ),
        isDense: isDense,
        hintText: hintText,
        labelText: labelText,
        errorText: errorText,
        helperText: helperText,
        prefixText: prefixText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: fillColor,
        filled: isFilled,
        floatingLabelBehavior: floatingLabelBehavior,
        suffixIconColor: context.onSurfaceVariantColor,
        prefixIconColor: context.onSurfaceVariantColor,
        border: InputBorder.none,
        errorStyle: context.getBodySmallTextStyle(context.errorColor),
        errorMaxLines: errorMaxLines,
        helperStyle: context.getBodySmallTextStyle(
          context.onSurfaceVariantColor,
        ),
        hintStyle: context.getBodyMediumTextStyle(
          context.onSurfaceVariantColor.withValues(alpha: .5),
        ),
        //Commenting labels as their colors are determined by the state of the text field
        /*labelStyle:
            context.getBodyLargeTextStyle(context.onSurfaceVariantColor),
        floatingLabelStyle: context.getBodySmallTextStyle(context.primaryColor),*/
        prefixStyle: context.getBodyMediumTextStyle(
          context.onSurfaceColor.withValues(alpha: .5),
        ),
      ),
    );
  }
}

class MTextFormFieldWithoutBorder extends StatelessWidget {
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool isDense;
  final bool enabled;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final VoidCallback? onEditingComplete;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextCapitalization textCapitalization;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforced;
  final int? errorMaxLines;
  final List<TextInputFormatter>? inputFormatters;
  final Color? enabledBorderColor;
  final bool readOnly;
  final Function? onTap;
  final double? suffixIconWidth;
  final double? suffixIconHeight;
  final TextStyle? style;
  final bool disableSuffixIconConstraints;

  const MTextFormFieldWithoutBorder({
    super.key,
    this.disableSuffixIconConstraints = false,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.autocorrect = false,
    this.isDense = false,
    this.enabled = true,
    this.maxLengthEnforced,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.autofillHints,
    this.onEditingComplete,
    this.validator,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.errorMaxLines,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.readOnly = false,
    this.enabledBorderColor,
    this.onTap,
    this.style,
    this.suffixIconWidth,
    this.suffixIconHeight,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      enabled: enabled,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      cursorColor: context.primaryColor,
      cursorWidth: 1,
      autofillHints: autofillHints,
      onEditingComplete: onEditingComplete,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      textCapitalization: textCapitalization,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforced,
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      style: style != null
          ? style!.copyWith(fontSize: context.bodyLargeTextStyle!.fontSize)
          : context.getBodyLargeTextStyle(context.onSurfaceColor),
      inputFormatters: inputFormatters ?? [],
      decoration: InputDecoration(
        suffixIconConstraints: disableSuffixIconConstraints
            ? null
            : BoxConstraints(
                maxHeight: suffixIconHeight ?? 24,
                maxWidth: suffixIconWidth ?? 24,
              ),
        isDense: isDense,
        hintText: hintText,
        labelText: labelText,
        errorText: errorText,
        helperText: helperText,
        prefixText: prefixText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconColor: context.onSurfaceVariantColor,
        prefixIconColor: context.onSurfaceVariantColor,
        border: InputBorder.none,
        errorStyle: context.getBodySmallTextStyle(context.errorColor),
        errorMaxLines: errorMaxLines,
        helperStyle: context.getBodySmallTextStyle(
          context.onSurfaceVariantColor,
        ),
        hintStyle: context.getBodyMediumTextStyle(
          context.onSurfaceVariantColor,
        ),
        //Commenting labels as their colors are determined by the state of the text field
        /*labelStyle:
            context.getBodyLargeTextStyle(context.onSurfaceVariantColor),
        floatingLabelStyle: context.getBodySmallTextStyle(context.primaryColor),*/
        prefixStyle: context.getBodyLargeTextStyle(
          context.onSurfaceColor.withValues(alpha: .5),
        ),
      ),
    );
  }
}

class MTextFormFloatingLabelInside extends StatelessWidget {
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool isDense;
  final bool enabled;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final VoidCallback? onEditingComplete;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextCapitalization textCapitalization;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforced;
  final int? errorMaxLines;
  final List<TextInputFormatter>? inputFormatters;
  final Color? enabledBorderColor;
  final bool readOnly;
  final Function? onTap;
  final double? suffixIconWidth;
  final double? suffixIconHeight;
  final bool disableSuffixIconConstraints;
  final bool isFilled;
  final Color? fillColor;
  final FloatingLabelBehavior floatingLabelBehavior;

  const MTextFormFloatingLabelInside({
    super.key,
    this.disableSuffixIconConstraints = false,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.autocorrect = false,
    this.isDense = false,
    this.isFilled = false,
    this.enabled = true,
    this.maxLengthEnforced,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.autofillHints,
    this.onEditingComplete,
    this.validator,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.errorMaxLines,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.readOnly = false,
    this.enabledBorderColor,
    this.onTap,
    this.suffixIconWidth,
    this.fillColor,
    this.suffixIconHeight,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      enabled: enabled,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      cursorColor: context.primaryColor,
      cursorWidth: 1,
      autofillHints: autofillHints,
      onEditingComplete: onEditingComplete,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      textCapitalization: textCapitalization,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforced,
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      style: context.getBodyLargeTextStyle(context.onSurfaceColor),
      inputFormatters: inputFormatters ?? [],
      decoration: InputDecoration(
        suffixIconConstraints: disableSuffixIconConstraints
            ? null
            : BoxConstraints(
                maxHeight: suffixIconHeight ?? 24,
                maxWidth: suffixIconWidth ?? 24,
              ),
        isDense: isDense,
        hintText: hintText,
        labelText: labelText,
        errorText: errorText,
        helperText: helperText,
        prefixText: prefixText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: fillColor,
        filled: isFilled,
        floatingLabelBehavior: floatingLabelBehavior,
        suffixIconColor: context.onSurfaceVariantColor,
        prefixIconColor: context.onSurfaceVariantColor,
        border: InputBorder.none,
        errorStyle: context.getBodySmallTextStyle(context.errorColor),
        errorMaxLines: errorMaxLines,
        helperStyle: context.getBodySmallTextStyle(
          context.onSurfaceVariantColor,
        ),
        hintStyle: context.getBodyMediumTextStyle(
          context.onSurfaceVariantColor.withValues(alpha: .5),
        ),
        prefixStyle: context.getBodyLargeTextStyle(
          context.onSurfaceColor.withValues(alpha: .5),
        ),
      ),
    );
  }
}
