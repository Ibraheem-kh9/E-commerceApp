import 'package:e_commerce_app/utils/constants/constant_color.dart';
import 'package:e_commerce_app/view/screens/cart_sc.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/animated_search_bar_widget.dart';
import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';


class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final ProductViewModel? userViewModel;
  final String appbarTitle;
  const AppbarWidget({Key? key, this.userViewModel,required this.appbarTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).textScaleFactor * 20;
    final width = MediaQuery.of(context).size.width / 100;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.kMainColor, //const Color.fromRGBO(40, 44, 52, 1),
      title: Text(
        appbarTitle,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: fontSize * 1.1),
      ),
      actions: [
        SearchBarAnimationWidget(),

        Padding(
          padding: EdgeInsets.only(right: 1 * width, left: 1 * width),
          child: Align(
            alignment: Alignment.center,
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: 0, end: 0),
              showBadge: true,
              ignorePointer: false,
              //onTap: () {},
              badgeContent: Consumer<CartViewModel>(
                builder: (context, cartNotify, child) {
                  return Text(
                    cartNotify.getCounter().toString(),
                    //cartNotify.productCart.length.toString(),
                    style: const TextStyle(color: Colors.white),
                  );
                },
              ),
              badgeAnimation: const badges.BadgeAnimation.rotation(
                animationDuration: Duration(seconds: 1),
                colorChangeAnimationDuration: Duration(seconds: 1),
                loopAnimation: false,
                curve: Curves.fastOutSlowIn,
                colorChangeAnimationCurve: Curves.easeInCubic,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CartSc();
                      },
                    ),
                  );
                },
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  color: AppColor.kIconColor,
                  size: fontSize * 1.4,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70 / 100 * 75 );
}
