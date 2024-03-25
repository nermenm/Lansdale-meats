import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_theme.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key, required this.count, required this.onPressed}) : super(key: key);

  final int count;
  final Function(bool) onPressed;

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.count;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _counter('-', () => _updateCount(false)),
        Text(
          '$_count',
          style: const TextStyle(color: Colors.black),
        ),
        _counter('+', () => _updateCount(true))
      ],
    );
  }

  void _updateCount(bool increment) {
    setState(() {
      if (increment) {
        _count++;
      } else {
        // Ensure count doesn't go below 1
        if (_count > 1) {
          _count--;
        }
      }
    });
    widget.onPressed(increment);
  }


  MaterialButton _counter(String sign, VoidCallback onPressed) {
    return MaterialButton(
      onPressed: onPressed,
      height: 30.h,
      padding: const EdgeInsets.all(4),
      minWidth: 40.w,
      color: AppTheme.secondaryColor.withOpacity(0.7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Text(
        sign,
        style: TextStyle(color: Colors.white, fontSize: 14.sp),
      ),
    );
  }
}
