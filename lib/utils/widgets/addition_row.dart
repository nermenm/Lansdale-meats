// import 'package:fedelo/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_theme.dart';

class AdditionRow extends StatefulWidget {
  const AdditionRow({
    super.key,
    required this.text
  });

  final String text;

  @override
  State<AdditionRow> createState() => _AdditionRowState();
}

class _AdditionRowState extends State<AdditionRow> {
  bool isSelected = false;
  String? spice;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: TextStyle(color: Colors.black, fontSize: 12.sp),
        ),
        Checkbox(
            value: isSelected,
            activeColor: AppTheme.primaryColor,
            onChanged: (v) {
              setState(() {
                isSelected = !isSelected;
                spice = isSelected ? 'Normal' : null;
              });
            }),
            if (isSelected)
        Row(
          children: [
            _card('Extra', spice == 'Extra'),
            _card('Normal', spice == 'Normal'),
          ],
        )
      ],
    );
  }

  Widget _card(String text, bool isSelected) {
    return InkWell(
      onTap: () {
        if (isSelected) {
          spice = text;
        } else {
          isSelected = true;
          spice = text;
        }
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: isSelected ? AppTheme.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}
