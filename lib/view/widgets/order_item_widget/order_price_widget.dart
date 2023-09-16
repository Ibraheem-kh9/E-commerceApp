import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/constants/constant_color.dart';

class OrderPriceWidget extends StatelessWidget {
  final int price;
  final int discountPrice;

  const OrderPriceWidget({
    super.key,
    required this.price,
    required this.discountPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.5.h,bottom: 1.5.h,),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$price\$',
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.grey[70],
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.red,
              ),
            ),
            const TextSpan(text: '   '),
            TextSpan(
              text: '  $discountPrice %',
              style: TextStyle(
                letterSpacing: 0.5.w,
                wordSpacing: 0.6.w,
                fontSize: 10.sp,
                color: Colors.white,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
