import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_theme.dart';

class Field extends StatelessWidget {
  const Field(
      {super.key,
      this.controller,
      this.hint,
      this.textInputType,
      this.maxLines,
      this.maxLength,
      this.contentPadding,
      this.prefix,
      this.suffix,
      this.inputFormatters,
      this.enabled = true,
      this.additionalValidators,
      this.textAlign,
      this.focusNode,
      this.isObscure = false,
      this.hasBorder = false,
      this.textStyle,
      this.hasEmptyValidation = true,
      this.onChanged,
      this.onFieldSubmitted,
      this.height});

  final TextEditingController? controller;
  final String? hint;
  final TextInputType? textInputType;
  final int? maxLines;
  final int? maxLength;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefix;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final List<Function(String?)>? additionalValidators;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final bool isObscure;
  final bool hasBorder;
  final TextStyle? textStyle;
  final bool hasEmptyValidation;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 48.h,
        child: TextFormField(
          controller: controller,
          enabled: enabled,
          keyboardType: textInputType ?? TextInputType.text,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          focusNode: focusNode,
          obscureText: isObscure,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          validator: (value) {
            if (hasEmptyValidation) {
              if (value == null || value.isEmpty) {
                return '';
              }
            }
            if (additionalValidators != null) {
              for (var customValidator in additionalValidators!) {
                return customValidator(value);
              }
            }
            return null;
          },
          textAlign: textAlign ?? TextAlign.start,
          style: textStyle ?? const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              suffixIcon: suffix,
              prefixIcon: prefix,
              contentPadding:
                  contentPadding ?? EdgeInsets.symmetric(horizontal: 16.w),
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                  borderSide: hasBorder
                      ? const BorderSide(color: AppTheme.primaryColor)
                      : BorderSide.none,
                  borderRadius: BorderRadius.circular(8.r))),
        ));
  }
}
