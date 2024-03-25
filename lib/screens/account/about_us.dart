
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/helpers/constants.dart';
import '../../utils/theme/app_theme.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('About us'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Lansdale Meats & Deli',
                style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppTheme.handwrittenFont),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Your Favorit Foods',
                style: TextStyle(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.bold),),
                Text(
                  'Made Fresh Daily',
                  style: TextStyle(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                Constants.aboutUs,
                style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
