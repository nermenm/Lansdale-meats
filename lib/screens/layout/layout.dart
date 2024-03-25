
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/theme/app_theme.dart';
import '../account/account.dart';
import '../cart/cart.dart';
import '../home/home.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;

  List<String> navbarItems = ['Home', 'Cart', 'Account'];
  List<Widget> children = [
    const Home(),
     Cart(),
    const Account()
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

        return Scaffold(
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(top: 4.h),
            decoration: const BoxDecoration(
                color: Colors.white,
                border:
                    Border(top: BorderSide(color: Colors.black, width: 0.2))),
            child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                // selectedItemColor: AppTheme.primaryColor,
                selectedFontSize: 10.sp,
                type: BottomNavigationBarType.fixed,
                items: navbarItems
                    .map((e) => _nav(e.toLowerCase(), e, navbarItems.indexOf(e)))
                    .toList()),
          ),
          body: children[currentIndex],
        );
  }

  BottomNavigationBarItem _nav(
      String icon, String label, int index) {
    return BottomNavigationBarItem(
        icon: Badge(
backgroundColor: Colors.white,
          child: SvgPicture.asset(
            'assets/icons/$icon.svg',
            height: 20.h,
            colorFilter: ColorFilter.mode(
                currentIndex == index
                    ? AppTheme.primaryColor
                    : Colors.grey.shade800,
                BlendMode.srcIn),
          ),
        ),
        label: label);
  }
}
