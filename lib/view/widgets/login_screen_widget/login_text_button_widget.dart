import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../components/app_local.dart';

class LoginTextButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String? text;
  final double? size;
  final Color? color;
  final ButtonStyle? style;
  const LoginTextButtonWidget({
    super.key,
    required this.onPress,
    this.text,
    this.size,
    this.color,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: style,
      child: Text(
        text!,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
