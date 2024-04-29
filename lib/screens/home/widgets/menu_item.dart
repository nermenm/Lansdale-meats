

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/helpers/navigate.dart';
import '../../../utils/theme/app_theme.dart';
import '../../../utils/widgets/button.dart';
import '../menu_details.dart';

class MenuItem extends StatefulWidget {
   const MenuItem({super.key, required this.text, required this.id});
  final String text;
  final int id;

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
    return Button(

      onPressed: () {         Navigate.navigateTo(context, MenuDetails(title: widget.text, id:widget.id));
      },
      child:    Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text(
              widget.text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),

    );
  }
}
