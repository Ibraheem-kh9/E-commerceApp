import 'package:flutter/material.dart';

class CartTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color fontColor;

  const CartTextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }
}
