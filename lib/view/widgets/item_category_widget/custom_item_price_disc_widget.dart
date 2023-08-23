import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomItemPriceDiscWidget extends StatelessWidget {
  final int price;
  final int discount;
  const CustomItemPriceDiscWidget({super.key, required this.price, required this.discount});

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
            '$discount %',
            style: TextStyle(color: Colors.white,fontSize: 11.sp),
          ),
        ),
      ],
    );
  }
}
