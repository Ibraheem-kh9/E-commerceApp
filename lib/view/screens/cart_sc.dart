import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/view/widgets/cart_screen_widget/custom_cart_items_widget.dart';
import 'package:e_commerce_app/view/widgets/cart_screen_widget/custom_cart_list_length_widget.dart';
import 'package:e_commerce_app/view/widgets/cart_screen_widget/custom_cart_summary_widget.dart';
import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../core/utils/constants/constant_color.dart';
import '../widgets/main_app_bar_widget/main_appbar_widget.dart';

class CartSc extends StatelessWidget {
  const CartSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocale localeLang = AppLocale.of(context);

    return Scaffold(
      backgroundColor: AppColor.kBackgroundColor,
      appBar: const MainAppbarWidget(appbarTitle: 'My Cart'),
      body: SafeArea(
        child: context.watch<CartViewModel>().addItemToCart.isEmpty
            ? Center(
              child: Lottie.asset(
                  'assets/lottie_files/cart empty.json',
                  repeat: false,
                  width: 40.w,
                  height: 40.h,
                ),
            )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomCartListLengthWidget(),
                  Divider(
                    indent: 2.h,
                    endIndent: 2.h,
                    color: AppColor.kIconColor,
                  ),
                  //// Widget of item added to cart ----------------------------------
                  CustomCartItemsWidget(),
                  // cartViewModel.counter != 0
                  //     ? CustomCartSummaryWidget()
                  //     : Container(),
                ],
              ),
      ),
      bottomSheet: context.watch<CartViewModel>().addItemToCart.isNotEmpty
          ? CustomCartSummaryWidget()
          : null,
    );
  }
}
