import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/constants/constant_color.dart';
import 'custom_all_products_widget/item_favorite_button_icon.dart';
import 'promo_higher_rate_sub_widget/promo_rate_image_section.dart';
import 'promo_higher_rate_sub_widget/promo_rate_number_section.dart';
import 'promo_higher_rate_sub_widget/promo_rate_price_section.dart';
import 'promo_higher_rate_sub_widget/promo_rate_text_section.dart';

class CustomPromoRateWidget extends StatelessWidget {
  final ProductViewModel productViewModel;

  const CustomPromoRateWidget({super.key, required this.productViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 80.h,
      margin: EdgeInsets.only(
        bottom: 2.h,
        right: 2.h,
        left: 2.h,
      ),
      padding: EdgeInsets.only(
        top: 2.h,
        bottom: 2.h,
        right: 2.h,
        left: 2.h,
      ),
      decoration: BoxDecoration(
        color: AppColor.backgroundPageViewColor,
        borderRadius: BorderRadius.all(
          Radius.circular(2.h),
        ),
      ),
      child: FutureBuilder(
        future: productViewModel
            .getHighestRateItem(productViewModel.productModelView!),
        builder: (context, snapShoot) {
          if (snapShoot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapShoot.hasData) {
            return GridView.builder(
              cacheExtent: 5.0,
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: productViewModel.highestItemRate.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        PromoRateImageSection(
                          imageUrl: productViewModel.highestItemRate
                              .elementAt(index)
                              .thumbnail!,
                        ),
                        Positioned(
                          bottom: -0.1.h,
                          right: 0.h,
                          child: ItemFavoriteButtonIcon(
                            productId: productViewModel.highestItemRate
                                .elementAt(index).id,
                            productModel: productViewModel.highestItemRate.elementAt(index),
                              ),
                        ),
                      ],
                    ),
                    PromoRateTextSection(
                      title: productViewModel.highestItemRate
                          .elementAt(index)
                          .title!,
                    ),
                    PromoRateNoSection(
                      rate: productViewModel.highestItemRate
                          .elementAt(index)
                          .rating!
                          .toStringAsFixed(1)
                          .toString(),
                    ),
                    PromoRatePriceSection(
                      price: productViewModel.highestItemRate
                          .elementAt(index)
                          .price!,
                    ),
                  ],
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 1.8.h,
                crossAxisSpacing: 1.5.h,
                mainAxisExtent: 17.h,
              ),
            );
          } else if (snapShoot.connectionState == ConnectionState.active) {
            return const Center(child: Text('Already data display'));
          } else if (snapShoot.connectionState == ConnectionState.none) {
            return const Center(child: Text('No Data Found'));
          }
          return const Center(child: Text('Unknown Connection'));
        },
      ),
    );
  }
}
