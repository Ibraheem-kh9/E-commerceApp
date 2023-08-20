
import 'package:e_commerce_app/view/screens/cart_sc.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/animated_search_bar_widget.dart';
import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import '../core/utils/constants/constant_color.dart';


class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final ProductViewModel? userViewModel;
  final String appbarTitle;
  const AppbarWidget({Key? key, this.userViewModel,required this.appbarTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).textScaleFactor * 20;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.kMainColor, //const Color.fromRGBO(40, 44, 52, 1),
      title: Text(
        appbarTitle,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: fontSize * 1.0),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55 / 100 * 75 );
}
