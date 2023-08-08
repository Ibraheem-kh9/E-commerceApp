
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants/constant_color.dart';

class LoginTextFormFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;
  final bool? obscureText;
  final IconData formIcon;
  final Widget? suffixWidget;
  final String? Function(String? value)? validateAction;
  //final GlobalKey keyForm;
  const LoginTextFormFieldWidget({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.formIcon,
    this.obscureText,
    required this.textInputType,
    this.suffixWidget,
    required this.validateAction,
   // required this.keyForm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 3.5.h,left: 3.5.h),
      child: SizedBox(
        height: 8.9.h,
        child: TextFormField(
          controller: textEditingController,
          keyboardType: textInputType,
          obscureText: obscureText?? false,
          //// change state border color when enter valid value---------
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(
            fontSize: 10.sp,
          ),
          cursorHeight: 11.sp,
          validator:validateAction,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey,
            ),
            prefixIcon: Icon(
              formIcon,
              color: AppColor.kIconColor,
              size: 2.5.h,
            ),
            // icon: Icon(
            //   formIcon,
            //   color: AppColor.kIconColor,
            //   size: 2.5.h,
            // ),
            suffixIcon: suffixWidget,
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
              borderSide:  const BorderSide(
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
