import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme/app_theme.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact us'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Working Hours',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Monday 09:00AM - 07:00PM',
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(

              'Thuesday - Friday 08:00 AM - 07:00 PM',
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(

              'Saturday 8:00 AM - 06:00 PM',
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(

              'Sunday 8:00 AM - 03:00 PM',
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Contact Us',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 15.h,
                  color: AppTheme.secondaryColor,
                ),
                SizedBox(
                  width: 8.h,
                ),
                Text(
                  '215-362-3922',
                  style: TextStyle(color: Colors.black, fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.facebook,
                  size: 15.h,
                  color: AppTheme.secondaryColor,
                ),
                SizedBox(
                  width: 8.h,
                ),
                Text(
                  'Lansdale Meats & Deli ',
                  style: TextStyle(color: Colors.black, fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.account_balance_outlined,
                  size: 15.h,
                  color: AppTheme.secondaryColor,
                ),
                SizedBox(
                  width: 8.h,
                ),
                Text(
                  '@lansdalemeats',
                  style: TextStyle(color: Colors.black, fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.email,
                  size: 15.h,
                  color: AppTheme.secondaryColor,
                ),
                SizedBox(
                  width: 8.h,
                ),
                Text(
                  'kevthebutcher@gmail.com',
                  style: TextStyle(color: Colors.black, fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Location',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Colonial Village, 1801 N Broad St, Lansdale, PA 19446',
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
