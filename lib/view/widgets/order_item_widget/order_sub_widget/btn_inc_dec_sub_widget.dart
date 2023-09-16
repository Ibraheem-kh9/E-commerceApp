
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/constants/constant_color.dart';

class BtnIncDecWidget extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;

  const BtnIncDecWidget({super.key, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 17.sp,
        color: AppColor.kBackgroundContainer,
      ),
    );
  }
}
