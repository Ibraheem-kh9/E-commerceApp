import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomItemTitleWidget extends StatelessWidget {
  final String title;
  const CustomItemTitleWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
