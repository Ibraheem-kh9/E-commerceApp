import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PromoRateTextSection extends StatelessWidget {
  final String title;
  const PromoRateTextSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 9.sp,
      ),
      softWrap: true,
      maxLines: 1,
    );
  }
}
