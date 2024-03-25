
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/navigate.dart';
import '../theme/app_theme.dart';

class CardRow extends StatelessWidget {
  const CardRow({
    super.key,
    required this.text,
    required this.icon, required this.screen,
  });

  final String text;
  final Widget icon;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigate.navigateTo(context, screen);
      },
      child: Row(
        children: [
          Container(
            height: 30.h,
            width: 45.w,
            decoration: BoxDecoration(
                color: AppTheme.secondaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8.r)),
            child: Center(
              child: icon,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 15.sp),
          ),
          SizedBox(
            width: 10.w,
          ),
          const Spacer(),
          const Icon(CupertinoIcons.chevron_forward)
        ],
      ),
    );
  }
}
