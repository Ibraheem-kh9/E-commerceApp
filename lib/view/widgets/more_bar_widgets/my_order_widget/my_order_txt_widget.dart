import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyOrderTxtWidget extends StatelessWidget {
  final String text;
  const MyOrderTxtWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
    style: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.bold,

    ),);
  }
}
