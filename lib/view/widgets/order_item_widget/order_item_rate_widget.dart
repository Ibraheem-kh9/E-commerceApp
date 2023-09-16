import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';

class OrderItemRateWidget extends StatelessWidget {
  final double rate;
  final String rateFixing;
  const OrderItemRateWidget({super.key, required this.rate, required this.rateFixing});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 20.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            size: 20.sp,
            color: Colors.amber,
          ),
          SizedBox(
            width: 2.w,
          ),
          Container(
            alignment: Alignment.center,
            width: 3.3.h,
            height: 3.3.h,
            decoration: BoxDecoration(
                color: AppColor.kMainColor,
                borderRadius:
                BorderRadius.all(Radius.circular(10.w))),
            child: RatingBar.builder(
              itemSize: 17.sp,
              itemCount: 1,
              itemPadding: EdgeInsets.symmetric(horizontal: 0.5.h),
              initialRating: rate,
              allowHalfRating: true,
              maxRating: 5,
              minRating: 1,
              itemBuilder: (context, idx) {
                return Text(
                  rateFixing.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15.sp),
                );
              },
              onRatingUpdate: (double rating) {
                /// TODO: add Rating Dialog for each item
              },
            ),
          ),
        ],
      ),
    );
  }
}
