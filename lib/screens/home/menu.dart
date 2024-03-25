
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/helpers/constants.dart';
import '../../utils/theme/app_theme.dart';
import '../../utils/widgets/card_row.dart';
import 'menu_details.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
        child: ListView.separated(
            itemBuilder: (context, index) => CardRow(
                text: Constants.menu[index],
                icon: SvgPicture.asset(
                  'assets/icons/food.svg',
                  colorFilter: const ColorFilter.mode(
                      AppTheme.secondaryColor, BlendMode.srcIn),
                ),
                screen: MenuDetails(title: Constants.menu[index])),
            separatorBuilder: (context, index) => SizedBox(
                  height: 20.h,
                ),
            itemCount: Constants.menu.length),
      ),
    );
  }
}
