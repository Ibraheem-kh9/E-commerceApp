import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';

class CustomCardPriceWidget extends StatelessWidget {
  final int? price;
  final int? priceAfterDisc;

  const CustomCardPriceWidget(
      {super.key, required this.price, required this.priceAfterDisc});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30.5.h,
      child: Padding(
        padding: EdgeInsets.only(
          left: 2.h,
        ),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$price \$',
                style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kDescriptionTextColor,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.red,
                    decorationThickness: 1.5),
              ),
              const TextSpan(text: '  '),
              TextSpan(
                text: '$priceAfterDisc \$',
                //'${userViewModel.calcPriceWithPercentage(double.parse(product.price.toString()), product.discountPercentage!.floor()).toString()} \$',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                    color: AppColor.kDefaultTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
