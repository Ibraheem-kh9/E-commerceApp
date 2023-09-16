import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/constants/constant_color.dart';

class QtyChangeSection extends StatelessWidget {
  final Widget increaseWidget;
  final Widget decreaseWidget;
  const QtyChangeSection({super.key, required this.increaseWidget, required this.decreaseWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: 4.h,
      width: 30.h,
      alignment: Alignment.center,
      transformAlignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
          color: AppColor.kGreyColor,
          borderRadius: BorderRadius.all(Radius.circular(4.h))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          increaseWidget,
          Text(
            '1',
            style: TextStyle(
                fontSize: 18.sp, color: AppColor.kBackgroundContainer),
          ),
          decreaseWidget,
        ],
      ),
    );
  }
}
