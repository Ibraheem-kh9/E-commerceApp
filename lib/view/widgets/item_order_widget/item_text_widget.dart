import 'package:flutter/material.dart';

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
    return Text(
      textName,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
