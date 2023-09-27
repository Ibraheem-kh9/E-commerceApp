import 'package:e_commerce_app/view/widgets/cart_screen_widget/cart_sub_widget/cart_text_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';
import '../../../view_model/cart_view_model.dart';

class CustomCartSummaryWidget extends StatelessWidget {
  const CustomCartSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    return SizedBox(
      height: 25.h,
      width: double.infinity,
      child: BottomAppBar(
        padding: EdgeInsets.only(
          top: 1.5.h,
          bottom: 1.h,
          right: 1.5.h,
          left: 1.5.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CartTextWidget(
                  text: 'Line Total : ',
                  fontSize: 18.sp,
                  fontColor: AppColor.kGreyColor,
                ),
                CartTextWidget(
                  text: '${cartViewModel.cartSubPrice} \$',
                  fontSize: 16.sp,
                  fontColor: AppColor.kDefaultTextColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CartTextWidget(
                  text: 'Shipping : ',
                  fontSize: 18.sp,
                  fontColor: AppColor.kGreyColor,
                ),
                CartTextWidget(
                  text: '${cartViewModel.shipping} \$',
                  fontSize: 16.sp,
                  fontColor: AppColor.kDefaultTextColor,
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: AppColor.kMainColor,
              endIndent: 2.5.h,
              indent: 2.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CartTextWidget(
                  text: 'Net Total : ',
                  fontSize: 18.sp,
                  fontColor: AppColor.kDefaultTextColor,
                ),
                CartTextWidget(
                  text: '${cartViewModel.cartTotalPrices} \$',
                  fontSize: 17.sp,
                  fontColor: AppColor.kDefaultTextColor,
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColor.kMainColor),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.h)))),
                  minimumSize: MaterialStatePropertyAll(Size(20.h, 5.h)),
                  maximumSize: MaterialStatePropertyAll(Size(20.h, 5.h)),
                ),
                child: Text(
                  'Send Order',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
