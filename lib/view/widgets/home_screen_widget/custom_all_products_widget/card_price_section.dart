import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/constants/constant_color.dart';

class CardPriceSection extends StatelessWidget {
  final int? price;
  final int? priceAfterDisc;

  const CardPriceSection(
      {super.key, required this.price, required this.priceAfterDisc});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$price \$',
          style: TextStyle(
            color: Colors.black,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 0.5.h),
          alignment: FractionalOffset.centerRight,
          width: 7.h,
          decoration: BoxDecoration(
            color: Color(0xFFFF0000),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.h),
              bottomLeft: Radius.circular(20.h),),),
          child: Text(
            '$priceAfterDisc \$',
            style: TextStyle(color: Colors.white,fontSize: 11.sp),
          ),
        ),
      ],
    );

    // return Positioned(
    //   top: 30.5.h,
    //   child: Padding(
    //     padding: EdgeInsets.only(
    //       left: 2.h,
    //     ),
    //     child: RichText(
    //       text: TextSpan(
    //         children: [
    //           TextSpan(
    //             text: '$price \$',
    //             style: TextStyle(
    //                 fontSize: 10.sp,
    //                 fontWeight: FontWeight.bold,
    //                 color: AppColor.kDescriptionTextColor,
    //                 decoration: TextDecoration.lineThrough,
    //                 decorationColor: Colors.red,
    //                 decorationThickness: 1.5),
    //           ),
    //           const TextSpan(text: '  '),
    //           TextSpan(
    //             text: '$priceAfterDisc \$',
    //             //'${userViewModel.calcPriceWithPercentage(double.parse(product.price.toString()), product.discountPercentage!.floor()).toString()} \$',
    //             style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 10.sp,
    //                 color: AppColor.kDefaultTextColor),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
