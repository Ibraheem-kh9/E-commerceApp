import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:e_commerce_app/view_model/favorite_view_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../models/products_model.dart';
import '../../screens/order_item_sc.dart';
import 'custom_all_products_widget/card_brand_section.dart';
import 'custom_all_products_widget/card_price_section.dart';
import 'custom_all_products_widget/custom_card_title_widget.dart';
import 'custom_all_products_widget/item_favorite_button_icon.dart';
import 'custom_all_products_widget/item_image_slider_section.dart';

class CustomAllProductsWidget extends StatelessWidget {
  final ProductViewModel productViewModel;
  final FavoriteViewModel favoriteViewModel;

  const CustomAllProductsWidget(
      {super.key,
      required this.productViewModel,
      required this.favoriteViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 1.h, right: 1.h),
      height: 80.h,
      child: GridView.builder(
        padding: EdgeInsets.all(1.5.h),
        physics: const ClampingScrollPhysics(),
        cacheExtent: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1.h,
          crossAxisSpacing: 1.h,
          mainAxisExtent: 38.h,
        ),
        itemCount: productViewModel.productModelView?.length,
        itemBuilder: (context, index1) {
          ProductModel product = productViewModel.productModelView![index1];

          /// set favorite value
          favoriteViewModel.favoriteData[product.id] == product.favorite;
          return GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, AppRoute.itemDetailOrderSc,arguments: {
              //         product: product,
              //         userViewModel: userViewModel,
              //     });

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OrderItemSc(
                  index: index1,
                  product: product,
                  productViewModel: productViewModel,
                );
              }));
            },
            child: Container(
              key: Key('det_$index1'),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  border: context
                      .watch<CartViewModel>()
                      .setIsAddedStatus(id: product.id),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(2.5.h))),
              padding: EdgeInsets.only(left: 1.h, right: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ItemImageSliderSection(imageUrl: product.thumbnail!),
                      Positioned(
                        bottom: -0.1.h,
                        right: 0.8.h,
                        child: ItemFavoriteButtonIcon(
                          productId: product.id,
                          productModel: product,
                          //  scaffoldMessengerState:
                          //      favoriteViewModel.scaffoldMessengerKey,
                        ),
                      )
                    ],
                  ),
                  CardTitleSection(
                    title: product.title!.toString(),
                  ),
                  CardBrandSection(
                    brand: productViewModel.productModelView![index1].brand!,
                  ),

                  CardPriceSection(
                    price: product.price!,
                    priceAfterDisc: product.discountPercentage!.toInt(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
