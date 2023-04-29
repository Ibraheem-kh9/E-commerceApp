import 'package:e_commerce_app/utils/constant_color.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/animated_search_bar_widget.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget with PreferredSizeWidget {
  final UserViewModel userViewModel;
  const AppbarWidget({Key? key,required this.userViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kMainColor,//const Color.fromRGBO(40, 44, 52, 1),
      title: Text(
        'H-Store',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 23.0),
      ),
      actions: [
        SearchBarAnimationWidget(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart_rounded,
            color: Colors.yellowAccent,
            size: 25,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
