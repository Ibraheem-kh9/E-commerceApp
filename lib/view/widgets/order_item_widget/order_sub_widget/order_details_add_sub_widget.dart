import 'package:e_commerce_app/view/widgets/order_item_widget/order_sub_widget/btn_action_widget.dart';
import 'package:e_commerce_app/view/widgets/order_item_widget/order_sub_widget/btn_inc_dec_sub_widget.dart';
import 'package:e_commerce_app/view/widgets/order_item_widget/order_sub_widget/qty_change_section.dart';
import 'package:e_commerce_app/view/widgets/order_item_widget/order_sub_widget/total_price_section.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/constants/constant_color.dart';

class OrderDetailsAddSubWidget extends StatelessWidget {
  const OrderDetailsAddSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.h),
      height: 20.h,
      decoration: BoxDecoration(
          color: AppColor.kBackgroundContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.h),
            topRight: Radius.circular(5.h),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TotalPriceSection(price: 1500),
          QtyChangeSection(
            increaseWidget: BtnIncDecWidget(
              onTap: () {},
              icon: Icons.remove,
            ),
            decreaseWidget: BtnIncDecWidget(
              onTap: () {},
              icon: Icons.add,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BtnActionWidget(
                onPressed: () {},
                text: 'Save',
                backgroundColor: AppColor.kBackgroundColor,
                borderColor: AppColor.kMainColor,
                textColor: AppColor.kMainColor,
              ),
              BtnActionWidget(
                onPressed: () {},
                text: 'Order now',
                backgroundColor: AppColor.kMainColor,
                borderColor: AppColor.kMainColor,
                textColor: AppColor.kBackgroundColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
