import 'package:e_commerce_app/view/screens/cart_sc.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/animated_search_bar_widget.dart';
import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/constants/constant_color.dart';


class SecondaryAppbarWidget extends StatelessWidget implements PreferredSizeWidget {

  final String? appbarLeading;
  final String? appbarTitle;

  const SecondaryAppbarWidget(
      {Key? key, this.appbarLeading, this.appbarTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,

      backgroundColor: AppColor.kMainColor,
      leading: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
            child: Icon(Icons.arrow_back,size: 15.sp,),),
          ),
          Expanded(
            flex: 3,
            child: Text(
              appbarLeading ?? '',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 11.sp),
            ),
          ),
        ],
      ),
      centerTitle: true,
      leadingWidth: 14.h,
      title: Text(
        appbarTitle ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15.sp),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
      ],
      actionsIconTheme: IconThemeData(size: 15.sp),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55 / 100 * 75);
}
