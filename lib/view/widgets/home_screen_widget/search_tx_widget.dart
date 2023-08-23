import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';

class SearchTxtWidget extends StatelessWidget {
  const SearchTxtWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.backgroundPageViewColor,
          constraints: BoxConstraints(minHeight: 6.h,maxHeight:6.h,maxWidth: 45.h),
          contentPadding: EdgeInsets.only(top: 1.h),
          hintText: 'What are you looking for?',
          hintStyle: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey,
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 15.sp,
          ),
          enabled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.kMainColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(3.h))),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.kIconColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(3.h))),
          focusColor: AppColor.kIconColor,
        ),
      ),
    );
  }
}
