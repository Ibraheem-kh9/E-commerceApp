import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/constants/constant_color.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPress;
  final IconData? icon;
  final String? text;
  final bool? active;

  const CustomButtonAppBar({
    super.key,
    required this.onPress,
    required this.icon,
    required this.text,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active == true ? AppColor.kIconColor : AppColor.kMainColor ,
          ),
          Text(
            text!,
            style: TextStyle(
              color: active == true ? AppColor.kIconColor : AppColor.kMainColor ,
              fontSize: active == true ? 11.sp : 9.sp,
            ),
          ),
        ],
      ),
    );
  }
}
