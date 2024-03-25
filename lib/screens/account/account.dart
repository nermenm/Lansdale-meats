
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/widgets/card_row.dart';
import 'about_us.dart';
import 'contact_us.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            SizedBox(
              height: 40.h,
            ),
            const CardRow(
              text: 'About us',
              icon: Icon(Icons.info),
              screen: AboutUs(),
            ),
            SizedBox(
              height: 20.h,
            ),
            const CardRow(
              text: 'Contact us',
              icon: Icon(Icons.phone),
              screen: ContactUs(),
            ),
          ],
        ),
      ),
    );
  }
}
