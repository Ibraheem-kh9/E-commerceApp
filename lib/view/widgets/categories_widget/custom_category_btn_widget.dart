import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';

class CustomCategoryBtnWidget extends StatelessWidget {
  final void Function()? onPress;
  const CustomCategoryBtnWidget({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(
        Icons.arrow_forward_outlined,
        color: AppColor.kMainColor,
        size: 16.sp,
      ),
    );
  }
}
