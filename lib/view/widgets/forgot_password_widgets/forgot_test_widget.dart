import 'package:flutter/material.dart';

class ForgotTextWidget extends StatelessWidget {
  final String text;
  final String fontFamily;
  final FontWeight fontWeight;
  final Color color;
  final double size;
  final TextAlign? textAlign;
  const ForgotTextWidget({
    super.key,
    required this.text,
    required this.fontFamily,
    required this.fontWeight,
    required this.color,
    required this.size,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
