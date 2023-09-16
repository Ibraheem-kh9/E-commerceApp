import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';
import '../../../view_model/cart_view_model.dart';

class CustomCartListLengthWidget extends StatelessWidget {
  const CustomCartListLengthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(builder: (context, notify, child) {
      return Padding(
        padding: EdgeInsets.only(
          right: 2.h,
          left: 2.h,
          top: 1.h,
        ),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Items Added : ',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColor.kIconColor,
                ),
              ),
              TextSpan(
                text: notify.addItemToCart.length.toString(),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColor.kMainColor,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
