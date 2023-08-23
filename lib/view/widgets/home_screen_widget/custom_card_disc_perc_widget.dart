import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';

class CustomCardDiscPercWidget extends StatelessWidget {
  final int? percentage;
  const CustomCardDiscPercWidget({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 20.w,
      height: 2.5.h,
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius:
          BorderRadius.all(Radius.circular(5.0))),
      child: Text(
        '$percentage %',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10.sp,
          color: AppColor.kBackgroundColor,
        ),
      ),
    );
  }
}
