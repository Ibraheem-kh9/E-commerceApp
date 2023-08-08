import 'package:e_commerce_app/utils/constant_color.dart';
import 'package:e_commerce_app/view/cart_sc.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/animated_search_bar_widget.dart';
import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class AppbarWidget extends StatelessWidget with PreferredSizeWidget {
  final UserViewModel? userViewModel;

  const AppbarWidget({Key? key, this.userViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kMainColor, //const Color.fromRGBO(40, 44, 52, 1),
      title: Text(
        'H-Store',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 23.0),
      ),
      actions: [
        SearchBarAnimationWidget(),

        Padding(
          padding: EdgeInsets.only(right: 10.0, left: 0.0),
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
                    cartNotify.items.length.toString(),
                    style: TextStyle(color: Colors.white),
                  );
                },
              ),
              badgeAnimation: badges.BadgeAnimation.rotation(
                animationDuration: Duration(seconds: 1),
                colorChangeAnimationDuration: Duration(seconds: 1),
                loopAnimation: false,
                curve: Curves.fastOutSlowIn,
                colorChangeAnimationCurve: Curves.easeInCubic,
              ),
              //badgeContent: Text('3'),
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
                  color: kIconColor,
                  size: 25,
                ),
              ),
            ),
          ),
        )
        // IconButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) {
        //           return CartSc();
        //         },
        //       ),
        //     );
        //   },
        //   icon: Icon(
        //     Icons.shopping_cart_rounded,
        //     color: kIconColor,
        //     size: 25,
        //   ),
        // ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
