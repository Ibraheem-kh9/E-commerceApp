import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;
  final double iconSize;
  final Color color;

  const IconButtonWidget({
    Key? key,
    required this.onPress,
    required this.icon,
    required this.iconSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(
        icon,
        size: iconSize,
        color: color,
      ),
    );
  }
}
