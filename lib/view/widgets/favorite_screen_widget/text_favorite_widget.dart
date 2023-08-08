import 'package:flutter/material.dart';

class TextFavoriteWidget extends StatelessWidget {
  final String favoriteText;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final double? decorThickness;
  final TextOverflow? textOverflow;
  final bool? softWrap;

  const TextFavoriteWidget({
    Key? key,
    required this.favoriteText,
    required this.fontSize,
    required this.fontWeight,
    required this.textColor,
    this.textDecoration,
    this.decorationColor,
    this.decorThickness,
    this.textOverflow,
    this.softWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      favoriteText,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
          decoration: textDecoration,
          decorationColor: decorationColor,
          decorationThickness: decorThickness,
      ),
      overflow: textOverflow,
      softWrap: softWrap,
    );
  }
}
