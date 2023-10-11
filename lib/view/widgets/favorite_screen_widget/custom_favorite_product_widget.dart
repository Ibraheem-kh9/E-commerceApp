import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/view/screens/order_item_sc.dart';
import 'package:e_commerce_app/view/widgets/favorite_screen_widget/custom_favorite_product_widget/fav_card_brand_section.dart';
import 'package:e_commerce_app/view/widgets/favorite_screen_widget/custom_favorite_product_widget/fav_card_price_section.dart';
import 'package:e_commerce_app/view/widgets/favorite_screen_widget/custom_favorite_product_widget/fav_card_title_widget.dart';
import 'package:e_commerce_app/view/widgets/favorite_screen_widget/custom_favorite_product_widget/fav_delete_item_button_icon.dart';
import 'package:e_commerce_app/view/widgets/favorite_screen_widget/custom_favorite_product_widget/fav_item_image_slider_section.dart';
import 'package:e_commerce_app/view_model/favorite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/app_routes.dart';
import '../../../models/products_model.dart';

class CustomFavoriteProductsWidget extends StatelessWidget {
  final List<QueryDocumentSnapshot<Object?>> snapshot;

  const CustomFavoriteProductsWidget({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteViewModel>(
        builder: (context, favoriteNotify, child) {
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
          itemCount: snapshot.length,
          itemBuilder: (context, index1) {
            //ProductModel favoriteProduct = favoriteNotify.favoriteDataList![index1];
            DocumentSnapshot documentSnapshot = snapshot[index1];

            /// set favorite value
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.itemDetailOrderSc,
                    arguments: {documentSnapshot});

                //    Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return OrderItemSc(
                //     product: documentSnapshot as ProductModel,
                //   );
                // }));
              },
              child: Container(
                key: Key('det_$index1'),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(2.5.h))),
                padding: EdgeInsets.only(left: 1.h, right: 1.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        FavItemImageSliderSection(
                            imageUrl: documentSnapshot['thumbnail']),
                        Positioned(
                          bottom: -0.1.h,
                          right: 0.8.h,
                          child: FavDeleteItemButtonIcon(
                            index: snapshot[index1]['id'],
                            // favoriteViewModel: favoriteNotify,
                            // favoriteProduct: favoriteProduct,
                            //  scaffoldMessengerState:
                            //      favoriteViewModel.scaffoldMessengerKey,
                          ),
                        )
                      ],
                    ),
                    FavCardTitleSection(
                      title: documentSnapshot['title'],
                      //title: favoriteProduct.title!.toString(),
                    ),
                    FavCardBrandSection(
                      brand: documentSnapshot['brand'],
                      //brand: snapshot[index1].data()['brand'],
                      //brand: favoriteProduct.brand!,
                    ),

                    FavCardPriceSection(
                      price: documentSnapshot['price'],
                      //  price: favoriteProduct.price!,
                      priceAfterDisc: documentSnapshot['discountPercentage'],
                      //   priceAfterDisc: favoriteProduct.discountPercentage!.toInt(),
                    ),
                    // CustomCardDiscPercWidget(
                    //               percentage:
                    //                   product.discountPercentage!.floor()),
                    // Favorite Button of each Item --------------------

                    // Positioned(
                    //   top: 33.h,
                    //   right: 1.5.h,
                    //   left: 1.5.h,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(left: 0.4.h, right: 0.4.h),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         CustomCardDiscPercWidget(
                    //             percentage:
                    //                 product.discountPercentage!.floor()),
                    //         // Favorite Button of each Item --------------------
                    //         FavoriteButtonWidget(
                    //           itemIndex: index1,
                    //           scaffoldMessengerState:
                    //               favoriteViewModel.scaffoldMessengerKey,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
