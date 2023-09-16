import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';
import '../../../view_model/item_detail_view_model.dart';

class OrderImageListWidget extends StatelessWidget {
  final int imageLength;
  const OrderImageListWidget({super.key, required this.imageLength});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemDetailsViewModel>(builder: (context, notify, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            imageLength,
                (index) => Container(
              decoration: BoxDecoration(
                color: notify.currentIdx != index
                    ? AppColor.kMainColor
                    : AppColor.kIconColor,
                shape: BoxShape.circle,
              ),
              margin: EdgeInsets.all(1.h),
              height: 1.h,
              width: 1.h,
            ),
          )
        ],
      );
    });
  }
}
