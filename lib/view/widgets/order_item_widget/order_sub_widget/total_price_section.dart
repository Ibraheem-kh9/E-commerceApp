import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/constants/constant_color.dart';

class TotalPriceSection extends StatelessWidget {
  final int price;
  const TotalPriceSection({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Total: ',
            style: TextStyle(
              fontSize: 15.sp,
              color: AppColor.kMainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ' $price \$',
            style: TextStyle(
              color: AppColor.kGreyColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          )
        ],
      ),

    );
  }
}
