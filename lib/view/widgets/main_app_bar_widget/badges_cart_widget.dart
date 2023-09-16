import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../view_model/cart_view_model.dart';

class BadgesCartWidget extends StatelessWidget {
  const BadgesCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -18, end: 2),
      showBadge: true,
      ignorePointer: false,
      badgeStyle: badges.BadgeStyle(
        badgeColor: Colors.transparent,
        padding: EdgeInsets.all(0.6.h),
        borderSide: BorderSide.none,
        elevation: 0,
      ),
      badgeContent: Consumer<CartViewModel>(
        builder: (context, cartNotify, child) {
          return cartNotify.getCounter() > 0
              ? Text(
                  cartNotify.getCounter().toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold),
                )
              : Container();
        },
      ),
      badgeAnimation: const badges.BadgeAnimation.rotation(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      child: Icon(
        Icons.shopping_cart_rounded,
        size: 17.sp,
      ),
    );
  }
}
