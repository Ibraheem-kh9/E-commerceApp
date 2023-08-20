import 'package:e_commerce_app/core/utils/constants/app_routes.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/favorite_button_widget.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/image_item_slider_widget.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/search_tx_widget.dart';
import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';
import '../../../view_model/favorite_view_model.dart';
import '../../screens/item_detail_order_sc.dart';

class HomeWidget extends StatelessWidget {
 // final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerState;
 // final ProductViewModel? userViewModel;

  const HomeWidget(
      {Key? key, /*this.userViewModel, this.scaffoldMessengerState*/})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductViewModel userViewModel = context.watch<ProductViewModel>();
    FavoriteViewModel favoriteViewModel = context.read<FavoriteViewModel>();
    return ListView(
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 1.h, bottom: 1.h),
          child: Row(
            children: [
              //// search widget of home page ----------------------------------
               SearchTxtWidget(),
              SizedBox(
                width: 0.4.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.notifications_outlined,
                  size: 20.sp,
                  color: AppColor.kIconColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 74.h,
          child: GridView.builder(
            cacheExtent: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0.5,
              crossAxisSpacing: 0.1.h,
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
                  margin: EdgeInsets.all(0.2.h),
                  decoration: CartViewModel().getSelectedItem() == true
                      ? BoxDecoration(
                          border: Border.all(color: AppColor.kMainColor),
                          gradient: LinearGradient(colors: [
                            AppColor.kMainColor.withOpacity(0.08),
                            AppColor.kMainColor.withOpacity(0.1),
                            AppColor.kMainColor.withOpacity(0.08),
                          ]))
                      : null,
                  child: Stack(
                    children: [
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          // Images Slider for each item -------------------------
                          ImageItemSliderWidget(product: product),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 2.h,
                              right: 2.h,
                              top: 0.5.h,
                              bottom: 3.h,
                            ),
                            child: Text(
                              product.title!.toString(),
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: AppColor.kDefaultTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 30.5.h,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 2.h,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${product.price!.toString()} \$',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.kDescriptionTextColor,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.red,
                                      decorationThickness: 1.5),
                                ),
                                const TextSpan(text: '  '),
                                TextSpan(
                                  text:
                                      '${userViewModel.calcPriceWithPercentage(double.parse(product.price.toString()), product.discountPercentage!.floorToDouble()).toString()} \$',
                                  //'${userViewModel.calcPriceWithPercentage(double.parse(product.price.toString()), product.discountPercentage!.floor()).toString()} \$',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.sp,
                                      color: AppColor.kDefaultTextColor),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                              Container(
                                alignment: Alignment.center,
                                width: 20.w,
                                height: 2.5.h,
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                                child: Text(
                                  '${product.discountPercentage!.floor().toString()} %',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    color: AppColor.kBackgroundColor,
                                  ),
                                ),
                              ),
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
