import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PromoRatePriceSection extends StatelessWidget {
  final int? price;
  const PromoRatePriceSection({super.key , required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$price \$',
      style: TextStyle(
        color: Colors.black,
        fontSize: 12.sp,
      ),
    );
  }
}
