// import 'package:fedelo/utils/theme/app_theme.dart';
import 'package:eats/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.child,
      required this.onPressed,
      this.width,
      this.height, this.color});

  final Widget child;
  final Function() onPressed;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: height ?? 30.h,
      minWidth: width ?? MediaQuery.of(context).size.width,
      elevation: 0,
      color: color ?? AppTheme.secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: child,
    );
  }
}
