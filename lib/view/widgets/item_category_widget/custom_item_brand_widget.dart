import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomItemBrandWidget extends StatelessWidget {
  final String subTitle;
  const CustomItemBrandWidget({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 10.sp,
      ),
    );
  }
}
