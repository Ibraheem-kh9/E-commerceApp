import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CardBrandSection extends StatelessWidget {
  final String brand;
  const CardBrandSection({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Text(
      brand,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 10.sp,
      ),
    );
  }
}
