import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/view/widgets/favorite_screen_widget/icon_button_widget.dart';
import 'package:e_commerce_app/view/widgets/favorite_screen_widget/text_favorite_widget.dart';
import 'package:e_commerce_app/view_model/favorite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../core/services/db_helper.dart';
import '../../core/utils/constants/constant_color.dart';
import '../../models/cart_model.dart';
import '../../view_model/cart_view_model.dart';
import '../../view_model/product_view_model.dart';

class FavoriteItemSc extends StatelessWidget {
  const FavoriteItemSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DbHelper? dbHelper = DbHelper();
    AppLocale appLocale = AppLocale.of(context);
    final productVMdl = context.read<ProductViewModel>();
    final cartViewModel = context.read<CartViewModel>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<FavoriteViewModel>(
          builder: (context, favoriteNotify, child) {
            if (favoriteNotify.getItemsOfFavoriteList.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/empty_list.png',
                  ),
                  Text(
                    appLocale.getTranslated('favorite_no_data')!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              );
            } else {
              return ListView.builder(
                itemCount: favoriteNotify.getItemsOfFavoriteList.length,
                itemBuilder: (context, index) {
                  final product =
                      productVMdl.productModelView!.products![index];
                  return Container(
                    // width: 100,
                    // height: 99.0,
                    margin: EdgeInsets.only(
                      bottom: 1.h,
                      left: 2.h,
                      right: 2.h,
                      top: 1.h,
                    ),

                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      color: AppColor.kIconColor.withOpacity(0.2),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Image.network(
                            favoriteNotify
                                .getItemsOfFavoriteList[index].favoriteImage!,
                            height: 13.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 1.h),
                              width: 45.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: TextFavoriteWidget(
                                      favoriteText: favoriteNotify
                                          .getItemsOfFavoriteList[index]
                                          .favoriteItemName!,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                      textColor: Colors.black,
                                      textDecoration: TextDecoration.none,
                                      decorationColor: Colors.transparent,
                                      decorThickness: 0.0,
                                      textOverflow: TextOverflow.fade,
                                      softWrap: false,
                                    ),
                                  ),
                                  Flexible(
                                    child: TextFavoriteWidget(
                                      favoriteText:
                                          product.totalProductPrice.toString(),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                      textColor: Colors.black,
                                      textDecoration: TextDecoration.none,
                                      decorationColor: Colors.transparent,
                                      decorThickness: 0.0,
                                      textOverflow: TextOverflow.fade,
                                      softWrap: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 1.h, top: 1.h),
                              child: Row(
                                children: [
                                  TextFavoriteWidget(
                                    favoriteText:
                                        '${favoriteNotify.getItemsOfFavoriteList[index].favoriteItemPrice} \$',
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.normal,
                                    textColor: AppColor.kDescriptionTextColor,
                                    textDecoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.red,
                                    decorThickness: 1.5,
                                  ),
                                  SizedBox(
                                    width: 1.h,
                                  ),
                                  TextFavoriteWidget(
                                    favoriteText:
                                        '${productVMdl.calcPriceWithPercentage(favoriteNotify.getItemsOfFavoriteList[index].favoriteItemPrice!, favoriteNotify.getItemsOfFavoriteList[index].favoriteItemDiscount!.floorToDouble()).toString()} \$',
                                    //'${userNotify.calcPriceWithPercentage(userNotify.favList[index].favoriteItemPrice!, userNotify.favList[index].favoriteItemDiscount!.floor()).toString()} \$',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    textColor: AppColor.kDefaultTextColor,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 25.h,
                              height: 7.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        IconButtonWidget(
                                          onPress: () {
                                            //cartViewModel.itemQuantity <= 0 ? null : cartViewModel.itemQtyDecrease();

                                            product.quantity <= 0
                                                ? null
                                                : productVMdl.decrementProductQty(
                                                    favoriteNotify
                                                        .getItemsOfFavoriteList[
                                                            index]
                                                        .favoriteItemId!);
                                            productVMdl.itemTotalPriceDecrease(
                                              id: favoriteNotify
                                                  .getItemsOfFavoriteList[index]
                                                  .favoriteItemId,
                                              itemQty: product.quantity,
                                              price: favoriteNotify
                                                  .getItemsOfFavoriteList[index]
                                                  .favoriteItemPrice,

                                              /// change floor to double
                                              perc: favoriteNotify
                                                  .getItemsOfFavoriteList[index]
                                                  .favoriteItemDiscount!
                                                  .toDouble(),
                                            );
                                            //cartViewModel.removeCounter();
                                            // cartViewModel.itemTotalPriceIncrease(userViewModel
                                            //     .calcPriceWithPercentage(product.price!,
                                            //     product.discountPercentage!.floor()));
                                          },
                                          icon: Icons.remove_circle_outline,
                                          iconSize: 17.sp,
                                          color: cartViewModel.itemQuantity <= 0
                                              ? Colors.grey
                                              : AppColor.kMainColor,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Consumer<CartViewModel>(
                                            builder:
                                                (context, cartNotify, child) {
                                              print(
                                                product.quantity.toString(),
                                              );
                                              return TextFavoriteWidget(
                                                // favoriteText: product.quantity.toString(),
                                                favoriteText: favoriteNotify
                                                    .favList
                                                    .elementAt(index)
                                                    .favoriteQty
                                                    .toString(),
                                                //'${userNotify.calcPriceWithPercentage(userNotify.favList[index].favoriteItemPrice!, userNotify.favList[index].favoriteItemDiscount!.floor()).toString()} \$',
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                                textColor: Colors.black,
                                              );
                                            },
                                          ),
                                        ),
                                        IconButtonWidget(
                                          onPress: () {
                                            //cartViewModel.itemQtyIncrease();
//cartViewModel.itemTotalPrice(product!.price);

                                            //  productVMdl.incrementProductQty(favoriteNotify.getItemsOfFavoriteList[index].favoriteItemId!);

                                            favoriteNotify.incrementProductQty(
                                                favoriteNotify
                                                    .getItemsOfFavoriteList[
                                                        index]
                                                    .favoriteItemId!);
                                            productVMdl.itemTotalPriceIncrease(
                                              id: favoriteNotify
                                                  .getItemsOfFavoriteList[index]
                                                  .favoriteItemId,
                                              itemQty: product.quantity,
                                              price: favoriteNotify
                                                  .getItemsOfFavoriteList[index]
                                                  .favoriteItemPrice,

                                              /// change floor to double
                                              perc: favoriteNotify
                                                  .getItemsOfFavoriteList[index]
                                                  .favoriteItemDiscount!
                                                  .toDouble(),
                                              //perc: product.discountPercentage!.floor(),
                                            );

                                            //cartViewModel.addCounter();
                                            //cartViewModel.incrementQty(product.id!);
                                            // cartViewModel.itemTotalPriceIncrease(userViewModel
                                            //     .calcPriceWithPercentage(product.price!,
                                            //     product.discountPercentage!.floor()));
                                          },
                                          icon: Icons.add_circle,
                                          iconSize: 17.sp,
                                          color: AppColor.kMainColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      CartModel cartItem = CartModel(
                                        itemId: favoriteNotify
                                            .getItemsOfFavoriteList[index]
                                            .favoriteItemId,
                                        itemName: favoriteNotify
                                            .getItemsOfFavoriteList[index]
                                            .favoriteItemName,
                                        itemImage: favoriteNotify
                                            .getItemsOfFavoriteList[index]
                                            .favoriteImage!,
                                        itemPrice: favoriteNotify
                                            .getItemsOfFavoriteList[index]
                                            .favoriteItemPrice,
                                        itemQty: product.quantity,
                                        itemTotalPrices:
                                            product.totalProductPrice,
                                      );
                                      dbHelper
                                          .insertDb(cartItem)
                                          .then((value) => print(value.id));
                                      cartViewModel.cartSubTotalPrice(
                                          product.totalProductPrice!);
                                      cartViewModel.addCounter();
                                      // cartNotify.cartSubTotalPrice(widget.product.totalProductPrice!);
                                      // cartViewModel.addItem(cartItem);
                                      //  cartViewModel.setIsAddedStatus(
                                      //      true,
                                      //      favoriteNotify
                                      //          .getItemsOfFavoriteList[index]
                                      //          .favoriteItemId!);

                                      ////

/*                                      CartModel cartItem = CartModel(
                                        id: widget.product.id,
                                        itemId: widget.product.id,
                                        itemName: widget.product.title,
                                        itemImage: widget.product.images!.first,
                                        /// add toDouble
                                        itemPrice: widget.product.price!.floorToDouble(),
                                        itemQty: widget.product.quantity,
                                        itemTotalPrices: widget.product.totalProductPrice!.floorToDouble(),
                                      );
                                      dbHelper!.insertDb(cartItem).then((value) => print(value.id))*/ /*.onError((error, stackTrace) => error.toString())*/ /*;
                                      //cartNotify.cartTotalPriceIncrease(qty: widget.product.quantity,itemPrice: widget.product.totalProductPrice);
                                      cartNotify.cartSubTotalPrice(widget.product.totalProductPrice!);*/
                                    },
                                    style: ButtonStyle(
                                        alignment: Alignment.center,
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                AppColor.kMainColor),
                                        overlayColor: MaterialStatePropertyAll(
                                            Color(0xFF5A6EA9)),
                                        elevation:
                                            MaterialStatePropertyAll(0.0),
                                        maximumSize: MaterialStatePropertyAll(
                                            Size.copy(Size(45, 25))),
                                        minimumSize: MaterialStatePropertyAll(
                                            Size.copy(Size(45, 25))),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(40.0))))),
                                    child: cartViewModel.isAdded == false
                                        ? Icon(Icons.add_shopping_cart,
                                            size: 15.0)
                                        : Icon(
                                            Icons.done,
                                            size: 15.0,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        IconButtonWidget(
                          onPress: () {
// FavoriteModel favItem = FavoriteModel(
//   favoriteItemId: product.id,
//   favoriteItemName: product.title,
//   favoriteItemDiscount: product.discountPercentage!.toInt(),
//   favoriteItemPrice: product.price,
//   favoriteImage: product.images!.first,
// );
                            favoriteNotify.removeFavoriteItem(
                              favoriteNotify.getItemsOfFavoriteList[index],
                              favoriteNotify.getItemsOfFavoriteList[index]
                                  .favoriteItemId!,
                              //favoriteNotify.favList[index].favoriteItemId!,
                            );
                            productVMdl.productModelView!.products!
                                .elementAt(index)
                                .isFavorite = false;
                          },
                          icon: Icons.close,
                          iconSize: 17.sp,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
