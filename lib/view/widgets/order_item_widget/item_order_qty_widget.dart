/*
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';
import '../../../view_model/cart_view_model.dart';

class ItemOrderQtyWidget extends StatelessWidget {
  final ProductModel product;

  const ItemOrderQtyWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userViewModel = context.read<ProductViewModel>();
    return SizedBox(
      height: 8.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Consumer<ProductViewModel>(builder: (context, userNotify, child) {
            return IconButton(
              onPressed: product.quantity <= 0
                  ? null
                  : () {
                      product.quantity <= 0
                          ? null
                          : userNotify.decrementProductQty(product.id!);
                      userNotify.itemTotalPriceDecrease(
                        id: product.id,
                        itemQty: product.quantity,
                        price: product.price!.toDouble(),
                        /// change floor to double
                        perc: product.discountPercentage!.floorToDouble(),
                      );
                      //cartViewModel.removeCounter();
                      // cartViewModel.itemTotalPriceIncrease(userViewModel
                      //     .calcPriceWithPercentage(product.price!,
                      //     product.discountPercentage!.floor()));
                    },
              icon: Icon(
                Icons.remove_circle_outline,
                size: 5.h,
                color: product.quantity <= 0 ? Colors.grey : Colors.red,
              ),
            );
          }),
          Align(
            alignment: Alignment.center,
            child: Consumer<ProductViewModel>(
              builder: (context, userNotify, child) {
                final index = userNotify.productModelView!.products!.indexOf(product);
                return Text(
                   product.quantity.toString(),
                  //item.toString(),
                  // cartNotify.items.elementAt(index).itemQty != null ? product.quantity : cartNotify.items.elementAt(index).itemQty,
                  //product.quantity.toString(),
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),
          Consumer<ProductViewModel>(builder: (context, userNotify, child) {
            return IconButton(
              onPressed: () {
                userViewModel.incrementProductQty(product.id!);
                userNotify.itemTotalPriceIncrease(
                  id: product.id,
                  itemQty: product.quantity,
                  /// add toDouble
                  price: product.price!.toDouble(),
                  perc: product.discountPercentage!.floorToDouble(),
                  //perc: product.discountPercentage!.floor(),
                );

                //cartViewModel.addCounter();
                //cartViewModel.incrementQty(product.id!);
                // cartViewModel.itemTotalPriceIncrease(userViewModel
                //     .calcPriceWithPercentage(product.price!,
                //     product.discountPercentage!.floor()));
              },
              icon: Icon(
                Icons.add_circle_outline,
                size: 5.h,
                color: AppColor.kMainColor,
              ),
            );
          }),
        ],
      ),
    );
  }
}
*/
