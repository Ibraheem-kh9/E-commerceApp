import 'package:e_commerce_app/view/coming_soon_sc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants/app_icons.dart';
import '../../../utils/constants/constant_color.dart';

class SettingCardWidget extends StatelessWidget {
  final Function()? onPress;
  final String? imageName;
  final String? text;
  const SettingCardWidget({super.key,this.onPress,this.imageName,this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 1.h, right: 1.h, bottom: 0.5.h),
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.kMainColor.withOpacity(0.5))),
      child: TextButton(
        onPressed: onPress,
        child: Row(
          children: [
            Image.asset(
              imageName!,
              scale: 18.sp,
              color: Colors.grey,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              text!,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
