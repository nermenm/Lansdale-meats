import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFcf3415);

  static const Color secondaryColor = Color(0xFF20734b);
  // static const Color lightColor = Color(0xFFCDD5E0);
  // static const Color darkerPrimaryColor = Color(0xFF061630);
  // static const Color greyColor = Color(0xFF8E9194);
  // static const Color darkerGreyColor = Color(0xFF4A5660);
  // static const Color backgroundColor = Color(0xFFF6F6F6);

  static const String defaultFont = 'Barlow';
  static const String handwrittenFont = 'Satisfy';

  static TextTheme textTheme =
      Typography.englishLike2018.apply(fontSizeFactor: 1.sp).copyWith(
            titleSmall: const TextStyle(color: Colors.black, fontFamily: defaultFont),
            titleMedium: const TextStyle(color: Colors.black, fontFamily: defaultFont),
            titleLarge: const TextStyle(color: Colors.black, fontFamily: defaultFont),
            bodySmall: const TextStyle(color: Colors.black, fontFamily: defaultFont),
            bodyMedium: const TextStyle(color: Colors.black, fontFamily: defaultFont),
            bodyLarge: const TextStyle(color: Colors.black, fontFamily: defaultFont),
          );

  static ThemeData themeData = ThemeData(
      primarySwatch: Colors.red,
      textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
      useMaterial3: false,
      appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          elevation: 0,
          titleTextStyle:
              TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)));
  static const Size designSize = Size(430, 932);
}
