import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/custom_card_disc_perc_widget.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/custom_card_price_widget.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/custom_card_title_widget.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/custom_home_notification_widet.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/favorite_button_widget.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/image_item_slider_widget.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/search_tx_widget.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/constants/constant_color.dart';
import '../../../view_model/favorite_view_model.dart';
import '../../screens/item_detail_order_sc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductViewModel userViewModel = context.watch<ProductViewModel>();
    FavoriteViewModel favoriteViewModel = context.read<FavoriteViewModel>();
    return ListView(
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 1.h, bottom: 1.h),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //// search widget of home page ----------------------------------
              SearchTxtWidget(),

              CustomHomeNotificationWidget(),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 2.h, right: 2.h),
          height: 80.h,
          child: GridView.builder(
            cacheExtent: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1.h,
              crossAxisSpacing: 1.h,
              mainAxisExtent: 38.h,
            ),
            itemCount: userViewModel.productModelView?.products?.length,
            itemBuilder: (context, index1) {
              Product product =
                  userViewModel.productModelView!.products![index1];
              return GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, AppRoute.itemDetailOrderSc,arguments: {
                  //         product: product,
                  //         userViewModel: userViewModel,
                  //     });

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ItemDetailOrderSc(
                      product: product,
                      userViewModel: userViewModel,
                    );
                  }));
                },
                child: Container(
                  key: Key('det_$index1'),
                  decoration: BoxDecoration(
                    color: AppColor.backgroundPageViewColor,
                    borderRadius: BorderRadius.all(Radius.circular(2.h)),
                  ),
                  child: Stack(
                    children: [
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          // Images Slider for each item -------------------------
                          ImageItemSliderWidget(product: product),
                          CustomCardTitleWidget(
                            title: product.title!.toString(),
                          ),
                        ],
                      ),
                      CustomCardPriceWidget(
                        price: product.price!,
                        priceAfterDisc: userViewModel.calcPriceWithPercentage(
                            double.parse(product.price.toString()),
                            product.discountPercentage!.floorToDouble()),
                      ),
                      Positioned(
                        top: 33.h,
                        right: 1.5.h,
                        left: 1.5.h,
                        child: Padding(
                          padding: EdgeInsets.only(left: 0.4.h, right: 0.4.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomCardDiscPercWidget(
                                  percentage:
                                      product.discountPercentage!.floor()),
                              // Favorite Button of each Item --------------------
                              FavoriteButtonWidget(
                                itemIndex: index1,
                                scaffoldMessengerState:
                                    favoriteViewModel.scaffoldMessengerKey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
