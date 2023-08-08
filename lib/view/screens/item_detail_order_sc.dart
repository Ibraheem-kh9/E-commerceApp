import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view/widgets/home_screen_widget/homepage_sc_widget.dart';
import 'package:e_commerce_app/view/widgets/item_order_widget/image_order_slider_widget.dart';
import 'package:e_commerce_app/view/widgets/item_order_widget/item_order_addtocart_button_widget.dart';
import 'package:e_commerce_app/view/widgets/item_order_widget/item_order_qty_widget.dart';
import 'package:e_commerce_app/view/widgets/item_order_widget/item_order_total_price_widget.dart';
import 'package:e_commerce_app/view/widgets/item_order_widget/item_text_widget.dart';
import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:e_commerce_app/view_model/item_detail_view_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../models/favorite_model.dart';
import '../../utils/constants/constant_color.dart';

class ItemDetailOrderSc extends StatelessWidget {
  final Product? product;
  final FavoriteModel? favoriteModel;
  final ProductViewModel? userViewModel;

  const ItemDetailOrderSc(
      {Key? key, this.product, this.userViewModel, this.favoriteModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemMD = context.read<ItemDetailViewModel>();
    return WillPopScope(
      onWillPop: () async {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Warning!',style: TextStyle(fontSize: 20.0,color: AppColor.kMainColor,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              content: Text('Do you want to exit without add Item to Cart?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    itemMD.showWarning(false);
                    //userViewModel!.setItemZero(product!.id!);
                    Navigator.of(context).pop();
                  },
                  child: Text('No'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(AppColor.kMainColor.withOpacity(0.7)),
                    fixedSize: MaterialStatePropertyAll(Size(100.0, 20.0)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),

                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    itemMD.showWarning(true);
                    Navigator.pop(context);

                    //userViewModel!.setItemZero(product!.id!);
                  },
                  child: Text('Yes'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(AppColor.kMainColor),
                    fixedSize: MaterialStatePropertyAll(Size(100.0, 20.0)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),

                      ),
                    ),
                  ),
                ),
              ],
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.kMainColor, width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              actionsAlignment: MainAxisAlignment.spaceEvenly,
            );
          },
        );
        if (itemMD.isWarningVisible == false) {
          return false;
        } else {
          itemMD.resetWillPopClicking();
          return true;
        }
        // return false;
        // userViewModel!.setItemZero(product!.id!);
      },
      child: Scaffold(
        backgroundColor: AppColor.kBackgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              // Order Images Slider----------------------------------------------
              Positioned.fill(
                top: 0.0,
                bottom: 53.h,
                child: ImagesOrderWidget(product: product!),
              ),
              Positioned(
                top: 0.0.h,
                //bottom: 20.h,
                left: 1.w,
                child: IconButton(
                  onPressed: () {
                    userViewModel!.setItemZero(product!.id!);
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.amber,
                    size: 3.5.h,
                  ),
                ),
              ),
              Positioned.fill(
                top: 46.h,
                left: 4.w,
                child: ItemTextWidget(
                  textName: product!.title!,
                  fontSize: 15.sp,
                  color: AppColor.kDefaultTextColor,
                ),
              ),
              Positioned.fill(
                top: 51.h,
                left: 6.w,
                right: 6.w,
                child: ItemTextWidget(
                  textName: product!.description.toString(),
                  fontSize: 10.sp,
                  color: AppColor.kDescriptionTextColor,
                ),
              ),
              Positioned.fill(
                top: 60.h,
                left: 4.w,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '${userViewModel!.calcPriceWithPercentage(product!.price!.toDouble(), product!.discountPercentage!.floorToDouble())}\$',
                        //'${userViewModel!.calcPriceWithPercentage(product!.price!, product!.discountPercentage!.floor())}\$',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.kDefaultTextColor,
                        ),
                      ),
                      const TextSpan(text: '  '),
                      TextSpan(
                        text: '${product!.price}\$',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.grey[70],
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red,
                        ),
                      ),
                      const TextSpan(text: '   '),
                      TextSpan(
                        text: '  ${product!.discountPercentage!.toInt()} %',
                        style: TextStyle(
                          letterSpacing: 0.5.w,
                          wordSpacing: 0.6.w,
                          fontSize: 10.sp,
                          color: Colors.white,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                top: 35.h,
                left: 3.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 20.sp,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 3.3.h,
                      height: 3.3.h,
                      decoration: BoxDecoration(
                          color: AppColor.kMainColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.w))),
                      child: RatingBar.builder(
                        itemSize: 17.sp,
                        itemCount: 1,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.5.h),
                        initialRating: product!.rating!,
                        allowHalfRating: true,
                        maxRating: 5,
                        minRating: 1,
                        itemBuilder: (context, idx) {
                          return Text(
                            product!.rating!.toStringAsFixed(1).toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15.sp),
                          );
                        },
                        onRatingUpdate: (double rating) {
                          /// TODO: add Rating Dialog for each item
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //// Increase or Decrease Qty of item in order----------------------
              Positioned.fill(
                top: 58.h,
                bottom: 1.h,
                child: ItemOrderQtyWidget(product: product!),
              ),
              Positioned.fill(
                top: 64.h,
                child: Divider(
                  color: AppColor.kMainColor,
                  endIndent: 18.w,
                  indent: 20.w,
                  thickness: 2,
                ),
              ),
              Positioned.fill(
                bottom: 3.h,
                child: Container(
                  margin: EdgeInsets.only(left: 3.w, right: 3.w),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //// Total Price for each item in order---------------------
                      ItemOrderTotalPriceWidget(
                        product: product!,
                      ),
                      //// Add Item To Cart Widget--------------------------------
                      ItemOrderAddToCartWidget(product: product!),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
