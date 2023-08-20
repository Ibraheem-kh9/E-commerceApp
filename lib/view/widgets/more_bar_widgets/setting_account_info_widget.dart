import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';

class SettingAccountInfoWidget extends StatelessWidget {
  final String? imageName;
  final String? email;
  final String? phoneNumber;

  const SettingAccountInfoWidget({
    super.key,
    required this.imageName,
    required this.email,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 1.h, right: 1.h, bottom: 2.h),
      padding: EdgeInsets.only(left: 1.h,right: 1.h),
      height: 7.h,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.kMainColor.withOpacity(0.5))),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                email!,
                //appLocale.getTranslated('setting_notification')!,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                phoneNumber!,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
