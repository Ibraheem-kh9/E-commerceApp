import 'package:e_commerce_app/core/utils/constants/app_routes.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';

class SearchTxtWidget extends StatelessWidget {
  final void Function()? onTap;
  final void Function(String)? onChange;
  final TextInputType? textInputType;
  final ProductViewModel? productViewModel;
  final bool? autoFocus;

  const SearchTxtWidget({
    super.key,
    this.productViewModel,
    this.onTap,
    this.onChange,
    this.textInputType,
    this.autoFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextFormField(
        controller: null,
        onTap: onTap,
        keyboardType: textInputType,
        autofocus: autoFocus!,
        onChanged: onChange,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.backgroundPageViewColor,
          //constraints: BoxConstraints(minHeight: 6.h, maxHeight: 6.h, maxWidth: 42.h),
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
