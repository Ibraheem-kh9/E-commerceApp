import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomCategoryNameWidget extends StatelessWidget {
  final String? title;
  const CustomCategoryNameWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
