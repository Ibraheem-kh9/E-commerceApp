import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/utils/constants/app_routes.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view/main_appbar_widget.dart';
import 'package:e_commerce_app/view/widgets/secondary_appbar_widget.dart';
import 'package:e_commerce_app/view_model/item_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../core/utils/constants/constant_color.dart';
import '../../view_model/item_category_view_model.dart';

class CategoryItemOrderSc extends StatelessWidget {
  final Product? product;
  final String? categoryItemName;
  const CategoryItemOrderSc({Key? key, this.product, this.categoryItemName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemCatViewModel =
        Provider.of<ItemCategoryViewModel>(context, listen: true);
    //  Product data = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: SecondaryAppbarWidget(
        appbarLeading: categoryItemName,
        appbarTitle: product!.brand,
      ),
      backgroundColor: AppColor.kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Order Images Slider----------------------------------------------
            CarouselSlider.builder(
              itemCount: product!.images!.length,
              itemBuilder: (context, index, i) {
                return CachedNetworkImage(
                  imageUrl: product!.images![index],
                  fit: BoxFit.cover,
                  errorWidget: (context, image, dynamic) {
                    return Image.asset(
                      'assets/images/no_image_available.jpg',
                    );
                  },
                );
              },
              options: CarouselOptions(
                onPageChanged: (idx, _) {
                  itemCatViewModel.setImageIndex(idx);
                },
                viewportFraction: 1,
                initialPage: context.read<ItemCategoryViewModel>().currentIdx,
                enableInfiniteScroll: false,
                enlargeFactor: 0.2,
                height: 44.h,
                autoPlay: false,
                // enlargeCenterPage: true,
              ),
            ),
            Consumer<ItemCategoryViewModel>(
              builder: (context, notify, child) {
                return Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    ...List.generate(
                      product!.images!.length,
                      (index) => Container(
                        decoration: BoxDecoration(
                          color: notify.currentIdx != index
                              ? AppColor.kMainColor
                              : AppColor.kIconColor,
                          shape: BoxShape.circle,
                        ),
                        margin: EdgeInsets.all(10),
                        height: 1.h,
                        width: 1.h,
                      ),
                    )
                  ],
                );
              },
            ),

            Padding(
              padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top:0),
              //padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 2.h),
              child: Text(
                product!.brand!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 0),
              //padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 2.h),
              child: Text(
                product!.title!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 0),
              //padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 3.h),
              child: Text(
                product!.description!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black87,
                ),
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                top: 2.h,
              ),
              padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h),
              height: 7.h,
              decoration:
                  const BoxDecoration(color: AppColor.backgroundPageViewColor),
              child: Text(
                '${product!.price!} \$',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.5.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 2.h,right: 2.h),
              height: 9.h,
              decoration: BoxDecoration(
                color: AppColor.backgroundPageViewColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(AppColor.kMainColor),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1.h)))),
                      fixedSize: MaterialStateProperty.all(Size(39.h, 4.h))
                    ),
                      child: Text('Add To Cart',style: TextStyle(fontSize: 12.sp),),
                  ),
                  ElevatedButton(
                      onPressed: (){

                      },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                      elevation: const MaterialStatePropertyAll(0),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(side: const BorderSide(color: AppColor.kMainColor),borderRadius: BorderRadius.all(Radius.circular(1.h)))),
                      fixedSize: MaterialStateProperty.all(Size(0.5.h, 4.h))
                    ),
                      child: Icon(Icons.favorite,color: Colors.grey,size: 18.sp,),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:e_commerce_app/models/cart_model.dart';
// import 'package:e_commerce_app/models/products_model.dart';
// import 'package:e_commerce_app/view/widgets/item_order_widget/image_order_slider_widget.dart';
// import 'package:e_commerce_app/view/widgets/item_order_widget/item_text_widget.dart';
// import 'package:e_commerce_app/view_model/cart_view_model.dart';
// import 'package:e_commerce_app/view_model/product_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
//
// import '../models/favorite_model.dart';
// import '../utils/constant_color.dart';
//
// class ItemDetailOrderSc extends StatelessWidget {
//   final Product? product;
//   final FavoriteModel? favoriteModel;
//   final UserViewModel? userViewModel;
//
//   const ItemDetailOrderSc(
//       {Key? key, this.product, this.userViewModel, this.favoriteModel})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var cartViewModel = context.watch<CartViewModel>();
//     return Scaffold(
//       backgroundColor: AppColor.kBackgroundColor,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Order Images Slider----------------------------------------------
//             Positioned.fill(
//               top: 0.0,
//               bottom: 53.h,
//               child: ImagesOrderWidget(product: product!),
//             ),
//             Positioned.fill(
//               top: 46.h,
//               left: 4.w,
//               child: ItemTextWidget(
//                 textName: product!.title!,
//                 fontSize: 15.sp,
//                 color: AppColor.kDefaultTextColor,
//               ),
//             ),
//             Positioned.fill(
//               top: 51.h,
//               left: 6.w,
//               right: 6.w,
//               child: ItemTextWidget(
//                 textName: product!.description.toString(),
//                 fontSize: 10.sp,
//                 color: AppColor.kDescriptionTextColor,
//               ),
//             ),
//             Positioned.fill(
//               top: 60.h,
//               left: 4.w,
//               child: Text.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                       text:
//                       '${userViewModel!.calcPriceWithPercentage(product!.price!, product!.discountPercentage!.floor())}\$',
//                       style: TextStyle(
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.bold,
//                         color: AppColor.kDefaultTextColor,
//                       ),
//                     ),
//                     const TextSpan(text: '  '),
//                     TextSpan(
//                       text: '${product!.price}\$',
//                       style: TextStyle(
//                         fontSize: 11.sp,
//                         color: Colors.grey[70],
//                         decoration: TextDecoration.lineThrough,
//                         decorationColor: Colors.red,
//                       ),
//                     ),
//                     const TextSpan(text: '   '),
//                     TextSpan(
//                       text: '  ${product!.discountPercentage!.toInt()} %',
//                       style: TextStyle(
//                         letterSpacing: 0.5.w,
//                         wordSpacing: 0.6.w,
//                         fontSize: 10.sp,
//                         color: Colors.white,
//                         backgroundColor: Colors.red,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned.fill(
//               top: 35.h,
//               left: 3.w,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.star,
//                     size: 20.sp,
//                     color: Colors.amber,
//                   ),
//                   SizedBox(
//                     width: 2.w,
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     width: 3.3.h,
//                     height: 3.3.h,
//                     decoration: BoxDecoration(
//                         color: AppColor.kMainColor,
//                         borderRadius: BorderRadius.all(Radius.circular(10.w))),
//                     child: RatingBar.builder(
//                       itemSize: 17.sp,
//                       itemCount: 1,
//                       itemPadding: EdgeInsets.symmetric(horizontal: 0.5.h),
//                       initialRating: product!.rating!,
//                       allowHalfRating: true,
//                       maxRating: 5,
//                       minRating: 1,
//                       itemBuilder: (context, idx) {
//                         return Text(
//                           product!.rating!.toStringAsFixed(1).toString(),
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                               fontSize: 15.sp),
//                         );
//                       },
//                       onRatingUpdate: (double rating) {
//                         /// TODO: add Rating Dialog for each item
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned.fill(
//               top: 58.h,
//               bottom: 1.h,
//               child: SizedBox(
//                 height: 8.h,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         cartViewModel.itemQuantity <= 0
//                             ? null
//                             : cartViewModel.itemQtyDecrease();
//                         cartViewModel.itemTotalPriceIncrease(userViewModel!
//                             .calcPriceWithPercentage(product!.price!,
//                             product!.discountPercentage!.floor()));
//                       },
//                       icon: Icon(
//                         Icons.remove_circle_outline,
//                         size: 5.h,
//                         color: cartViewModel.itemQuantity <= 0
//                             ? Colors.grey
//                             : AppColor.kMainColor,
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.center,
//                       child: Consumer<CartViewModel>(
//                         builder: (context, cartNotify, child) {
//                           return Text(
//                             cartNotify.itemQuantity.toString(),
//                             style:
//                             TextStyle(fontSize: 30.sp, color: Colors.black),
//                           );
//                         },
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         cartViewModel.itemQtyIncrease();
//                         cartViewModel.itemTotalPriceIncrease(userViewModel!
//                             .calcPriceWithPercentage(product!.price!,
//                             product!.discountPercentage!.floor()));
//                       },
//                       icon: Icon(
//                         Icons.add_circle,
//                         size: 5.h,
//                         color: AppColor.kMainColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned.fill(
//               top: 64.h,
//               child: Divider(
//                 color: AppColor.kMainColor,
//                 endIndent: 18.w,
//                 indent: 20.w,
//                 thickness: 2,
//               ),
//             ),
//             Positioned.fill(
//               bottom: 3.h,
//               child: Container(
//                 margin: EdgeInsets.only(left: 3.w, right: 3.w),
//                 alignment: Alignment.bottomCenter,
//                 //height: 50.h,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Consumer<CartViewModel>(
//                         builder: (context, cartNotify, child) {
//                           return Text.rich(
//                             TextSpan(children: [
//                               TextSpan(
//                                   text: 'Price : ',
//                                   style: TextStyle(
//                                     color: AppColor.kMainColor,
//                                     fontSize: 20.sp,
//                                     fontWeight: FontWeight.bold,
//                                   )),
//                               TextSpan(
//                                 text: cartNotify.totalPrice.toString(),
//                                 style: TextStyle(
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               )
//                             ]),
//                             textAlign: TextAlign.center,
//                           );
//                         }),
//                     Consumer<CartViewModel>(
//                       builder: (context, cartNotify, child) {
//                         return ElevatedButton(
//                           onPressed: () async {
//                             CartModel cartItem = CartModel(
//                               itemName: product!.title,
//                               itemImage: product!.images!.first,
//                               itemPrice: product!.price,
//                               itemQty: cartNotify.itemQuantity,
//                               itemTotalPrices: cartNotify
//                                   .itemTotalPriceIncrease(product!.price),
//                             );
//                             //cartNotify.saveCart();
//                             cartNotify.addItem(cartItem);
//                             cartNotify.setItemZero();
//                             cartNotify.setTotalPriceToZero();
//                             Navigator.pop(context);
//                           },
//                           style: ButtonStyle(
//                             backgroundColor:
//                             MaterialStateProperty.all(AppColor.kMainColor),
//                             shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                   borderRadius:
//                                   BorderRadius.all(Radius.circular(20.h))),
//                             ),
//                             minimumSize:
//                             MaterialStateProperty.all(Size(38.w, 5.7.h)),
//                             maximumSize:
//                             MaterialStateProperty.all(Size(38.w, 5.7.h)),
//                             //fixedSize: MaterialStateProperty.all(Size(60.0, 30.0))
//                           ),
//                           child: Text(
//                             'Add To Cart',
//                             style: TextStyle(fontSize: 12.sp),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

///////////////////////////////////////////////

/*
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../utils/constant_color.dart';

class ItemDetailOrderSc extends StatelessWidget {
  final Product product;
  final UserViewModel userViewModel;

  const ItemDetailOrderSc(
      {Key? key, required this.product, required this.userViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColor,
      //backgroundColor: Color.fromRGBO(124, 165, 184, 0.65),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30.0))),
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: CarouselSlider.builder(
                  itemCount: product.images!.length,
                  itemBuilder: (context, index, _) {
                    return Image.network(
                      product.images![index],
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, Object exception, StackTrace? stackTrace) {
                        return Image.asset(
                          'assets/images/no_image_available.jpg',
                        );
                      },
                    );
                  },
                  options: CarouselOptions(
                    initialPage: 1,
                    enableInfiniteScroll: false,
                    //animateToClosest: false,
                    enlargeFactor: 0.2,
                    //disableCenter: true,
                    height: 400,
                    autoPlay: false,
                    enlargeCenterPage: true,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 20.0),
              child: Text(
                product.title!,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 18.0,
                top: 10.0,
              ),
              child: Text(
                product.description.toString(),
                style: TextStyle(fontSize: 15.0, color: Colors.black54),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text.rich(TextSpan(children: [
                //TextSpan(text: 'Price :'),
                TextSpan(
                    text:
                    '${userViewModel.calcPriceWithPercentage(product.price!, product.discountPercentage!.floor())}\$',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                TextSpan(text: '  '),
                TextSpan(
                  text: '${product.price}\$',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[70],
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.red,
                  ),
                ),
                TextSpan(text: '   '),
                TextSpan(
                  text: '  ${product.discountPercentage!.toInt()} %   ',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      backgroundColor: Colors.red
                  ),
                ),
              ])),
            ),
            //Text(product.rating.toString()),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 20.0, bottom: 15.0),
              child: RatingBar.builder(
                  itemSize: 25,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  initialRating: product.rating!,
                  allowHalfRating: true,
                  //maxRating: 6.0,
                  minRating: 1,
                  // Text(product.rating.toString())
                  itemBuilder: (context, idx) {
                    return Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  },
                  onRatingUpdate: (double rating) {
                    print(rating);
                  }),
            ),

            Container(
              height: 80.0,
              decoration: BoxDecoration(
                //color: Color(0xFF9695DA),
                //border: Border(bottom: BorderSide(color: Colors.black,),top: BorderSide.none,right: BorderSide.none,left: BorderSide.none),
                //borderRadius: BorderRadius.all(Radius.circular(50.0))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove_circle_outline,
                      size: 40.0,
                      color: Color(0xFF3C3AA6),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(text: '2'),
                        style: TextStyle(fontSize: 40.0, color: Colors.black),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle,
                        size: 40,
                        color: Color(0xFF3C3AA6),
                      )),
                ],
              ),
            ),
            Divider(
              color: Color(0xFF3C3AA6),
              endIndent: 75.0,
              indent: 75.0,
              thickness: 2,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0,right: 10.0),
              alignment: Alignment.bottomCenter,
              height: 130.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: 'Price : ',
                          style: TextStyle(
                            color: Color(0xFF3C3AA6),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(text: '00.00',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold))
                    ]),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Add To Cart',
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Color(0xFF3C3AA6)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0))),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(150.0, 50.0)),
                      maximumSize: MaterialStateProperty.all(Size(150.0, 60.0)),
                      //fixedSize: MaterialStateProperty.all(Size(60.0, 30.0))
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/
