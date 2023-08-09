import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants/constant_color.dart';

class SettingUpdatePsdWidget extends StatelessWidget {
  final TextEditingController? textEditingCtrl;
  final TextInputType? textInputType;
  final String? hintText;
  final IconData? formIcon;
  final Widget? suffixWidget;

  const SettingUpdatePsdWidget({
    super.key,
    this.textEditingCtrl,
    this.textInputType,
    this.hintText,
    this.formIcon,
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 3.5.h, left: 3.5.h),
      child: SizedBox(
        height: 8.9.h,
        child: TextFormField(
          controller: textEditingCtrl,
          keyboardType: textInputType,
          //obscureText: obscureText?? false,
          //// change state border color when enter valid value---------
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(
            fontSize: 10.sp,
          ),
          cursorHeight: 11.sp,
          //validator: validateAction,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey,
            ),
            prefixIcon: Icon(
              formIcon!,
              color: AppColor.kIconColor,
              size: 2.5.h,
            ),
            // icon: Icon(
            //   formIcon,
            //   color: AppColor.kIconColor,
            //   size: 2.5.h,
            // ),
            //suffixIcon: suffixWidget!,
            constraints: BoxConstraints(
              maxHeight: 10.h,
              minHeight: 5.h,
            ),
            contentPadding: EdgeInsets.only(
              left: 1.h,
              right: 1.h,
              top: 0.05.h,
              bottom: 0.05.h,
            ),

            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.kMainColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(1.5.h),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.kIconColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(1.5.h),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
