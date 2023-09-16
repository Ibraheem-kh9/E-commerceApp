import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';

class MainAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final ProductViewModel? userViewModel;
  final String? appbarTitle;

  const MainAppbarWidget(
      {Key? key, this.userViewModel, this.appbarTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: AppColor.kMainColor,
      centerTitle: true,
      title: Text(
        appbarTitle ?? '',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 15.sp,
        ),
      ),
      actionsIconTheme: IconThemeData(size: 15.sp),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55 / 100 * 75);
}
