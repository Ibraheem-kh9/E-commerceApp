// import 'package:e_commerce_app/models/products_model.dart';
// import 'package:e_commerce_app/view_model/favorite_view_model.dart';
// import 'package:e_commerce_app/view_model/item_detail_view_model.dart';
// import 'package:e_commerce_app/view_model/order_item_view_model.dart';
// import 'package:e_commerce_app/view_model/product_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
// import '../../../core/services/db_helper.dart';
// import '../../../core/utils/constants/constant_color.dart';
// import '../../../models/cart_model.dart';
// import '../../../view_model/cart_view_model.dart';
// import 'order_sub_widget/order_details_add_sub_widget.dart';
//
//
// /// TODO: remove this file after test order-------------------------------------
// class OrderAddToCartWidget extends StatelessWidget {
//   final ProductModel product;
//   final int productId;
//
//   const OrderAddToCartWidget({
//     Key? key,
//     required this.product,
//     required this.productId,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final FavoriteViewModel favoriteViewModel = Provider.of<FavoriteViewModel>(context);
//     return Consumer<CartViewModel>(
//       builder: (context, orderNotify, child) {
//         return Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.only(left: 2.h, right: 2.h),
//           height: 9.h,
//           decoration: const BoxDecoration(
//             color: AppColor.backgroundPageViewColor,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: ()async{
//                   CartModel cartModel = CartModel(
//                     itemId: product.id,
//                     itemName: product.title,
//                     itemImage: product.thumbnail,
//                     itemPrice: product.price!.toDouble(),
//                     itemQty: context.read<OrderItemViewModel>().qty,
//                     itemTotalPrices: 1061,
//                   );
//                   print('the cart insert data are $cartModel');
//
//                  context.read<OrderItemViewModel>().checkCartId(product.id!) == false
//                      ? await orderNotify.insertItemToCart(cartModel)
//                      : await context.read<OrderItemViewModel>().updateCartData(cartModel);
//                   orderNotify.increaseCounter();
//                   // showBottomSheet(
//                   //     context: context,
//                   //     builder: (context) {
//                   //       return OrderDetailsAddSubWidget();
//                   //     });
//                 },
//                 style: ButtonStyle(
//                     backgroundColor:
//                         const MaterialStatePropertyAll(AppColor.kMainColor),
//                     shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(1.h)))),
//                     fixedSize: MaterialStateProperty.all(Size(39.h, 4.h))),
//                 child: Text(
//                   'Add to Cart',
//                   style: TextStyle(fontSize: 12.sp),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (favoriteViewModel.favoriteData[productId] == "1") {
//                     favoriteViewModel.isFavorite(productId, "0");
//                     favoriteViewModel.deleteProductFromFavorite(product);
//                     // print(favorite);
//                   } else {
//                     favoriteViewModel.isFavorite(productId, "1");
//                     favoriteViewModel.addFavoriteItem(product);
//                     //  print(favorite);
//                   }
//                 },
//                 style: ButtonStyle(
//                     backgroundColor:
//                         const MaterialStatePropertyAll(Colors.transparent),
//                     elevation: const MaterialStatePropertyAll(0),
//                     shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                         side: const BorderSide(color: AppColor.kMainColor),
//                         borderRadius: BorderRadius.all(Radius.circular(1.h)))),
//                     fixedSize: MaterialStateProperty.all(Size(0.5.h, 4.h))),
//                 child: favoriteViewModel.favoriteData[productId] != "1"
//                     ? Icon(
//                         Icons.favorite_border,
//                         color: Colors.grey,
//                         size: 18.sp,
//                       )
//                     : Icon(Icons.favorite,
//                         color: AppColor.kIconColor, size: 18.sp),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
