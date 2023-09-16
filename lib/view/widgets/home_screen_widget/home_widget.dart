import 'package:e_commerce_app/view/widgets/home_screen_widget/custom_all_products_widget.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/custom_home_notification_widget.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/custom_promo_image_widget.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/custom_promo_rate_widget.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/custom_txt_rated_widget.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/search_widget.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/constants/app_routes.dart';
import '../../../view_model/favorite_view_model.dart';


class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductViewModel productViewModel = context.watch<ProductViewModel>();
    FavoriteViewModel favoriteViewModel = context.read<FavoriteViewModel>();
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 1.5.h,
            right: 1.5.h,
            top: 1.h,
            bottom: 2.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //// search widget of home page ----------------------------------
              SearchTxtWidget(
                productViewModel: productViewModel,
                autoFocus: false,
                textInputType: TextInputType.none,
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.searchSc,arguments: productViewModel);
                },
              ),

              const CustomHomeNotificationWidget(),
            ],
          ),
        ),
        //// Widget of Top promo -----------------------------------------------
        CustomPromoImageWidget(productViewModel: productViewModel),
        const CustomTxtRatedWidget(
          text: 'Highest Rated ',
        ),
        //// Widget of the best items rate -------------------------------------
        CustomPromoRateWidget(productViewModel: productViewModel),

        //// Widget of All Products --------------------------------------------
        CustomAllProductsWidget(
          productViewModel: productViewModel,
          favoriteViewModel: favoriteViewModel,
        ),
      ],
    );
  }
}
