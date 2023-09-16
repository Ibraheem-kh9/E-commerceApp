import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';

class CustomHomeNotificationWidget extends StatelessWidget {
  const CustomHomeNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Icon(
        Icons.notifications_outlined,
        size: 20.sp,
        color: AppColor.kIconColor,
      ),
    );
  }
}
