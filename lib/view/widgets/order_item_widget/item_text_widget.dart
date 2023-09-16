import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemTextWidget extends StatelessWidget {
  final String textName;
  final double fontSize;
  final Color color;

  const ItemTextWidget({
    Key? key,
    required this.textName,
    required this.fontSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.5.h,bottom: 1.5.h),
      child: Text(
        textName,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
