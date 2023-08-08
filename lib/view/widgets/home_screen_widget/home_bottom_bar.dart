import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/constant_color.dart';

class HomeBottomBarWidget extends StatelessWidget {
  final ProductViewModel userViewModel;
  const HomeBottomBarWidget({Key? key,required this.userViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocale appTrans = AppLocale.of(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: AppColor.kIconColor,
      backgroundColor: AppColor.kMainColor,
      unselectedItemColor: Colors.white,
      currentIndex: userViewModel.currentIndexBar,
      onTap: (int idx) {
        userViewModel.selectedScreenBar(userViewModel.currentIndexBar = idx);
      },
      items: [
        BottomNavigationBarItem(icon: (Icon(Icons.home)), label: appTrans.getTranslated('main_sc_navigator_bottom_home')),
        BottomNavigationBarItem(
            icon: (Icon(Icons.favorite)), label:  appTrans.getTranslated('main_sc_navigator_bottom_favorite')),
        BottomNavigationBarItem(
            icon: (Icon(Icons.shopping_cart_rounded)), label:  appTrans.getTranslated('cart_title')),
        BottomNavigationBarItem(
            icon: (Icon(Icons.category)), label:  appTrans.getTranslated('main_sc_navigator_bottom_category')),
        BottomNavigationBarItem(
            icon: (Icon(Icons.more_horiz)), label:  appTrans.getTranslated('main_sc_navigator_bottom_setting')),
      ],
    );
  }
}
