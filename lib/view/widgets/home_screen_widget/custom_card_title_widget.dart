import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';

class CustomCardTitleWidget extends StatelessWidget {
  final String? title;
  const CustomCardTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(
        left: 2.h,
        right: 2.h,
        top: 0.5.h,
        bottom: 3.h,
      ),
      child: Text(
        title!,
        style: TextStyle(
          fontSize: 11.sp,
          color: AppColor.kDefaultTextColor,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 2,
      ),
    );
  }
}
