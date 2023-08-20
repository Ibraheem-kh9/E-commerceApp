import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/services/db_helper.dart';
import '../../../core/utils/constants/constant_color.dart';
import '../../../models/cart_model.dart';

import '../../../view_model/cart_view_model.dart';

/*class ItemOrderAddToCartWidget extends StatelessWidget {
  final Product product;
  const ItemOrderAddToCartWidget({Key? key,required this.product}) : super(key: key);
  DbHelper dbHelper = DbHelper();
  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context, cartNotify, child) {
        return ElevatedButton(
          onPressed: () async {
            CartModel cartItem = CartModel(
              itemId: product.id,
              itemName: product.title,
              itemImage: product.images!.first,
              itemPrice: product.price,
              itemQty: product.quantity,
              itemTotalPrices: product.totalProductPrice,
            );
            //cartNotify.saveCart();
            cartNotify.addItem(cartItem);
            // cartNotify.setItemZero();
            // cartNotify.setTotalPriceToZero();
            Navigator.pop(context);
          },
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(AppColor.kMainColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(20.h))),
            ),
            minimumSize:
            MaterialStateProperty.all(Size(38.w, 5.7.h)),
            maximumSize:
            MaterialStateProperty.all(Size(38.w, 5.7.h)),
            //fixedSize: MaterialStateProperty.all(Size(60.0, 30.0))
          ),
          child: Text(
            'Add To Cart',
            style: TextStyle(fontSize: 12.sp),
          ),
        );
      },
    );
  }
}*/

class ItemOrderAddToCartWidget extends StatefulWidget {
  final Product product;
  const ItemOrderAddToCartWidget({Key? key,required this.product}) : super(key: key);

  @override
  State<ItemOrderAddToCartWidget> createState() => _ItemOrderAddToCartWidgetState();
}

class _ItemOrderAddToCartWidgetState extends State<ItemOrderAddToCartWidget> {
  DbHelper? dbHelper = DbHelper();
  ProductViewModel userViewModel = ProductViewModel();
  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context, cartNotify, child) {
        return ElevatedButton(
          onPressed: () async {
            CartModel cartItem = CartModel(
              id: widget.product.id,
              itemId: widget.product.id,
              itemName: widget.product.title,
              itemImage: widget.product.images!.first,
              /// add toDouble
              itemPrice: widget.product.price!.floorToDouble(),
              itemQty: widget.product.quantity,
              itemTotalPrices: widget.product.totalProductPrice!.floorToDouble(),
            );
             dbHelper!.insertDb(cartItem).then((value) => print(value.id))/*.onError((error, stackTrace) => error.toString())*/;
            //cartNotify.cartTotalPriceIncrease(qty: widget.product.quantity,itemPrice: widget.product.totalProductPrice);
            cartNotify.cartSubTotalPrice(widget.product.totalProductPrice!);
             cartNotify.addCounter();
             cartNotify.setCartSelectedItems(selectStatus: true,id: widget.product.id);
             Navigator.pop(context);
          },
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(AppColor.kMainColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(20.h))),
            ),
            minimumSize:
            MaterialStateProperty.all(Size(38.w, 5.7.h)),
            maximumSize:
            MaterialStateProperty.all(Size(38.w, 5.7.h)),
            //fixedSize: MaterialStateProperty.all(Size(60.0, 30.0))
          ),
          child: Text(
            'Add To Cart',
            style: TextStyle(fontSize: 12.sp),
          ),
        );
      },
    );
  }
}

