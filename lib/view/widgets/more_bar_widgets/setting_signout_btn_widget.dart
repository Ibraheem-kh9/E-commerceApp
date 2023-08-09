import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants/constant_color.dart';

class SettingSignOutBtn extends StatelessWidget {
  final Function()? onPress;
  final String? imageName;
  final String? text;

  const SettingSignOutBtn({
    super.key,
    required this.onPress,
    required this.imageName,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h, right: 1.h),
      child: ElevatedButton(
        onPressed: onPress!,
        style: const ButtonStyle(
          //fixedSize: MaterialStatePropertyAll(Size(20.h, 5.h)),
          backgroundColor: MaterialStatePropertyAll(AppColor.cancelColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imageName!,
              scale: 16.sp,
              color: AppColor.kBackgroundColor,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              text!,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
