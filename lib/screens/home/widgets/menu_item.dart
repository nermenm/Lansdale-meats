

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/helpers/navigate.dart';
import '../../../utils/theme/app_theme.dart';
import '../menu_details.dart';

class MenuItem extends StatefulWidget {
   const MenuItem({super.key, required this.text});
  final String text;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isSearch = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigate.navigateTo(context, MenuDetails(title: widget.text));
      },
      child: Container(
          // height: 20.h,
          // width: 100.w,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: AppTheme.secondaryColor.withOpacity(0.15),
              // border: Border.all(color: AppTheme.secondaryColor),
              // boxShadow: const [
              //   BoxShadow(
              //     color: Colors.grey,
              //     blurRadius: 1,
              //     offset: Offset(0.4, 0.8), // Shadow position
              //   ),
              // ],
              borderRadius: BorderRadius.circular(8.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/food.svg',
                colorFilter: const ColorFilter.mode(
                    AppTheme.secondaryColor, BlendMode.srcIn),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                widget.text,
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                ),
              )
            ],
          )),
    );
  }
}
