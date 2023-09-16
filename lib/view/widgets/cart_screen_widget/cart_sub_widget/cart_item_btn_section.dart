import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartItemBtnSection extends StatelessWidget {
  final void Function()? onPress;
  final IconData iconData;
  final Color iconColor;

  const CartItemBtnSection({
    super.key,
    required this.onPress,
    required this.iconData,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(
        iconData,
        color: iconColor,
        size: 12.sp,
      ),
    );
  }
}
