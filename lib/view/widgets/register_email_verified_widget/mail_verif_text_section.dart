import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RegVerifiedTextSection extends StatelessWidget {
  final String text;
  const RegVerifiedTextSection({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 13.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
